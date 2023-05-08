const { ShoppingBasket } = require('../lib/shoppingBasket')

describe(ShoppingBasket, () => {

  it("should be instantiated with an empty array", () => {
    const basket = new ShoppingBasket;
    expect(basket.getItems()).toStrictEqual([])
  });

  describe("addItem method", () => {
    it("should add items into the basket", () => {
      const mars = {
        getName: () => "Mars",
        getPrice: () => 2
      }
      const basket = new ShoppingBasket;
      basket.addItem(mars);
      expect(basket.getItems()).toEqual([mars]);
    });
  });

  describe("getTotalPrice method", () => {
    it("should return 0 when shopping basket is empty", () => {
      const basket = new ShoppingBasket;
      expect(basket.getTotalPrice()).toStrictEqual(0);
    });
    it("should return the single price", () => {
      const basket = new ShoppingBasket;
      const mars = {
        getName: () => "Mars",
        getPrice: () => 2
      };
      basket.addItem(mars);
      expect(basket.getTotalPrice()).toStrictEqual(2);
    });
    it("should return the total price of the basket - test 1", () => {
      const basket = new ShoppingBasket;
      const mars = { getName: () => "Mars", getPrice: () => 2 };
      const twix = { getName: () => "Twix", getPrice: () => 3 };
      basket.addItem(mars);
      basket.addItem(twix);
      expect(basket.getTotalPrice()).toStrictEqual(5);
    });
    it("should return the total price of the basket - test 2", () => {
      const basket = new ShoppingBasket;
      const mars = { getName: () => "Mars", getPrice: () => 2 };
      const twix = { getName: () => "Twix", getPrice: () => 3 };
      const cake = { getName: () => "Cake", getPrice: () => 9 };
      basket.addItem(mars);
      basket.addItem(twix);
      basket.addItem(cake);
      expect(basket.getTotalPrice()).toStrictEqual(14);
    });
    it("should apply the discount to the total price", () => {
      const basket = new ShoppingBasket;
      const mars = { getName: () => "Mars", getPrice: () => 2 };
      const twix = { getName: () => "Twix", getPrice: () => 3 };
      const cake = { getName: () => "Cake", getPrice: () => 9 };
      basket.addItem(mars);
      basket.addItem(twix);
      basket.addItem(cake);
      basket.applyDiscount(5);
      expect(basket.getTotalPrice()).toStrictEqual(9)
    })
  });
});