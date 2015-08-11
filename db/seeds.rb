seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
Role.delete_all
User.delete_all
Gender.delete_all
Subject.delete_all
Level.delete_all
DayOfWeek.delete_all
TimeOfDay.delete_all
ClassDetail.delete_all
AdminUser.delete_all

Gender.create!(config["gender_list"])
Subject.create!(config["subject_list"])
Level.create!(config["level_list"])
Role.create!(config["role_list"])
User.create!(config["user_list"])
DayOfWeek.create!(config["day_of_week_list"])
TimeOfDay.create!(config["time_of_day_list"])
ClassDetail.create!(config["class_detail_list"])
AdminUser.create!(email: 'admin@example.com', password: '12345678', 
  password_confirmation: '12345678') 
# Category.create!(config["category_list"])
# params_post = config["post_list"]
# # params_post["user_id"] = User.all.sample
# params_post.each do |pp|
#       pp["user_id"] = User.all.sample.id
#   end
# Post.create(params_post)
# posts = Post.all
# categories_posts_list = [
#   [Post.all.sample.id, Category.all.sample.id],
#   [Post.all.sample.id, Category.all.sample.id]
# ]
# categories_posts_list.each do |postid, cateid|
#   CategoriesPost.create(
#             post_id: postid,
#             category_id: cateid
#     )
# end
# params_command = config["command_list"]
# params_command.each do |pm|
#   pm["user_id"] = User.all.sample.id
#   pm["post_id"] = Post.all.sample.id
# end
# Command.create(params_command)