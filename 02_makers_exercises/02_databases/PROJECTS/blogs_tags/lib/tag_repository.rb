require_relative "./tag.rb"

class TagRepository
  def find_by_post(id)
    sql = "SELECT tags.id, tags.name
            FROM tags
            JOIN posts_tags ON tags.id = posts_tags.tag_id
            JOIN posts ON posts.id = posts_tags.post_id
            WHERE posts.id = $1"
    result_set = DatabaseConnection.exec_params(sql, [id])

    tags = []
    result_set.each do |record|
      tag = Tag.new
      tag.id = record["id"]
      tag.name = record["name"]
      tags << tag
    end

    return tags
  end
end