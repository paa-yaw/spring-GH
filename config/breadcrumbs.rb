crumb :root do
  link "Dashboard", admin_root_path
end

crumb :request do |request|
  link "Requests", admin_requests_path
  parent :root
end

crumb :new_request do |request|
  link "New Request", new_admin_client_request_path
  parent :root
end

crumb :show_request do |request|
  link request.id, admin_request_path(request)
  parent :request
end

crumb :edit_request do |request|
  link "Edit #{request.id}", edit_client_request_path(request) 
  parent :request	
end

crumb :client_request do |request|
	link "#{request.first_name}'s request", admin_client_requests_path(request)
	parent :clients
end

crumb :clients do |client|
  link "Clients", admin_clients_path 
  parent :root
end

crumb :worker do |worker|
	link "Workers", admin_workers_path
	parent :root
end

crumb :new_worker do |worker|
  link "New Worker", new_admin_worker_path
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