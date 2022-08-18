require 'pry'
class CashRegister
    attr_accessor :total
    attr_accessor :discount
    attr_accessor :items
    attr_accessor :transaction

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=1)
        quantity.times {|item| self.items.push(title)}
        #quantity.times {|item| self.items_price.push(price)}
        self.transaction = price*quantity
        self.total = (self.total + self.transaction)
    end

    def apply_discount
        if self.discount != 0
            self.total = self.total - ((self.total * self.discount) / 100)
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        # for item in self.items_price
        #     last_item_cost = self.items_price.last
        #     self.total -= last_item_cost
        #     self.items_price.pop()
        # end
        # until self.items_price.length == 0
        #     last_item_cost = self.items_price.last
        #     self.total -= last_item_cost
        #     self.items_price.pop()
        # end
        self.total -= self.transaction
    end
end
