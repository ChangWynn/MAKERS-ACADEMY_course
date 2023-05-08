const AccountView = require("../lib/accountView")

describe(AccountView, () => {
  let creditTransaction; let debitTransaction;
  let view; let consoleSpy; 

  beforeEach(() => {
    creditTransaction = {
      date: new Date(2023, 3, 19),
      credit: 100,
      debit: 0
    }

    debitTransaction = {
      date: new Date(2023, 3, 19),
      credit: 0,
      debit: 100
    }

    modelWithCredit = {
      balance: 0,
      transactions: [creditTransaction]
    }

    modelWithDebit = {
      balance: 0,
      transactions: [debitTransaction]
    }
    view = new AccountView()
    consoleSpy = jest.spyOn(console, 'log')
  })

  afterEach(() => {
    consoleSpy.mockRestore()
  })

  describe(".printStatement", () => {

    it("should display a header", () => {
      const model = { balance: 0, transactions: []}
      const expectedHeader = "date || credit || debit || balance"
      view.printStatement(model)
      expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedHeader))
    })

    describe("date output", () => {
      it("should be in the format DD/MM/YYYY", () => {
        const formattedDate = "19/04/2023"

        view.printStatement(modelWithCredit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(formattedDate))
      })
    })

    describe("credit output", () => {
      it("should be displayed in a two decimals format", () => {
        const formattedCredit = "100.00"

        view.printStatement(modelWithCredit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(formattedCredit))
      })

      it("should not display anything when it's equal to 0", () => {
        const partialExpectedOutput = "19/04/2023 ||  ||"

        view.printStatement(modelWithDebit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(partialExpectedOutput))
      })
    })

    describe("debit output", () => {
      it("should be displayed in a two decimals format", () => {
        const formattedDebit = "19/04/2023 ||  || 100.00"

        view.printStatement(modelWithDebit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(formattedDebit))
      })

      it("should not display anything when it's equal to 0", () => {
        const partialExpectedOutput = "19/04/2023 || 100.00 ||  ||"

        view.printStatement(modelWithCredit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(partialExpectedOutput))
      })
    })

    describe('balance output', () => {
      it("should be the sum of the current balance and the difference between credit and debit - test 1", () => {
        const expectedOutput = "19/04/2023 || 100.00 ||  || 100.00"

        view.printStatement(modelWithCredit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedOutput))
      })
      it("can be negative", () => {
        const expectedOutput = "19/04/2023 ||  || 100.00 || -100.00"

        view.printStatement(modelWithDebit)
        expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedOutput))
      })
    })

    it('should display multiple transactions in reverse order', () => {
      const model = {
        balance: 0,
        transactions: [creditTransaction, creditTransaction, debitTransaction]
      }
      const expectedOutput1 = "19/04/2023 || 100.00 ||  || 100.00"
      const expectedOutput2 = "19/04/2023 || 100.00 ||  || 200.00"
      const expectedOutput3 = "19/04/2023 ||  || 100.00 || 100.00"

      view.printStatement(model)
      expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedOutput3))
      expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedOutput2))
      expect(consoleSpy).toHaveBeenCalledWith(expect.stringContaining(expectedOutput1))
    })
  })
})
