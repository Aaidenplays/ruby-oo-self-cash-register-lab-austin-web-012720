require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :index, :prior_price, :prior_item

    @@all = []
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items = []
        @prior_price = 0
        @prior_item = nil
        @index = 1

        @@all << self
    end

    def add_item(title, price, quantity=1)
        index = 0
        while index<quantity
            self.items << title
            index += 1
        end
        prior_item = title
        price *= quantity
        self.prior_price = price
        self.total += price
    end

    def apply_discount
        if discount != nil
            self.total -= ((0.01 * discount) * total)
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if index = 0 
            items.pop(1)
        else
            items.pop(index)
        end

        self.total -= prior_price
        # binding.pry
    end


end
