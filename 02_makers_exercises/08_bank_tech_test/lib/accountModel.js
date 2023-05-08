const Transaction = require('./transaction')

class AccountModel {
  #balance; #transactions

  constructor () {
    this.#balance = 0
    this.#transactions = []
  }

  get balance () { return this.#balance }

  set balance (amount) { this.#balance = amount }

  get transactions () { return this.#transactions }

  addTransaction (amount) {
    if (this.#isNotValid(amount)) return

    const transaction = new Transaction()
    if (amount > 0) transaction.credit = amount
    if (amount < 0) transaction.debit = -amount

    this.transactions.push(transaction)
  }

  #isNotValid (amount) {
    if (typeof amount !== 'number') return true
    else if (amount === 0) return true
    else return false
  }
}

module.exports = AccountModel
