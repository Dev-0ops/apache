# Apache

 ### :bulb: 아파치(Apache)란 무엇입니까?  
*아파치 HTTP 서버는 아파치 소프트웨어 재단에서 관리하는 오픈 소스, 크로스 플랫폼 HTTP 웹 서버 소프트웨어입니다.*   
######  _출처 - [위키백과](https://ko.wikipedia.org/wiki/%EC%95%84%ED%8C%8C%EC%B9%98_HTTP_%EC%84%9C%EB%B2%84)_

#### 사용 권장 사항
##### *다음 권장 사항은 2.4 버전을 기준으로 작성되었습니다.*
###### [Apache HTTP Server Version 2.0 문서](https://httpd.apache.org/docs/2.0/)   
###### [Apache HTTP Server Version 2.2 문서](https://httpd.apache.org/docs/2.2/)   
###### [Apache HTTP Server Version 2.4 문서](https://httpd.apache.org/docs/2.2/)     
<br>

#### 요구 사항   

- **최소 50MB 이상**   
  ##### **실제로 약 10MB의 디스크 공간을 차지하지만, 선택한 구성 옵션과 추가 모듈에 따라 차이가 발생합니다.*
- **ANSI-C 컴파일러와 컴파일 시스템**  
  ##### ** [Free Software Foundation](http://www.gnu.org/) (FSF)의 [GNU C compiler (GCC)](http://www.gnu.org/software/gcc/index.html)를 권장합니다..* 
- **시간 설정**
  ##### **HTTP 프로토콜에는 시간을 표현하는 부분이 있습니다.NTP(Network Time Protocol)에 기반한 ntpdate나 xntpd를 사용해야 합니다.*  
- **Perl 5 [선택사항]**
  ##### * *apxs나 dbmmanage와 같은 지원 스크립트를 위해 Perl 5 인터프리터가 필요합니다.*  
 
#### 설치 방법


