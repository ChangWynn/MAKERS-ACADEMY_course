require "post_repository"

describe PostRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts_tags.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'posts_tags_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_posts_table
  end

  it "should return a list of all posts for a given tag" do
    result = subject.find_by_tag("coding")
    expect(result.length).to eq 4
    expect(result.first.title).to eq "How to use Git"
    expect(result.last.title).to eq "SQL basics"
  end
end