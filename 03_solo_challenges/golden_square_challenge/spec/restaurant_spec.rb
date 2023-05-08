require "restaurant"
require "date"

describe Restaurant do
  context "#see_menu method" do
    it "should returns a list of items from the menu" do
      restaurant = Restaurant.new
      expect(restaurant.see_menu).to eq [
        {name: "spaguetti carbonara", price: 10},
        {name: "lasagna", price: 9},
        {name: "pizza", price: 12}
      ]
    end
  end

  context "#order method" do
    it "should only accept meals available from the menu" do
      io = double :kernel
      order1 = double :customerOrder
      allow(order1).to receive(:add).with({name: "lasagna", price: 9})
      expect(io).to receive(:gets) {"4"}
      expect(io).to receive(:puts).with("Sorry, this item is not available. Try again.")
      expect(io).to receive(:gets) {"2"}
      expect(io).to receive(:gets) {"\n"}
      restaurant = Restaurant.new(io)
      restaurant.order(order1)
    end
  end
  context "#send_confirmation_sms method" do
    it "should send a text with an estimated time of delivery (etd) of +1 hour" do
      time_now = Time.new(2023, 02, 22, 20)
      etd = Time.new(2023, 02, 22, 21)
      number = '+447111111111'
      restaurant = Restaurant.new
      send_sms = restaurant.send_confirmation_sms(number, time_now)
      expect(send_sms).to eq "SMS successfully delivered. ETD: #{etd}"
    end
    it "should throw an error if sms deliery was not successful" do
      twilio = double :twilio
      number = '+44711111111'
      restaurant = Restaurant.new
      expect { restaurant.send_confirmation_sms(number) }.to raise_error "Sorry, there was a problem with your order"
    end
  end
end