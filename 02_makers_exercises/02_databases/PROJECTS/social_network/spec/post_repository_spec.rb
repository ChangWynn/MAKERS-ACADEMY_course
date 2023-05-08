require "post_repository"

describe PostRepository do

  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_posts_table
  end

  context "#all method" do
    it "should return a list of posts" do
      result = subject.all
      expect(result.length).to eq 2 
      expect(result.first.id).to eq '1'
      expect(result.first.title).to eq 'Hello World'
      expect(result.first.content).to eq 'A software engineer journey'
      expect(result.first.views).to eq '100'
      expect(result.first.account_id).to eq '1'

      expect(result.last.id).to eq '2'
      expect(result.last.title).to eq 'Hi there'
      expect(result.last.content).to eq 'My name is Chang'
      expect(result.last.views).to eq '10'
      expect(result.last.account_id).to eq '1'
    end
  end
  
  context "#find method" do
    it "should return a single post given its index" do
      result = subject.find(2)
      expect(result.id).to eq '2'
      expect(result.title).to eq 'Hi there'
      expect(result.content).to eq 'My name is Chang'
      expect(result.views).to eq '10'
      expect(result.account_id).to eq '1'
    end
  end

  context "#create method" do
    it "should add a post into the table" do
      post = double :Post, title: 'OMG', content: 'This video has been going on for so long', views: '1', account_id: '1' 
      subject.create(post)

      result = subject.find(3)
      expect(result.id).to eq '3'
      expect(result.title).to eq 'OMG'
      expect(result.content).to eq 'This video has been going on for so long'
      expect(result.views).to eq '1'
      expect(result.account_id).to eq '1'

      result_2 = subject.all
      expect(result_2.length).to eq 3
    end
  end

  context "#delete method" do
    it "should delete a post from the table" do
      subject.delete(1)
      result = subject.all
      expect(result.length).to eq 1
      expect(result.first.id).to eq '2'
      expect(result.first.title).to eq 'Hi there'
      expect(result.first.content).to eq 'My name is Chang'
      expect(result.first.views).to eq '10'
      expect(result.first.account_id).to eq '1'

      expect { subject.find(1) }.to raise_error IndexError
    end
  end
  context "#update method" do
    it "should update an post from the table" do
      post = subject.find(1)
      post.title = "Hello World!"
      post.content = "A software developer journey"
      post.views = "0"
      post.account_id = "2"
      

      subject.update(post)

      result = subject.find(1)
      expect(result.id).to eq '1'
      expect(result.title).to eq "Hello World!"
      expect(result.content).to eq "A software developer journey"
      expect(result.views).to eq "0"
      expect(result.account_id).to eq "2"
    end
    it "should update one account poperty from the table" do
      post = subject.find(1)
      post.title = "Hello World!"

      subject.update(post)

      result = subject.find(1)
      expect(result.id).to eq '1'
      expect(result.title).to eq "Hello World!"
      expect(result.content).to eq 'A software engineer journey'
      expect(result.views).to eq '100'
      expect(result.account_id).to eq '1'
    end
  end
end