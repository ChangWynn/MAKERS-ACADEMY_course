const AccountModel = require("../lib/accountModel")
const Transaction = require("../lib/transaction")

jest.mock("../lib/transaction.js")

describe(AccountModel, () => {

  let model;
  beforeEach(() => {
    model = new AccountModel()
    Transaction.mockClear()
  })

  describe("new instance", () => {
    it('should have its properties set as private', () => {
      const properties = Object.getOwnPropertyNames(model)

      expect(properties.includes('balance')).toBe(false)
      expect(properties.includes('transactions')).toBe(false)
    })

    it("should have a balance property initially set to 0", () => {
      expect(model.balance).toEqual(0)
    })

    it("should have a transactions property initially set to an empty array", () => {
      expect(model.transactions).toEqual([])
    })
  })

  describe(".addTransaction method", () => {
    describe("when given a positive number", () => {
      it("should add a new transaction object in the transactions array", () => {
        const amount = 100

        model.addTransaction(amount)
        expect(Transaction).toHaveBeenCalledTimes(1)
        expect(model.transactions.length).toEqual(1)
      })

      it("should assign the provided amount to the transaction's credit property", () => {
        const amount = 100
        Transaction.prototype.credit = amount
        Transaction.prototype.debit = 0

        model.addTransaction(amount)
        expect(Transaction).toHaveBeenCalledTimes(1)
        expect(model.transactions[0].credit).toEqual(amount)
        expect(model.transactions[0].debit).toEqual(0)
      })
    })

    describe("when given a negative number", () => {
      it("should add a new transaction object in the transactions array", () => {
        const amount = -100

        model.addTransaction(amount)
        expect(Transaction).toHaveBeenCalledTimes(1)
        expect(model.transactions.length).toEqual(1)
      })
  
      it("should assign a positive number to the transaction's debit property", () => {
        Transaction.prototype.credit = 0
        Transaction.prototype.debit = 100

        model.addTransaction(-100)
        expect(Transaction).toHaveBeenCalledTimes(1)
        expect(model.transactions[0].credit).toEqual(0)
        expect(model.transactions[0].debit).toEqual(100)
      })
    })

    it("should return if amount provided is 0", () => {
      model.addTransaction(0)
      expect(Transaction).not.toHaveBeenCalled()
      expect(model.transactions.length).toEqual(0)
    })

    it("should return if argument provided is not a number", () => {
      model.addTransaction('100')
      expect(Transaction).not.toHaveBeenCalled()
      expect(model.transactions.length).toEqual(0)

      model.addTransaction([100])
      expect(Transaction).not.toHaveBeenCalled()
      expect(model.transactions.length).toEqual(0)
    })
  })
})