class Sword
    attr_accessor :name
    attr_accessor :price

    def initialize (name:,price:)
        self.name = name
        self.price = price
    end

    def menu
        return "「#{self.name}」 #{self.price}ギル"
    end

    def total_price(count)
        total_price_all = self.price*count
        if count >= 3
            total_price_all *= 0.8
        end
        return total_price_all
    end
end