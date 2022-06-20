#!/bin/bash

echo "해당 프로그램은 Apahce 설치에 대한 자동화 script 입니다."
echo "1. 제시한 부분에 대한 명시가 없을 시, (Default) 설정을 따르게 됩니다."
echo "2. 최소 50MB의 디스크 용량을 요구합니다."
echo "3. ANSI-C 컴파일러와 컴파일 시스템를 요구합니다."
echo "4. Perl 5 모듈을 추가로 설치합니다."
echo "5. apache 1.x 버전은 지원하지 않습니다."

echo "yum pakage를 업데이트 합니다."
sudo yum update

######################## 필수 패키지 설치 ##########################

echo "wget 라이브러리가 있는지 확인합니다."

yum list installed | grep wget
if [ $? -ne 0 ]
then
    echo "wget 라이브러리를 설치합니다."
    yum install -y gcc
fi

echo "gcc 라이브러리가 있는지 확인합니다."
yum list installed | grep ^gcc.x86_64
if [ $? -ne 0 ]
then
    echo "gcc 라이브러리를 설치합니다."
    yum install -y gcc
fi

echo "gcc-c++ 라이브러리가 있는지 확인합니다."
yum list installed | grep ^gcc-c++.x86_64
if [ $? -ne 0 ]
then
    echo "gcc-c++ 라이브러리를 설치합니다."
    yum install -y gcc-c++
fi

echo "zlib-devel 라이브러리가 있는지 확인합니다."
yum list installed | grep zlib-devel
if [ $? -ne 0 ]
then
    echo "zlib-devel 라이브러리를 설치합니다."
    yum install -y zlib-devel
fi

echo "openssl 라이브러리가 있는지 확인합니다."
yum list installed | grep openssl
if [ $? -ne 0 ]
then
    echo "openssl 라이브러리를 설치합니다."
    yum install -y openssl
fi

echo "openssl-devel 라이브러리가 있는지 확인합니다."
yum list installed | grep openssl-devel
if [ $? -ne 0 ]
then
    echo "openssl-devel 라이브러리를 설치합니다."
    yum install -y openssl-devel
fi

echo "pcre-devel 라이브러리가 있는지 확인합니다."
yum list installed | grep pcre-devel
if [ $? -ne 0 ]
then
    echo "pcre-devel 라이브러리를 설치합니다."
    yum install -y pcre-devel
fi

echo "expat-devel 라이브러리가 있는지 확인합니다."
yum list installed | expat-devel
if [ $? -ne 0 ]
then
    echo "expat-devel 라이브러리를 설치합니다."
    yum install -y expat-devel
fi

######################## 설치 디렉토리 설정 ##########################

echo "아파치를 설치할 경로를 입력해 주세요."
echo "기본 경로를 사용하려면 Enter를 입력해주세요.(기본 경로 /usr/local/apahce)"
read ADIR

if [ -d "$ADIR"]; then
    echo "설정한 경로는 $ADIR 입니다."
else 
    ADIR=/usr/local/apahce
    mkdir -p /usr/local/apahce
    echo "기본 경로 $ADIR 을 사용합니다."
fi




######################## 필수 라이브러리 설치 ##########################

echo "라이브러리의 설치 경로를 입력해주세요."
echo "기본 경로를 사용하려면 Enter를 입력해주세요.(기본 경로 /usr/local/src)"
read LDIR

echo "pcre 라이브러리를 설치합니다."
echo "가장 최신 버전을 설치 하려면 Enter를 입력해주세요.(8.45)"
read pev

if [ "$pev" = "" ]; then
    wget  https://sourceforge.net/projects/pcre/files/pcre/8.45/pcre-8.45.tar.gz -P $LDIR
    tar -zxvf $LDIR/pcre-8.45.tar.gz
else
    wegt https://sourceforge.net/projects/pcre/files/pcre/$pev/pcre-$pev.tar.gz -P $LDIR
        if [ $? -ne 0 ]; then
            echo "존재하지 않는 Perl 버전이거나, 설치 경로가 변경되었을 수 있습니다."
            echo "공식 문서를 확인해 주세요.(https://www.cpan.org/src/README.html)"
            exit 0
        fi
    tar -zxvf $LDIR/pcre-$pev.tar.gz

fi

echo "apr 라이브러리를 설치합니다."
echo "가장 최신 버전을 설치 하려면 Enter를 입력해주세요.(1.70.0)"
read arv

if [ "$arv" = "" ]; then
    wget https://dlcdn.apache.org//apr/apr-1.7.0.tar.gz -P $LDIR
    tar -zxvf $LDIR/apr-1.7.0.tar.gz
else
    wegt https://dlcdn.apache.org//apr/apr-$arv.tar.gz -P $LDIR
        if [ $? -ne 0 ]; then
    echo "존재하지 않는 apr 버전이거나, 설치 경로가 변경되었을 수 있습니다."
    echo "공식 문서를 확인해 주세요.(https://apr.apache.org/download.cgi)"
    exit 0
    fi
    tar -zxvf $LDIR/apr-$apv.tar.gz
fi

echo "apr-util 라이브러리를 설치합니다."
echo "가장 최신 버전을 설치 하려면 Enter를 입력해주세요.(1.6.1)"
read auv

if [ "$auv" = "" ]; then
    wget https://dlcdn.apache.org//apr/apr-util-1.6.1.tar.gz -P $LDIR
    tar -zxvf $DIR/apr-util-1.6.1.tar.gz
else
    wegt https://dlcdn.apache.org//apr/apr-util-$auv.tar.gz -P $LDIR
        if [ $? -ne 0 ]; then
    echo "존재하지 않는 apr 버전이거나, 설치 경로가 변경되었을 수 있습니다."
    echo "공식 문서를 확인해 주세요.(https://apr.apache.org/download.cgi)"
    exit 0
    fi
    tar -zxvf $LDIR/apr-util-$auv.tar.gz
fi

######################## 아차피 설치 ##########################

echo "설치할 apache version을 입력해 주세요.(ex 2.2.17)"
echo "가장 최신 버전을 설치 하려면 Enter를 입력해주세요.(2.4.54)"
read apv

if [ "$apv" = "" ]; then
    wget https://dlcdn.apache.org/httpd/httpd-2.4.54.tar.gz -P $DIR
    tar -zxvf $DIR/httpd-2.4.54.tar.gz
else
    wegt http://archive.apache.org/dist/httpd/httpd-$apv.tar.gz -P $DIR
        if [ $? -ne 0 ]; then
    echo "존재하지 않는 아파치 버전이거나, 설치 경로가 변경되었을 수 있습니다."
    echo "공식 문서를 확인해 주세요.(https://httpd.apache.org/download.cgi)"
    exit 0
    fi
    tar -zxvf $DIR/httpd-$apv.tar.gz
fi



######################## 라이브러리 컴파일 ##########################


echo "pcre 컴파일"

if [ "$pev" = "" ]; then
    cd $LDIR/pcre-8.45
    ./configure --prefix=$LDIR
    make && make install
else
    cd $LDIR/pcre-$pev
    ./configure --prefix=$LDIR
    make && make install
fi

echo "apr, apr-util 라이브러리 경로 이동 & 컴파일"

if [ "$apv" = "" ]; then
    if [ "$arv" = "" ]; then
        cd $LDIR
        mv apr-1.7.0 $DIR/httpd-2.4.54/srclib/
        mv apr-util-1.6.1 $DIR/httpd-2.4.54/srclib/
    
    else
        cd $LDIR
        mv apr-$arv $DIR/httpd-2.4.54/srclib/
        mv apr-util-$auv $DIR/httpd-2.4.54/srclib/
    fi
    cd $DIR/httpd-2.4.54/
    ./configure --prefix=$DIR/httpd-2.4.54 --with-included-apr --with-pcre=$DIR/bin/pcre-config
    make && make install
else
    if [ "$arv" = "" ]; then
        cd $LDIR
        mv apr-1.7.0 $DIR/httpd-$apv/srclib/
        mv apr-util-1.6.1 $DIR/httpd-2.4.54/srclib/
    else
        cd $LDIR
        mv apr-$arv $DIR/httpd-$apv/srclib/
        mv apr-util-$auv $DIR/httpd-2.4.54/srclib/
    fi
    ./configure --prefix=$DIR/httpd-$apv --with-included-apr --with-pcre=$DIR/bin/pcre-config
    make && make install
fi

