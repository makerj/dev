from distutils.sysconfig import get_python_inc
import platform
import os
import ycm_core
import subprocess

flags = [
    '-Wall',
    '-Wextra',
    '-Wno-long-long',
    '-Wno-unused-parameter',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-std=gnu11',
    '-x', 'c',
    '-I', os.path.join(os.getcwd(), 'include'),
    '-I', os.path.join(os.getcwd(), 'test/include'),
    '-I', os.path.join(os.getcwd(), 'src/gen/include'),
]

# include gcc system include dirs
with os.popen("gcc -E -Wp,-v -xc /dev/null 2>&1 | awk '/#include <...> search starts here:/{f=1;next} /End of search list/{f=0} f'") as pipe:
    header_directories = pipe.read().split('\n')
    while header_directories:
        flags += ['-isystem', header_directories.pop(0)]

# include conan library include dirs
with os.popen("find ~/.conan/data -type d -regextype sed -regex '.*\/package\/[a-z0-9]\{40\}\/include'") as pipe:
    header_directories = pipe.read().split('\n')
    while header_directories:
        flags += ['-I', header_directories.pop(0)]

# JNI headers
try:
    javah_path = subprocess.check_output('realpath `which javah`', shell=True)
    jdk_home = os.path.dirname(os.path.dirname(javah_path))
    flags += ['-I', os.path.join(jdk_home, 'include')]
    flags += ['-I', os.path.join(jdk_home, 'include', platform.system().lower())]
    flags += ['-D', 'COREDDS_VERSION="{}"'.format(subprocess.check_output("git log --pretty=format:'%h' -n 1", shell=True))]
except:
    pass

# include project include dirs
flags += ['-I', 'include']

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.h', '.hxx', '.hpp', '.hh' ]


def GetCompilationInfoForFile( filename ):
  # The compilation_commands.json file generated by CMake does not have entries
  # for header files. So we do our best by asking the db for flags for a
  # corresponding source file, if any. If one exists, the flags for that file
  # should be good enough.
  if IsHeaderFile( filename ):
    basename = os.path.splitext( filename )[ 0 ]
    for extension in SOURCE_EXTENSIONS:
      replacement_file = basename + extension
      if os.path.exists( replacement_file ):
        compilation_info = database.GetCompilationInfoForFile(
          replacement_file )
        if compilation_info.compiler_flags_:
          return compilation_info
    return None
  return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
  if not database:
    return {
      'flags': flags,
      'include_paths_relative_to_dir': DirectoryOfThisScript()
    }

  compilation_info = GetCompilationInfoForFile( filename )
  if not compilation_info:
    return None

  # Bear in mind that compilation_info.compiler_flags_ does NOT return a
  # python list, but a "list-like" StringVec object.
  final_flags = list( compilation_info.compiler_flags_ )

  # NOTE: This is just for YouCompleteMe; it's highly likely that your project
  # does NOT need to remove the stdlib flag. DO NOT USE THIS IN YOUR
  # ycm_extra_conf IF YOU'RE NOT 100% SURE YOU NEED IT.
  try:
    final_flags.remove( '-stdlib=libc++' )
  except ValueError:
    pass

  return {
    'flags': final_flags,
    'include_paths_relative_to_dir': compilation_info.compiler_working_dir_
  }
