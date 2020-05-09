class Menu
    attr_accessor :name,:price

    def initialize (name:,price:)
        self.name = name
        self.price = price
    end

    def lineup
        return "「#{self.name}」 #{self.price}ギル"
    end

    DISCOUNT_TAGET_COUNT = 3
    DISCOUNT_RATE = 0.8
    def total_price(count)
        total_price_all = self.price*count
        if count >= DISCOUNT_TAGET_COUNT
            total_price_all *= DISCOUNT_RATE
        end
        return total_price_all
    end
end