require './old_menu.rb'

puts <<-EOS
-----------------------------------------------------------------------
（怪しい商人）いらっしゃい。最高の品物が揃っているよ！どれにする？
-----------------------------------------------------------------------
EOS

def make_menu
    [
        Menus.new(id: 1, name: "エリクサー", price: 500),
        Menus.new(id: 2, name: "アルテマウエポン", price: 5000),
        Menus.new(id: 3, name: "エクスカリパー", price: 1),
        Menus.new(id: 4, name: "英雄の盾", price: 3000),
        Menus.new(id: 5, name: "皆伝の証", price: 2000),
    ]
end

def set_menu(menus)
    @items = menus
end

def line_up
    @items.each do |item|
        puts "#{item.id}. 「#{item.name}」 #{item.price}ギル"
    end
end

def order_menu
    loop {
        @menu_id = gets.chomp.to_i
        @select_menu = @items.find {|item| item.id == @menu_id}

        if @select_menu.nil?
            puts "その商品はうちには取り扱っていないよ！"
            puts "もう一度選んでくれるかい？"
        else
            puts "「#{@select_menu.name}」にするのじゃな！"
            puts "いくつ必要かな？"
            break
        end
    }
end


CAN_CHOOSE_COUNT = 0
DISCOUNT_TAGET_COUNT = 3
DISCOUNT_RATE = 0.8
def count_menu
    loop {
    count = gets.chomp.to_i
    @count_all = @select_menu.price*count
    if count <= CAN_CHOOSE_COUNT
        puts "その数量は選べないぞ！"
    elsif count < DISCOUNT_TAGET_COUNT
        puts "#{@count_all.floor}ギルだよ！"
        break
    else count >= DISCOUNT_TAGET_COUNT
        @count_all *= DISCOUNT_RATE
        puts "2割引にしておくよ！#{@count_all.floor}ギルだよ！"
        break
    end
    }
end

MONEY_PAY = 0
def payment
    money_pay = gets.chomp.to_i
    if money_pay <= MONEY_PAY
        puts "お金が見当たらないぞ！冗談はよしてくれ！"
    elsif money_pay > @count_all
        puts "#{money_pay - @count_all.floor}ギルのお返しじゃ！"
    elsif money_pay < @count_all
        puts "残り#{@count_all.floor - money_pay}ギル足りないぞ！お金のない奴は帰ってくれ！"
    else money_pay == @count_all
        puts "ちょうどだね！毎度あり！"
    end
end
