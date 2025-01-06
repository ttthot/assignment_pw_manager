#!/bin/bash
echo "パスワードマネージャーへようこそ！"

while true; do
    #　３つの選択肢を提示、最終的にExit選択でループから抜けられる
    read -p  "次の選択肢から入力してください(Add Password/Get Password/Exit)：
" -r option
    

    case $option in
        "Add Password")
            read -p  "サービス名を入力してください：" -r serv_name
            read -p  "ユーザー名を入力してください：" -r user_name
            read -s -p "パスワードを入力してください：" -r password

            #　設定ファイルに"サービス名:ユーザー名:パスワード"という形式で保存
            echo "$serv_name:$user_name:$password" >> password_setting.md
            echo;
            echo "パスワードの追加は成功しました。"
            ;;

        "Get Password")
            read -p  "サービス名を入力してください：" -r input_serv_name
                grep_result=$(grep "^$input_serv_name" "password_setting.md")
            #grepの帰り値が空、つまり検索結果なしの場合
            if [ -z "$grep_result"  ]; then
                echo "そのサービスは登録されていません。"
            else
                #　サービス名で前方一致検索をかける
                #　取得した行（xx:yy:zz）を分割する
                serv_name=$(echo "$grep_result" | cut -d':' -f1)
                user_name=$(echo "$grep_result" | cut -d':' -f2)
                password=$(echo "$grep_result" | cut -d':' -f3)
                #　結果を出力
                echo "サービス名：$serv_name"
                echo "ユーザー名：$user_name"
                echo "パスワード：$password"
            fi
            ;;

        "Exit")
            echo
            echo "Thank you!"
            break
            ;;

        *)
            echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
    esac
done



