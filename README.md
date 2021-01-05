[![Build Status](https://travis-ci.org/yamato1491038/invoice-board3.svg?branch=master)](https://travis-ci.org/yamato1491038/invoice-board3)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/yamato1491038/invoice-board3)

# 名称

  Invoive-board (経費精算アプリ)

## App URL

https://www.vr-invoice.com/


## 概要
  フィールド業務の成果や交通費をまとめるWEBアプリ
  業務委託で現場で働く人（コミュニケーター）の成果をアプリに入力すると管理者がそれをまとめて成果に対して月々の支払額を確認するもの

## ログインID

### 担当者(管理側)
ID: tantou@tantou  PAS: aaaaaaaa(a×8)

### 酒井(コミュニケーター)
ID: ID: sakai@sakai  PAS: aaaaaaaa(a×8)


※実際に登録や削除、画像投稿、決済をしていただいて構いません。

## 使用技術

  AWS( ACM / ALB / EC2 / S3 / RDS / Route53 / SES / CloudFormation )

  Travis CI

  Ruby 2.6.5

  Rails 6.0.0

  MySQL2

  JavaScript

  JQuery

  Rspec

  Capistrano

## ER図

![ER-invoice (1)](https://user-images.githubusercontent.com/67918886/103285622-02b9b300-4a22-11eb-9bbb-50804b6204ab.png)



## インフラ構成図

AWSを使用しデプロイ

<img width="1364" alt="インフラ" src="https://user-images.githubusercontent.com/67918886/103482799-3f244f00-4e26-11eb-862b-c8224479a029.png">


## 機能一覧

- 説得費や定期巡回費(現場業務の名称)の登録、確認、削除
- 交通費や諸経費の登録、確認、削除
- 諸経費に関してはエビデンスとしてレシートの画像複数投稿機能
- 一ヶ月分一覧機能（内訳書という表現してます）
- 一ヶ月ごとに締め機能（入力できなくなり管理者が決済できるようになる）
- 管理者の一覧確認（コミュニケーターごと）
- 管理者の契約登録、変更、削除機能
- 管理者の帳票機能（一ヶ月ごとコミュニケーター一覧表示）
- 管理者のハンコ機能（デジタルハンコ）
- メール機能（締め後に管理者へお知らせのメールが届く）


## アプリ見た目

### アプリトップ画面

![top](https://user-images.githubusercontent.com/67918886/103212835-4d1e2f80-494f-11eb-9b0a-727f2e07704c.jpg)

### 業務選択画面

<img width="800" alt="index" src="https://user-images.githubusercontent.com/67918886/103212928-8787cc80-494f-11eb-8210-a1a8426a01c0.png">

### 経費登録と画像投稿の画面

<img width="1304" alt="諸経費登録画面" src="https://user-images.githubusercontent.com/67918886/103294988-58985600-4a36-11eb-8120-606e35f230ba.png">



### 一覧表示とハンコ機能

<img width="800" alt="決済画面" src="https://user-images.githubusercontent.com/67918886/98431888-cbebae80-20fc-11eb-9766-909035ce4a4a.png">

### AWS SESを用いたメール機能（決済後に管理者へお知らせメール）

<img src="https://user-images.githubusercontent.com/67918886/98459084-7dacdd00-21da-11eb-9717-f8d969913a7e.PNG" width="300">




## 制作背景

現在勤めている会社において、あったら便利だと思うものを作りました。
現在請求書をまとめているのは紙媒体で郵送や会社への持ち込みが必要な状況。また現場社員の
入力間違いや漏れ、必要書類の不備が散見されている状況である。
また提出された紙媒体を管理側がエクセルに入力が必要で手間がかかっています。

コロナの影響でなるべく非接触が求められる中で必要だと感じて作成しようと思いました。
もともと現場の人はタブレット所持しているためWEBアプリというかたちが都合がよかったのもあります。

WEB化することにより入力漏れや文字が読めないなどの不備がなくなり、金額計算のミスもなくなります。
管理側の入力手間も省け、大幅な業務効率化になります。


## 工夫したポイント

### 一覧表示
現場の業務の単価や種類が今後変わっても一覧表示はそれに対応し、無くなった業務は登録できないように管理者側で調整できる機能つけました。削除としないのは登録できなくなっても過去データを参照することがあるからです。

### ハンコ機能
ハンコを電子化しただけでなく締め機能からのロジックを工夫しました

月締め→その月が登録不可→管理者へメール→管理者決済（ハンコ）

締め後修正する場合

締め解除→決済は全て解除→登録可能に→月締め→再度管理者全員（3人）の決済が必要

### メール機能
「info@vr-invoice.com」というようなよくお知らせでくるメールにしたかったのでgmailなどではなく
AWSのSESを使用。またRoute53で独自ドメイン取得し実装した。

### 画像複数投稿機能
エビデンスとして領収書画像をアップする機能ですが、複数投稿できるようにJavascriptを用いてプレビュー表示させたり見た目がきれいになるようにこだわりました。