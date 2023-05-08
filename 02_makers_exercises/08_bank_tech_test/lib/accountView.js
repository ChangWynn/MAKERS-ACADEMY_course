const { viewHelpers } = require('./viewHelpers')

class AccountView {
  printStatement (account) {
    const statement = this.formatAllTransactions(account)

    let output = 'date || credit || debit || balance\n'
    statement.forEach(transaction => {
      output += transaction
    })

    console.log(output)
  }
}

AccountView.prototype.formatAllTransactions = viewHelpers.formatAllTransactions
AccountView.prototype.formatTransaction = viewHelpers.formatTransaction
AccountView.prototype.formatDate = viewHelpers.formatDate
AccountView.prototype.formatAmount = viewHelpers.formatAmount
AccountView.prototype.calculateBalance = viewHelpers.calculateBalance

module.exports = AccountView
