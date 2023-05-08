require "restaurant"
require "customer_order"

describe "Integration Tests" do
  context "RestaurantMenu#order method" do
    it "should only accept meals available from the menu" do
      io = double :kernel
      expect(io).to receive(:gets) {"4"}
      expect(io).to receive(:puts).with("Sorry, this item is not available. Try again.")
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"\n"}
      restaurant = Restaurant.new(io)
      order1 = CustomerOrder.new
      restaurant.order(order1)
    end
  end

  context "CustomerOrder#add method" do
    it "should push meals into the order" do
      io = double :kernel
      restaurant = Restaurant.new(io)
      order1 = CustomerOrder.new
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"1"}
      expect(io).to receive(:gets) {"\n"}
      restaurant.order(order1)
      expect(order1.order).to eq [{name: "lasagna", price: 9}, {name: "spaguetti carbonara", price: 10}]
    end
  end

  context "CustomerOrder#view_receipt" do
    it "should print a formatted text for the ordered meals and a grand total" do
      io = double :kernel
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"\n"}
      restaurant = Restaurant.new(io)
      order1 = CustomerOrder.new
      restaurant.order(order1)
      expect(order1.view_receipt).to eq "Meal ordered: lasagna(£9) Total: £9"
    end
    it "should print a formatted text for multiple ordered meals and a grand total" do
      io = double :kernel
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"3"}
      expect(io).to receive(:gets) {"\n"}
      restaurant = Restaurant.new(io)
      order1 = CustomerOrder.new
      restaurant.order(order1)
      expect(order1.view_receipt).to eq "Meal ordered: lasagna(£9), pizza(£12) Total: £21"
    end
    it "should print a formatted text for a large number of ordered meals and a grand total" do
      io = double :kernel
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"3"}
      expect(io).to receive(:gets) {"3"}
      expect(io).to receive(:gets) {"\n"}
      restaurant = Restaurant.new(io)
      order1 = CustomerOrder.new
      restaurant.order(order1)
      expect(order1.view_receipt).to eq "Meal ordered: lasagna(£9), pizza(£12), pizza(£12) Total: £33"
    end
  end
end