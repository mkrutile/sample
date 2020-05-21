require './menu.rb'

class Dealer

    def showitems
        @menus= [
            Menus.new(id: 1, name: "エリクサー", price: 500),
            Menus.new(id: 2, name: "アルテマウエポン", price: 5000),
            Menus.new(id: 3, name: "エクスカリパー", price: 1),
            Menus.new(id: 4, name: "英雄の盾", price: 3000),
            Menus.new(id: 5, name: "皆伝の証", price: 2000),
        ]
    
        @menus.each do |item|
        puts "#{item.id}. 「#{item.name}」 #{item.price}ギル"
        end
    end

    def selectitems(menus)
        select_menu = @menus.find {|item| item.id == menus}
        if select_menu.nil?
            puts "その商品はうちには取り扱っていないよ！"
            puts "もう一度選んでくれるかい？"
        else
            puts "「#{select_menu.name}」にするのじゃな！"
            puts "いくつ必要かな？"
            select_menu
        end
    end

    CAN_CHOOSE_COUNT = 0
    DISCOUNT_TAGET_COUNT = 3
    DISCOUNT_RATE = 0.8
    def orderitems(item, count)
        @count_all = item.price*count
        if count <= CAN_CHOOSE_COUNT
            puts "その数量は選べないぞ！"
        elsif count < DISCOUNT_TAGET_COUNT
            puts "#{@count_all.floor}ギルだよ！"
            @count_all
        else count >= DISCOUNT_TAGET_COUNT
            @count_all *= DISCOUNT_RATE
            puts "2割引にしておくよ！#{@count_all.floor}ギルだよ！"
            @count_all
        end
    end

    MONEY_PAY = 0
    def payment(money_pay)
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
end