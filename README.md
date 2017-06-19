# DEV
개발 환경 자동 구축 스크립트. 데비안 계열의 리눅스 배포판을 지원합니다.

이 스크립트는 Ubuntu 16.04 (x86_64) 플랫폼에서 테스트 및 실사용 중입니다.

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
        - nodejs
        - python
        - rust
    - 기타 등등

### VIM을 사용한 개발
시스템 프로그래밍을 하기 위해 다양한 IDE와 text edtior를 사용해 본 결과, VIM이 가장 C/C++ 언어를 사용한 개발에 효율적이라는 결론을 내렸습니다.
물론 이 저장소가 제공하는 다른 언어에 대해서도 VIM을 사용한 개발이 충분히 가능하나, 다른 언어의 경우 Jetbrains의 IDE의 도움을 받는 것이 효율이 더 좋습니다.

VIM8에 커스터마이징 된 단축키와 플러그인이 자동으로 설치됩니다. 플러그인의 규모가 크기 때문에 200MB이상의 저장 공간과 충분한 빌드 시간이 필요합니다.

#### C
자동 완성 및 소스코드 분석을 최대한 효율적으로 하기 위해 VIM8 + [YCM](https://github.com/Valloric/YouCompleteMe) + [cscope](http://cscope.sourceforge.net/)+ [universal-ctags](https://github.com/universal-ctags/ctags)으로 구성된 개발 환경을 제공합니다.
- 최신 플러그인들을 지원하기 위해 VIM8이 자동으로 설치됩니다
- 자동 완성 & 자동 정정 & 호출부 이동 & 정의부 이동을 위해 clang을 통해 소스를 분석하는 YCM을 사용합니다
- 현재 작업중인 소스코드의 아웃라인을 볼 수 있도록 universal-ctags를 사용합니다
- 소스코드의 Call Graph를 볼 수 있도록 cscope + CCTree vim plugin을 사용합니다
- ctags와 cscope를 위한 태그 데이터베이스는 프로젝트의 루트 디렉토리에서 터미널 명령 `tags`를 입력하면 자동으로 구축됩니다
- 빠른 문서화를 위해 doxygen 주석 자동 생성을 지원합니다
