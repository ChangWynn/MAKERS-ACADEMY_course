require_relative "lib/database_connection"
require_relative "lib/recipe_directory"

DatabaseConnection.connect("recipes_directory")
recipe_repo = RecipeDirectory.new

recipe_repo.all.each { |recipe| p recipe }

p recipe_repo.find(2)