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

yum list installed | grep wget
if [ $? -ne 0 ]
then
    yum install -y gcc
fi

yum list installed | grep ^gcc.x86_64
if [ $? -ne 0 ]
then
    yum install -y gcc
fi

yum list installed | grep ^gcc-c++.x86_64
if [ $? -ne 0 ]
then
    yum install -y gcc-c++
fi

yum list installed | grep zlib-devel
if [ $? -ne 0 ]
then
    yum install -y zlib-devel
fi

yum list installed | grep openssl
if [ $? -ne 0 ]
then
    yum install -y openssl
fi

yum list installed | grep openssl-devel
if [ $? -ne 0 ]
then
    yum install -y openssl-devel
fi

yum list installed | grep pcre-devel
if [ $? -ne 0 ]
then
    yum install -y pcre-devel
fi

yum list installed | expat-devel
if [ $? -ne 0 ]
then
    yum install -y expat-devel
fi

######################## 설치 디렉토리 설정 ##########################

echo "패키지 프로그램을 설치할 경로를 입력해 주세요.(기본 경로 /usr/local/apahce)"
read DIR

if [ "$DIR" = "" ]; then
    #DIR=/usr/local/apahce
    #mkdir -p /usr/local/apache
    DIR=test
else
    while :
    do
        if [ -d "$DIR" ]; then
            echo "지정한 경로는 $DIR 입니다."
        else
            echo "존재하지 않는 경로입니다."
            break
        fi
    done
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
    echo "존재하지 않는 아파치 버전이거나, 설치 경로가 변경될 수 있습니다."
    echo "공식 문서를 확인해 주세요."
    exit 0
    fi
    tar -zxvf $DIR/httpd-$apv.tar.gz
fi

######################## 필수 라이브러리 설치 ##########################