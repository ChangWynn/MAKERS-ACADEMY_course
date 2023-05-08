require_relative "./post"
require_relative "./comment"

class PostRepository
  def all
    sql = "SELECT * FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    posts = []
    result_set.each do |record|
      post = Post.new
      post.id = record["id"]
      post.title = record["title"]
      post.content = record["content"]
      posts << post
    end
    return posts
  end

  def find_with_comments(id)
    sql = "SELECT posts.id, posts.title, posts.content, 
            comments.id, comments.author, comments.content AS comment, comments.post_id
            FROM posts JOIN comments ON comments.post_id = posts.id 
            WHERE posts.id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])

    first_result = result_set.first

    post = Post.new
    post.id = first_result["id"]
    post.title = first_result["title"]
    post.content = first_result["content"]

    result_set.each do |record|
      comment = Comment.new
      comment.id = record["id"]
      comment.author = record["author"]
      comment.content = record["comment"]
      comment.post_id = record["post_id"]
      post.comments << comment
    end

    return post
  end
end