require_relative "./recipe.rb"

class RecipeDirectory
  def all
    recipes = []
    sql = 'SELECT * FROM recipes;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |recipe|
      entry = Recipe.new
      entry.id = recipe["id"]
      entry.name = recipe["name"]
      entry.cooking_time = recipe["cooking_time"]
      entry.rating = recipe["rating"]
      recipes << entry
    end
    return recipes
  end

  def find(id)
    sql = 'SELECT name, cooking_time, rating FROM recipes WHERE id = $1'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)

    recipe = result_set[0]

    entry = Recipe.new
    entry.id = recipe["$1"]
    entry.name = recipe["name"]
    entry.cooking_time = recipe["cooking_time"]
    entry.rating = recipe["rating"]

    return entry
  end

end