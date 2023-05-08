require "tag_repository"

describe TagRepository do
  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts_tags.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'posts_tags_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_posts_table
  end

  it "should return a list of all tags for a given post ID" do
    result = subject.find_by_post(2)
    tags = []
    result.each do |tag|
      tags << tag.name
    end
    expect(result.length).to eq 2
    expect(tags).to contain_exactly "coding", "ruby"
  end
end