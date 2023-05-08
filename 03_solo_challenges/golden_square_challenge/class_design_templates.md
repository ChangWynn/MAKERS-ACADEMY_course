# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem
So that I can check if I want to order something
I would like to see a list of dishes with prices.

So that I can order the meal I want
I would like to be able to select some number of several available dishes.

So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

# see a list of dishes with prices (hash)
# order one or more dishes
# being able to see my order in a receipt

## 2. Design the Class System

```
Class Menu
  - initialize: array of items_name/price key/value pairs
  - see_menu: returns list of items
  - order(Order_instance, item): add item to an order object

Class Order
  - init = contain an empty array
  - add: add an item to the order list
  - view_receipt : return a formatted string of item ordered with a grand total
```

_Also design the interface of each class in more detail._

```ruby
class Menu
  def initialize(kernel)
    items = [
      {dish: dish, price: 10}
      ...
    ]
    @io = kernel
  end

  def see_menu
    # returns a list of items from the menus
  end

  def order(Order_object)
    puts "what would you like to order?"
    puts "choose a meal"
  print a list a numbered meal here
    choice = @io.gets.chomp
    @io.puts "Sorry, this item is not available. Try again." if not availabe
    puts "how many would you like?"
    number = @io.gets.chomp
  implement method here

  # order1.add(choice)
    puts "Thank you! You order has been added"

    # add chosen item to Order class
    # do not return anything
  end

end

class Order
  def initialize
    # @order = []
  end

  def add(item)
    # add item to the order
    # do not return anything
  end

  def view_receipt
    # returns a string stating the items ordered and the price
  end
end
```
## 3. Create Examples as Integration Tests
```ruby
# Menu.order > Order.add > adds only hashes
# Menu.order > Order.add > adds only items from menu
# Menu.order > Order.add > pushes items from menu


# Order.view_receipt > prints a string with all items ordered with price and grand total
# 1 items
item1 10
Total 10

# 2 different items
item1 10
item2 15
Total 25

# 3 similar items and a single different one (ordered by price)
item1 10
item1 10
item2 15
Total 35


```

## 4. Create Examples as Unit Tests

```ruby
# Menu have a list of 3 dishes by default

# Menu.see_order => returns list menu items

# Order.init start with an empty array => []




```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._

