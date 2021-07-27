#CSVファイルを読み込むため
require "csv" 



#打ち込み終わるまで繰り返す
while true do
    
#選択肢 １と２
      puts "1(新規でメモを作成) 2(既存のメモ編集する)3(メモを終了する)"

 #打ち込んだ文字をgetsメソッドで取得し変数に代入
      memo_type = gets.chomp.to_s

#条件分岐、memo_typeが1(新規でメモを作成) 2(既存のメモ編集する)それぞれの場合
#1の時
   if memo_type == "1"
      puts "拡張子を除いたファイルを入力してください"
#タイトルを打ち込む
      title = gets.chomp.to_s
      
#本文打ち込み

      puts "メモしたい内容を記述してください"
      puts "完了したらCtrl+Dを押します"
#文を変数に代入
      content = STDIN.read
      
#CSVへ入力内容を転送する
      CSV.open("#{title}.csv",'w') do |memo|
        memo << ["#{content}"]
      end
      
#２の時
   elsif memo_type == '2'
      puts '編集を実行します'
      puts '拡張子を除いたファイルを入力してください'
#ファイル名を打ち込み、変数に代入
      pull_title = gets.chomp.to_s
      
      puts "編集内容を記入してください"
      puts "完了したらCtrl + Dを押します"
#add_memoに打ち込んだ文字を代入
    add_memo = STDIN.read
    
#csvファイルを取得し、編集'w'>'a'
      CSV.open("#{pull_title}.csv",'a')do |memo|
        memo << ["#{add_memo}"]
      end
      
#メモを終了する
     elsif memo_type == '3'
         puts "終了"
      break
      
   else
       puts "1か2を入力してください"
   end
   
end

