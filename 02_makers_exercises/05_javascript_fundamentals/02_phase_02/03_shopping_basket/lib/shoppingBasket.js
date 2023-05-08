class ShoppingBasket {

  constructor() {
    this.items = [];
    this.discount = 0;
  }

  applyDiscount(discount) {
    this.discount = discount;
  }

  getItems() {
    return this.items;
  }

  addItem(item) {
    this.items.push(item);
  }

  getTotalPrice() {
    let totalPrice = 0;
    this.items.forEach((candy) => {
      totalPrice += candy.getPrice();
    });
  
    return totalPrice - this.discount;
  }
}


module.exports = { ShoppingBasket };


