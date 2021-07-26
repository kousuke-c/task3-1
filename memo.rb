#CSVファイルを読み込むため
require "csv" 
#選択肢、１と２
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
#打ち込んだ文字をgetsメソッドで取得し変数に代入
memo_type = gets.chomp


#打ち込み終わるまで繰り返す
while true do
#条件分岐、memo_typeが1(新規でメモを作成) 2(既存のメモ編集する)それぞれの場合
#1の時

   if memo_type == "1"
      puts "拡張子を除いたファイルを入力してください"
#タイトルを打ち込む
      title = gets.chomp
      
#本文を打ち込むためにmemo_typeに文字列の１を加え、ループする条件分岐を次に進める
      memo_type+="1"
      
      
#本文打ち込み
   elsif memo_type=="1"+"1"
      puts "メモしたい内容を記述してください"
      puts "完了したらCtrl+Dを押します"
#文を変数に代入
      content = gets.chomp
      
#CSVへ入力内容を転送する
      CSV.open("#{title}.csv",'w') do |memo|
        memo << ["#{content}"]
      end
      
      
#２の時
   elsif memo_type == '2'
      puts '編集を実行します'
      puts '拡張子を除いたファイルを入力してください'
#ファイル名を打ち込み、変数に代入
      pull_title = gets.chomp
      
      puts "編集内容を記入してください"
      puts "完了したらCtrl + Dを押します"
#add_memoに打ち込んだ文字を代入
    add_memo = gets.chomp
    
#csvファイルを取得し、編集'w'>'a'
      CSV.open("#{pull_title}.csv",'a')do |memo|
        memo << ["#{add_memo}"]
      end
      
      
   else
       puts "1か2を入力してください"
   end
end

