#!/bin/bash

echo "해당 프로그램은 Apahce 설치에 대한 자동화 script 입니다."
echo "1. 제시한 부분에 대한 명시가 없을 시, (Default) 설정을 따르게 됩니다."
echo "2. 최소 50MB의 디스크 용량을 요구합니다."
echo "3. ANSI-C 컴파일러와 컴파일 시스템를 요구합니다."
echo "4. Perl 5 모듈을 추가로 설치합니다."

echo "yum pakage를 업데이트 합니다."
sudo yum update

echo "패키지 프로그램을 설치할 경로를 입력해 주세요.(기본 경로 /usr/local/apahce)"
read DIR

if [ "$DIR" = "" ]; then
    #DIR=/usr/local/apahce
    #mkdir /usr/local/apache
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

echo "설치할 apache version을 입력해 주세요.(2.x.xx)"
echo "가장 최신 버전을 설치 하려면 Enter를 입력해주세요.(2.4.54)"
read apv

if [ "$apv" = "" ]; then
    wget https://httpd.apache.org/download.cgi#apache24 -P $DIR
else
    wegt http://archive.apache.org/dist/httpd/$apv -P $DIR
fi
