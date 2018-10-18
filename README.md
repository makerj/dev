# DEV
개발 환경 자동 구축 스크립트 모음.

데비안 계열의 리눅스 배포판을 지원합니다. 현재 Ubuntu 16.04 (AMD64), Ubuntu 18.04 (AMD64) 플랫폼에서 테스트 및 실사용 중입니다.

## 사용 방법
필수 스크립트는 `setup` 스크립트를 호출하면 모두 적용됩니다. 나머지 스크립트는 optional 디렉토리로 이동한 뒤, 직접 실행합니다.
```
git clone https://github.com/makerj/dev.git
cd dev
./setup
```

## 다루는 것들
- essential
  - PPA 관리
  - 터미널 관리
  - 데스크탑 환경 관리
  - vim 커스터마이징
  - shell 커스터마이징
  - git 커스터마이징
- optional
  - 프로그래밍 언어별 개발 환경 구축
  - go
  - nodejs LTS
  - python
  - rust
  - 기타 등등

### VIM을 사용한 개발
시스템 프로그래밍을 하기 위해 다양한 IDE와 text edtior를 사용해 본 결과, VIM이 가장 C/C++ 언어를 사용한 개발에 효율적이라는 결론을 내렸습니다.
물론 이 저장소가 제공하는 다른 언어에 대해서도 VIM을 사용한 개발이 충분히 가능하나, 다른 언어의 경우 Jetbrains의 IDE의 도움을 받는 것이 효율이 더 좋습니다.

VIM8에 커스터마이징 된 단축키와 플러그인이 자동으로 설치됩니다. 플러그인의 규모가 크기 때문에 200MB이상의 저장 공간과 충분한 빌드 시간이 필요합니다.

#### 키 바인딩
공통
- `F2` NerdTree 호출
  - 디렉토리 구조를 보여줍니다
  - git을 사용중인 디렉토리는 변경 사항 강조 또한 이루어집니다
- `F3` TagBar 호출
  - 현재 작업 중인 소스코드의 전역 변수, 타입 선언, 함수 선언, 함수 목록을 보여줍니다
  - 최적화된 플러그인이 아니라서 랙을 유발합니다. 1000줄 이상의 파일 작업시엔 필요할때만 켜주세요.
- `F7` 맞춤법 검사기 토글
- `F8` Tab을 8스페이스로 취급 (기본값은 4 스페이스)
- `F9` shell 호출. 호출된 shell에서 `exit`을 입력하면 vim으로 돌아옵니다
- `F10` 빌드 시스템 호출 (CMake, Make 순으로 선호)
- `Ctrl-F10` 빌드 시스템 호출. 빌드 타겟을 지정할 수 있습니다. (CMake, Make 순으로 선호)
- `F12` 작업중인 모든 파일을 저장하고 종료
- `Space` vim window 포커스 전환. 좌에서 우로 순환합니다
- `Shift-e` 현재 디렉토리 내의 모든 파일을 대상으로 검색을 시작합니다
- `Ctrl-e` 열려있는 버퍼를 대상으로 검색을 시작합니다
- `Ctrl-j` 현재 라인 또는 선택된 라인을 한칸 위로 올립니다
- `Ctrl-k` 현재 라인 또는 선택된 라인을 한칸 아래로 내립니다
- `,w` 왼쪽 버퍼 탭으로 이동
- `,e` 오른쪽 버퍼 탭으로 이동
- `,z` 현재 버퍼 탭 닫기
- `,d` doxygen 주석을 자동으로 생성합니다
- `,g` 현재 심볼을 모든 텍스트에서 검색합니다
- `,q` 현재 함수의 doxygen 문서를 preview 윈도우에 출력합니다
- `,f` 현재 라인의 문법 오류 및 경고를 자동으로 수정합니다
- `,j` 현재 함수가 호출하는 모든 함수를 추적합니다
- `,J` 현재 함수를 호출하는 모든 함수를 추적합니다
- `,n` 현재 커서 아래에 있는 숫자를 다양한 단위로 재해석해 화면에 출력합니다
- `,t` 현재 커서 아래에 있는 C,C++ 타입의 최종 타입을 출력합니다. typedef, auto 등으로 감춰진 타입의 실제 타입을 알아냅니다
- `,p` 현재 작업중인 파일의 상대 경로를 출력합니다
- `,P` 현재 작업중인 파일의 절대 경로를 출력합니다
- `,v` Git 로그 분석 툴 `tig`를 호출합니다
- `,Space` 라인 넘버를 현재 라인에 상대적인 값으로 출력하도록 토글합니다


#### C
자동 완성 및 소스코드 분석을 최대한 효율적으로 하기 위해 VIM8 + [YCM](https://github.com/Valloric/YouCompleteMe) + [universal-ctags](https://github.com/universal-ctags/ctags)으로 구성된 개발 환경을 제공합니다.
- 최신 플러그인들을 지원하기 위해 VIM8이 자동으로 설치됩니다
- 자동 완성 & 자동 정정 & 호출부 이동 & 정의부 이동을 위해 clang을 통해 소스를 분석하는 YCM을 사용합니다
- 현재 작업중인 소스코드의 아웃라인을 볼 수 있도록 universal-ctags를 사용합니다
- ctags를 위한 태그 데이터베이스는 프로젝트의 루트 디렉토리에서 터미널 명령 `tags`를 입력하면 자동으로 구축됩니다
- 빠른 문서화를 위해 doxygen 주석 자동 생성을 지원합니다


### 터미널 유틸리티
어플리케이션 및 시스템 개발, 그리고 서버 관리를 편하게 할 수 있도록 터미널의 최대한 많은 것들을 효율적으로 커스터마이징합니다. 
- 사실상의 리눅스 표준 쉘인 Bash와 잘 호환되고, 편리성은 더 높은 [zsh](http://www.zsh.org/)을 사용합니다
- zsh 커스터마이징 및 플러그인 관리에 [oh-my-zsh](http://ohmyz.sh/)을 사용합니다
- tmux의 사용을 최소화하는 대신, 최대한 많은 것을 한 터미널에서 합니다
- 디렉토리 이동에 `z`를 사용합니다. z를 사용하면 현재 자신이 어느 디렉토리에 있더라도 편리하게 이전에 방문한 디렉토리로 이동할 수 있습니다
- 이전에 사용한 터미널 명령을 기억합니다. 이전에 내린 명령은 힌트 형태로 나타나며, End키 또는 ->화살표를 사용해 사용할 수 있습니다
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) 플러그인을 사용해 각종 리눅스 유틸리티의 매개변수를 탭으로 완성할 수 있습니다

