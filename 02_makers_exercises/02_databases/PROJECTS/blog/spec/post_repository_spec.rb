require "post_repository"

describe PostRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_posts_table
  end

  context "#all method" do
    it "should return a list of posts" do
      result = subject.all
      expect(result.length).to eq 3
      expect(result.last.id).to eq '3'
      expect(result.last.title).to eq 'Week 2 At Makers'
      expect(result.last.content).to eq 'Github and stuff'
    end
  end
  context "#find_with_comments method" do
    it "should a post along with its comments" do
      result = subject.find_with_comments(1)
      expect(result.title).to eq "Hello World"
      expect(result.comments.length).to eq 2
      expect(result.comments[1].author).to eq 'Jim'
      expect(result.comments[1].content).to eq 'Loved it'
      expect(result.comments[0].author).to eq 'Chang'
      expect(result.comments[0].content).to eq 'Nice one'
    end
  end


end