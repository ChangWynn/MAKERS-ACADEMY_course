require "customer_order"

describe CustomerOrder do

  before do
    @order1 = CustomerOrder.new
  end

  context "#add method" do
    it "should add a meal to the order array" do
      @order1.add({name: "lasagna", price: 9})
      expect(@order1.order).to eq [{name: "lasagna", price: 9}]
    end
    it "should push meals into the order array" do
      @order1.add({name: "lasagna", price: 9})
      @order1.add({name: "pizza", price: 12})
      expect(@order1.order).to eq [{name: "lasagna", price: 9},{name: "pizza", price: 12}]
    end
  end

  context "#view_receipt method" do
    it "should print a formatted text for the ordered meal and a grand total" do
      @order1.add({name: "lasagna", price: 9})
      expect(@order1.view_receipt).to eq "Meal ordered: lasagna(£9) Total: £9"
    end
    it "should print a formatted text for multiple ordered meals and a grand total" do
      @order1.add({name: "lasagna", price: 9})
      @order1.add({name: "pizza", price: 12})
      expect(@order1.view_receipt).to eq "Meal ordered: lasagna(£9), pizza(£12) Total: £21"
    end
    it "should print a formatted text for a large number of ordered meals and a grand total" do
      @order1.add({name: "lasagna", price: 9})
      @order1.add({name: "pizza", price: 12})
      @order1.add({name: "pizza", price: 12})
      @order1.add({name: "spaguetti carbonara", price: 10})
      expect(@order1.view_receipt).to eq "Meal ordered: lasagna(£9), pizza(£12), pizza(£12), spaguetti carbonara(£10) Total: £43"
    end
  end
end

