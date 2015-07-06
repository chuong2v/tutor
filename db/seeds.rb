seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Role.create(config["role_list"])
User.create(config["user_list"])
Category.create!(config["category_list"])
params_post = config["post_list"]
# params_post["user_id"] = User.all.sample
params_post.each do |pp|
      pp["user_id"] = User.all.sample.id
  end
Post.create(params_post)
posts = Post.all
categories_posts_list = [
  [Post.all.sample.id, Category.all.sample.id],
  [Post.all.sample.id, Category.all.sample.id]
]
categories_posts_list.each do |postid, cateid|
  CategoriesPost.create(
            post_id: postid,
            category_id: cateid
    )
end
params_command = config["command_list"]
params_command.each do |pm|
  pm["user_id"] = User.all.sample.id
  pm["post_id"] = Post.all.sample.id
end
Command.create(params_command)