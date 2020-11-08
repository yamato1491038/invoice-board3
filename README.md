[![Build Status](https://travis-ci.org/yamato1491038/invoice-board3.svg?branch=master)](https://travis-ci.org/yamato1491038/invoice-board3)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/yamato1491038/invoice-board3)

# Name

  Invoive-board (請求書まとめアプリ)

## Description
  フィールド業務の成果や交通費をまとめるWEBアプリ
  業務委託で現場の成果をアプリに入力すると管理者がそれをまとめて成果に対して月々の支払額を確認するもの

## Requirement
  Ruby 2.6.5

  Rails 6.0.0

  JQuery

  Node.js

## Infrastructure

AWSを使用しデプロイ。

<img width="1351" alt="デプロイ" src="https://user-images.githubusercontent.com/67918886/98431725-664af280-20fb-11eb-90b7-9742fee841b3.png">

## Function
※コミュニケーターとは業務委託している現場の人の名称
- 説得費や定期巡回費(現場業務の名称)の登録、確認、削除
- 交通費や諸経費の登録、確認、削除
- 一ヶ月分一覧機能（内訳書という表現してます）
- 一ヶ月ごとに締め機能（入力できなくなり管理者が決済できるようになる）
- 管理者の一覧確認（コミュニケーターごと）
- 管理者の契約登録、変更、削除機能
- 管理者の帳票機能（一ヶ月ごとコミュニケーター一覧表示）
- 管理者のハンコ機能（デジタルハンコ）
- メール機能（締め後に管理者へお知らせのメールが届く）


## Appearance

アプリトップ画面

<img width="1353" alt="ログイン画面" src="https://user-images.githubusercontent.com/67918886/98431800-f6893780-20fb-11eb-9a69-3958ec3b7fc7.png">

一覧表示とハンコ機能

<img width="1276" alt="決済画面" src="https://user-images.githubusercontent.com/67918886/98431888-cbebae80-20fc-11eb-9766-909035ce4a4a.png">

AWS SESを用いたメール機能（決済後に管理者へお知らせメール）

<img src="https://user-images.githubusercontent.com/67918886/98459084-7dacdd00-21da-11eb-9717-f8d969913a7e.PNG" width="500">

![IMG_8099](https://user-images.githubusercontent.com/67918886/98459084-7dacdd00-21da-11eb-9717-f8d969913a7e.PNG)



## Usage

## Install

## Contribution

## Licence

## Author


