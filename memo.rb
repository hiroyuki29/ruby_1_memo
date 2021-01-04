require "csv"

#テキスト入力の関数
def input_text
  puts "メモしたい内容を入力してください"
  puts "完了したらCtrl + Dをおします"
  $memo_texts = readlines
end

#新規作成か編集か選択
puts "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_s.chomp
if memo_type != "1" and memo_type != "2" then
  puts "入力が正しくないです"
  exit
end

#ファイル名の入力
puts "拡張子を除いたファイル名を入力してください"
file_name = gets.to_s.chomp

#テキスト入力
if memo_type == "1" then
  CSV.open("#{file_name}.csv", 'w') do |csv|
    input_text
    $memo_texts.each do |text|
      csv << [text.chomp]
    end
  end
else 
  CSV.open("#{file_name}.csv", 'a') do |csv|
    input_text
    $memo_texts.each do |text|
      csv << [text.chomp]
    end
  end
end


  