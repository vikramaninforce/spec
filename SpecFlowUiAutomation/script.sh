﻿#!/bin/bash

exportTest(){

token=$(curl -H "Content-Type: application/json" -X POST --data '{ "client_id": "79DEB7531DBD40509198ED58DB7387AB","client_secret": "2e58a5377f9568bd74bbfa7bc16da97b5045ed59ceaec89c166aa4b3640a298d" }' https://xray.cloud.xpand-it.com/api/v1/authenticate| tr -d '"')

curl -L -H "Content-Type: application/json" -X GET -H "Authorization: Bearer $token"  "https://xray.cloud.xpand-it.com/api/v1/export/cucumber?keys=TEST-13" > feature.zip
unzip feature.zip
dotnet test --test-adapter-path:. --logger:xunit
}

publishReport(){

cd TestResults/

token=$(curl -H "Content-Type: application/json" -X POST --data '{ "client_id": "79DEB7531DBD40509198ED58DB7387AB","client_secret": "2e58a5377f9568bd74bbfa7bc16da97b5045ed59ceaec89c166aa4b3640a298d" }' https://xray.cloud.xpand-it.com/api/v1/authenticate| tr -d '"')

curl -H "Content-Type: text/xml" -X POST -H "Authorization: Bearer $token" --data @"TestResults.xml" https://xray.cloud.xpand-it.com/api/v1/import/execution/xunit?testExecKey=TEST-11
}

exportTest
publishReport
