require_relative "./post.rb"

class PostRepository
  def find_by_tag(tag)
    sql = "SELECT posts.id, posts.title
            FROM posts
            JOIN posts_tags ON posts_tags.post_id = posts.id
            JOIN tags ON posts_tags.tag_id = tags.id
            WHERE tags.name = $1;"
    result_set = DatabaseConnection.exec_params(sql, [tag])

    posts = []
    result_set.each do |record|
      post = Post.new
      post.id = record["id"]
      post.title = record["title"]
      posts << post
    end
    return posts
  end
end