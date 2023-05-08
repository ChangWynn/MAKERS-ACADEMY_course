class CustomerOrder

  attr_reader :order

  def initialize 
    @order = []
  end

  def add(meal)
    @order << meal
  end

  def view_receipt
    str_head = "Meal ordered: "
    grand_total = 0
    @order.each do |meal|
      str_head << "#{meal[:name]}(£#{meal[:price]}), "
      grand_total += meal[:price]
    end
    return str_head[0...-2] + " Total: £#{grand_total}"
  end

  def confirm_order(restaurant, your_number)
    restaurant.send_confirmation_sms(your_number)
  end
end 
