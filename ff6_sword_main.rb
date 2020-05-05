# ruby ff6_sword_main.rb

# Swordクラスの配列作成
require"./ff6_sword_class"
puts "（フィガロの武器商人）いらっしゃい。最高の品物が揃ってるよ？番号を言ってくれるかい？"

sword1 = Sword.new(name:"ラグナロク",price:4000)
sword2 = Sword.new(name:"アルテマウエポン",price:5000)
sword3 = Sword.new(name:"エクスカリパー",price:1)

swords = [sword1,sword2,sword3]

swords.each.with_index(1) do |sword,i|
    puts "#{i}.#{sword.menu}"
end

# 配列から選択
print ">"
select = 1
loop do
    select = gets.chomp.to_i
    break if [1, 2, 3].include?(select)
    puts "（フィガロの武器商人）1〜3番から選んでくれるかい？"
end

order_number = swords[select -1]
puts "（フィガロの武器商人）「#{order_number.name}」にするのじゃな！何振り必要かな？"

# 合計金額の算出
print ">"
count = gets.chomp.to_i
if count<3
    puts "（フィガロの武器商人）#{order_number.total_price(count).floor}ギルじゃよ！！"
else
    puts "（フィガロの武器商人）3振り以上じゃから20%引きにしておくよ！"
    puts "（フィガロの武器商人）#{order_number.total_price(count).floor}ギルじゃよ！！"
end

# 支払い
print ">"
sword_pay = gets.chomp.to_i
case sword_pay
when (1..100000)
    if sword_pay > order_number.total_price(count).floor
        puts "#{sword_pay - order_number.total_price(count).floor}ギルのお返しじゃ！ありがとう！"
    elsif sword_pay < order_number.total_price(count).floor
        puts "残り#{order_number.total_price(count).floor - sword_pay}ギル足りないぞ！お金のない奴は帰っとくれ！"
    else sword_pay = order_number.total_price(count).floor
        puts "ちょうどだね！毎度あり！"
    end
end