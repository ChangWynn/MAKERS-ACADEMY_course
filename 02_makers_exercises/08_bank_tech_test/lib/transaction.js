class Transaction {
  #date; #debit; #credit

  constructor () {
    this.#date = new Date()
    this.#credit = 0
    this.#debit = 0
  }

  get date () { return this.#date }

  get credit () { return this.#credit }

  get debit () { return this.#debit }

  set credit (amount) {
    this.#credit = amount
  }

  set debit (amount) {
    this.#debit = amount
  }
}

module.exports = Transaction
