require "account_repository"

describe AccountRepository do

  def reset_accounts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_accounts_table
  end

  context "#all method" do
    it "should return a list of accounts" do
      result = subject.all
      expect(result.length).to eq 2 
      expect(result.first.id).to eq '1'
      expect(result.first.username).to eq 'Chang'
      expect(result.first.email).to eq 'chang@gmail.com'
      expect(result.last.id).to eq '2'
      expect(result.last.username).to eq 'Jim'
      expect(result.last.email).to eq 'jim@gmail.com'
    end
  end
  
  context "#find method" do
    it "should return a single accounts given its index" do
      result = subject.find(2)
      expect(result.id).to eq '2'
      expect(result.username).to eq 'Jim'
      expect(result.email).to eq 'jim@gmail.com'
    end
  end

  context "#create method" do
    it "should add an account into the table" do
      account = double :Account, username: 'Jo', email: 'jo@gmail.com'
      subject.create(account)

      result = subject.find(3)
      expect(result.id).to eq '3'
      expect(result.username).to eq 'Jo'
      expect(result.email).to eq 'jo@gmail.com'

      result_2 = subject.all
      expect(result_2.length).to eq 3
      expect(result_2.last.username).to eq 'Jo'
      expect(result_2.last.email).to eq 'jo@gmail.com'
    end
  end

  context "#delete method" do
    it "should delete an account from the table" do
      subject.delete(1)
      result = subject.all
      expect(result.length).to eq 1
      expect(result.first.id).to eq '2'
      expect(result.first.username).to eq 'Jim'
      expect(result.first.email).to eq 'jim@gmail.com'

      expect { subject.find(1) }.to raise_error IndexError
    end
  end
  context "#update method" do
    it "should update an account from the table" do
      account = subject.find(1)
      account.username = 'Jane'
      account.email = 'jane@gmail.com'

      subject.update(account)

      result = subject.find(1)
      expect(result.id).to eq '1'
      expect(result.username).to eq 'Jane'
      expect(result.email).to eq 'jane@gmail.com'
    end
    it "should update one account poperty from the table" do
      account = subject.find(1)
      account.email = 'chang2@gmail.com'

      subject.update(account)

      result = subject.find(1)
      expect(result.id).to eq '1'
      expect(result.username).to eq 'Chang'
      expect(result.email).to eq 'chang2@gmail.com'
    end
  end
end