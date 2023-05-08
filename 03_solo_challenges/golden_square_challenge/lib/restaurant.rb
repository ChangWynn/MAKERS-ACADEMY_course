require 'rubygems' 
require 'twilio-ruby'
require "date"

class Restaurant
  @@account_sid = 'account sid'
  @@auth_token = 'auth_token'
  @@client = Twilio::REST::Client.new(@@account_sid, @@auth_token)

  def initialize(kernel = Kernel, client = @@client)
    @io = kernel
    @client = @@client
    @menu = [
      {name: "spaguetti carbonara", price: 10},
      {name: "lasagna", price: 9},
      {name: "pizza", price: 12}
    ]
  end

  def see_menu
    return @menu
  end

  def order(customerOrder)
    _show_menu
    _get_order(customerOrder)
  end

  def send_confirmation_sms(phone_number, time = Time.now)
    etd = time + 60 * 60
    begin
      @client.messages.create( 
        body: "Thank you! Your order was placed and will be delivered before #{etd}",  
        messaging_service_sid: 'messaging_service_sid',      
        to: phone_number)
      return "SMS successfully delivered. ETD: #{etd}"
    rescue Twilio::REST::RestError => e
      fail "Sorry, there was a problem with your order"
    end
  end

  private
  def _show_menu
    # output a numbered list of meal with price
    puts "What would you like to order?"
    @menu.each_with_index do |dish, num| 
      puts "#{num + 1}: #{dish[:name]}, £#{dish[:price]}"
    end
  end
  
  def _get_order(customerOrder)
    customer_choice = nil

    while customer_choice != 0
      customer_choice = @io.gets.chomp.to_i
      if customer_choice > @menu.count
        @io.puts "Sorry, this item is not available. Try again."
        next
      elsif customer_choice > 0
        _add_item_to_order(customerOrder, customer_choice)
        _show_menu
        next
      else
        break
      end
    end

    puts "Thank you! Your items has been added to your order."

  end

  def _add_item_to_order(customerOrder, customer_choice)
      customerOrder.add(@menu[customer_choice - 1])
  end
end

