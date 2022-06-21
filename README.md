# Apache

 ### :bulb: 아파치(Apache)란 무엇입니까?  
*아파치 HTTP 서버는 아파치 소프트웨어 재단에서 관리하는 오픈 소스, 크로스 플랫폼 HTTP 웹 서버 소프트웨어입니다.*   
######  _출처 - [위키백과](https://ko.wikipedia.org/wiki/%EC%95%84%ED%8C%8C%EC%B9%98_HTTP_%EC%84%9C%EB%B2%84)_

#### 사용 권장 사항
##### *다음 권장 사항은 2.4 버전을 기준으로 작성되었습니다.*
###### [Apache HTTP Server Version 2.0 문서](https://httpd.apache.org/docs/2.0/)   
###### [Apache HTTP Server Version 2.2 문서](https://httpd.apache.org/docs/2.2/)   
###### [Apache HTTP Server Version 2.4 문서](https://httpd.apache.org/docs/2.4/)     
<br>    

-------

#### 요구 사항   

- **최소 50MB 이상**   
  ##### **실제로 약 10MB의 디스크 공간을 차지하지만, 선택한 구성 옵션과 추가 모듈에 따라 차이가 발생합니다.*
- **ANSI-C 컴파일러와 컴파일 시스템**  
  ##### ** [Free Software Foundation](http://www.gnu.org/) (FSF)의 [GNU C compiler (GCC)](http://www.gnu.org/software/gcc/index.html)를 권장합니다..* 
- **시간 설정**
  ##### **HTTP 프로토콜에는 시간을 표현하는 부분이 있습니다.NTP(Network Time Protocol)에 기반한 ntpdate나 xntpd를 사용해야 합니다.*  
- **Perl 5 [선택사항]**
  ##### * *apxs나 dbmmanage와 같은 지원 스크립트를 위해 Perl 5 인터프리터가 필요합니다.*  
 
 ----
#### 설치 방법
##### **RHEL 7 혹은 CentOS7기반으로 패키지를 설치하기 때문에 다른 OS의 경우 오류가 발생할 수 있습니다.*
__1. git clone을 통해 해당 git repository를 복사합니다.__   
```
git clone https://github.com/Dev-0ops/apache.git

```
__2. chmod 700 install.sh 명령어를 통해 관리자 권한을 부여합니다.__   

__3. install.sh 스크립트를 실행합니다.__
```
./install.sh
```
__4. apache 관련 패키지 파일을 설치합니다.__

__5. apache 파일 설치 경로를 입력합니다.__

__6. apache 필수 라이브러리 설치 경로를 입력합니다.__  
_- 6-1 pcre 라이브러리의 버전을 입력합니다._  
_- 6-2 apr 라이브러리의 설치 버전을 입력합니다._   
_- 6-3 apr-util 라이브러리의 설치 버전을 입력합니다._

__7. apache의 설치 버전을 입력합니다.__


