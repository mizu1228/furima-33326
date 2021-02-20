crumb :root do
  link "Home", root_path
end

crumb :item_new do
  link "出品ページ", new_item_path
  parent :root
end

crumb :item_show do
  link "商品ページ", item_path
  parent :root
end

crumb :item_edit do
  link "商品編集ページ", edit_item_path
  parent :item_show
end

crumb :order_item do
  link "購入ページ", item_orders_path
  parent :root
end

crumb :user_show do
  link "ユーザーページ", user_path(current_user.id)
  parent :root
end

crumb :user_edit do
  link "ユーザー編集", edit_user_registration_path
  parent :user_show
end

crumb :user_delete do
  link "退会ページ", user_path(:id)
  parent :user_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).