require_relative "./lib/database_connection"
require_relative "./lib/post_repository.rb"

DatabaseConnection.connect("blog")

post = PostRepository.new
post1 = post.find_with_comments(1)

post1.comments.each {|comment| p "#{post1.title.upcase} - #{post1.content} #{post1.title.upcase} - #{comment.author}: #{comment.content}" }
# post.all.each { |post| p post }
