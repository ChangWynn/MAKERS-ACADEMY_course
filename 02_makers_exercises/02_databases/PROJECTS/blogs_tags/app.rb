require_relative "lib/database_connection"
require_relative "lib/post_repository"
require_relative "lib/tag_repository"

DatabaseConnection.connect("blog_posts_tags")

# repo = PostRepository.new
# result = repo.find_by_tag("coding")
# result.each { |post| p "#{post.title}"}

tag_repo = TagRepository.new
tag_result = tag_repo.find_by_post(5)
tag_result.each { |tag| p "#{tag.name}"}