#!/bin/bash


exportFeature() {
	TOKEN=$(curl -H "Content-Type: application/json" -X POST --data '{ "client_id": "79DEB7531DBD40509198ED58DB7387AB","client_secret": "2e58a5377f9568bd74bbfa7bc16da97b5045ed59ceaec89c166aa4b3640a298d" }' https://xray.cloud.xpand-it.com/api/v1/authenticate| tr -d '"')
	curl -H "Content-Type: application/json" -X GET -H "Authorization: Bearer $TOKEN"  "https://xray.cloud.xpand-it.com/api/v1/export/cucumber?keys=TEST-12"
}

curl -H "Content-Type: application/json" -X POST -H "Authorization: Bearer $token"  --data @"data.json" https://xray.cloud.xpand-it.com/api/v1/import/execution/cucumber