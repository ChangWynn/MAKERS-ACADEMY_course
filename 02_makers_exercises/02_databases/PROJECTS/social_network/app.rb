require_relative "lib/database_connection"
require_relative "lib/account_repository"
require_relative "lib/post_repository"

DatabaseConnection.connect("social_network")

acc_repo = AccountRepository.new
# jim = Account.new
# jim.username = 'Jim'
# jim.email = 'jim@gmail.com'

# acc_repo.create(jim)

acc_repo.all.each do |account|
  p "#{account.id} - #{account.username} - #{ account.email }" 
end

post_repo = PostRepository.new

# post1 = Post.new
# post1.title = "Almost Finished"
# post1.content = "It's been 2hours"
# post1.views = 0
# post1.account_id = 1

# post_repo.create(post1)

post_repo.all.each do |post|
  p "#{post.id} - #{post.title} - #{ post.content } - #{ post.views } - #{ post.account_id }" 
end