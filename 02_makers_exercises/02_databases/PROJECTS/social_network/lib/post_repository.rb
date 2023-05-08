require_relative "./post"

class PostRepository
  def all
    posts = []
    sql = 'SELECT * FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      posts << _record_to_object(record)
    end
    return posts
  end


  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    record = result_set[0]

    return _record_to_object(record)
  end 

  def create(post)
    sql = 'INSERT INTO posts 
            (title, content, views, account_id) 
            VALUES($1, $2, $3, $4)'
    sql_params = [post.title, post.content, post.views, post.account_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

  def update(post)
    sql = 'UPDATE posts SET title = $1, content = $2, views = $3, account_id = $4 WHERE id = $5;'
    sql_params = [post.title, post.content, post.views, post.account_id, post.id ]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  private

  def _record_to_object(record)
    post = Post.new
    post.id = record["id"]
    post.title = record["title"]
    post.content = record["content"]
    post.views = record["views"]
    post.account_id = record["account_id"]
    return post
  end

end