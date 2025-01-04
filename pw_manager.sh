#!/bin/bash
echo "パスワードマネージャーへようこそ！"

#使用者に情報を入力させる
#option-p:入力オプション使用 option-s:入力パスワードを不可視化
read -p  "サービス名を入力してください：" -r serv_name
read -p  "ユーザー名を入力してください：" -r user_name
read -s -p "パスワードを入力してください：" -r password

#入力情報　をmdファイルに保存
echo "$serv_name:$user_name:$password" >> password_setting.md

echo
echo "Thank you!"

