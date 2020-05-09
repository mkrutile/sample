# 前回からの変更点
# ・分かりやすい変数名に変更しました
# ・メソッド化を行いました
# ・class.rbのマジックナンバーを定数化して解消しました
# ・class.rbとmain.rbの処理の重複箇所を修正しました（DISCOUNT_TAGET_COUNT = 3　の割引処理する個数を決めている所です）
# ・main.rbのpaymentメソッドの条件を見直して表示されなかった所を解消してみました
# ・order.total_price(count).floorを多用していましたので　@total　に紐付けてそれを使用するようにしました

# ruby main.rb で実行して下さい

require"./class"

def order_menu
    puts "（フィガロの武器商人）いらっしゃい。最高の品物が揃ってるよ？番号を言ってくれるかい？"

    menu1 = Menu.new(name:"ラグナロク",price:4000)
    menu2 = Menu.new(name:"アルテマウエポン",price:5000)
    menu3 = Menu.new(name:"エクスカリパー",price:1)

    menus = [menu1,menu2,menu3]

    menus.each.with_index(1) do |menu,i|
        puts "#{i}.#{menu.lineup}"
    end

    print ">"
    select = 1
    loop do
        select = gets.chomp.to_i
        break if [1, 2, 3].include?(select)
        puts "（フィガロの武器商人）1〜3番から選んでくれるかい？"
    end

    order = menus[select -1]
    puts "（フィガロの武器商人）「#{order.name}」にするのじゃな！何振り必要かな？"

    print ">"
    count = gets.chomp.to_i
    @total = order.total_price(count).floor
    if count < Menu::DISCOUNT_TAGET_COUNT
        puts "（フィガロの武器商人）#{@total}ギルじゃよ！！"
    else
        puts "（フィガロの武器商人）3振り以上じゃから20%引きにしておくよ！"
        puts "（フィガロの武器商人）#{@total}ギルじゃよ！！"
    end
end

def payment
    print ">"
    money_pay = gets.chomp.to_i
    case money_pay
        when (0..)
        if money_pay <= 0
            puts "お金が見当たらないぞ？冗談はよしてくれ！"
        elsif money_pay > @total
            puts "#{money_pay - @total}ギルのお返しじゃ！ありがとう！"
        elsif money_pay < @total
            puts "残り#{@total - money_pay}ギル足りないぞ！お金のない奴は帰っとくれ！"
        else money_pay = @total
            puts "ちょうどだね！毎度あり！"
        end
    end
end

order_menu
payment