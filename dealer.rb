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
        end
    end

    CAN_CHOOSE_COUNT = 0
    DISCOUNT_TAGET_COUNT = 3
    DISCOUNT_RATE = 0.8
    def orderitems
        count_all = select_menu.price*count
        if count <= CAN_CHOOSE_COUNT
            puts "その数量は選べないぞ！"
        elsif count < DISCOUNT_TAGET_COUNT
            puts "#{count_all.floor}ギルだよ！"
        else count >= DISCOUNT_TAGET_COUNT
            count_all *= DISCOUNT_RATE
            puts "2割引にしておくよ！#{count_all.floor}ギルだよ！"
        end
    end
end