require "recipe_directory"

describe RecipeDirectory do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipes.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end
  before(:each) do 
    reset_recipes_table
  end

  context "#all method" do
    it "should return a list of recipes" do
      result = subject.all
      expect(result.length).to eq 2
      expect(result.first.name).to eq "lasagna"
      expect(result.first.cooking_time).to eq "15"
      expect(result.first.rating).to eq "5"
    end
  end
  context "#find method" do
    it "should return a single recipe from id" do
      result = subject.find(2)
      expect(result.name).to eq "hamburger"
      expect(result.cooking_time).to eq "15"
      expect(result.rating).to eq "5"
    end
  end
end