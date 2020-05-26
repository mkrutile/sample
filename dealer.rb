require './menu.rb'

class Dealer
    attr_reader :menus

    def initialize(menus:)
      @menus = menus
    end

    def showitems
    
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
        @total_price = item.price*count
        if count <= CAN_CHOOSE_COUNT
            puts "その数量は選べないぞ！"
        elsif count < DISCOUNT_TAGET_COUNT
            puts "#{@total_price.floor}ギルだよ！"
            @total_price
        else count >= DISCOUNT_TAGET_COUNT
            @total_price *= DISCOUNT_RATE
            puts "2割引にしておくよ！#{@total_price.floor}ギルだよ！"
            @total_price
        end
    end

    MONEY_PAY = 0
    def payment(money_pay)
        if money_pay <= MONEY_PAY
            puts "お金が見当たらないぞ！冗談はよしてくれ！"
        elsif money_pay > @total_price
            puts "#{money_pay - @total_price.floor}ギルのお返しじゃ！"
        elsif money_pay < @total_price
            puts "残り#{@total_price.floor - money_pay}ギル足りないぞ！お金のない奴は帰ってくれ！"
        else money_pay == @total_price
            puts "ちょうどだね！毎度あり！"
        end
    end
end