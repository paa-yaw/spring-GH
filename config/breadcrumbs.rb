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
  link "No.#{request.id}", request
  parent :request
end

crumb :edit_request do |request|
  link "Edit #{request.id}", request 
  parent :request	
end

# crumb :state_of_requests do |request|
#   link "State of Requests", admin_state_of_requests_path
#   parent :root
# end

crumb :client_request do |request|
	link "#{request.first_name}'s request", admin_client_requests_path(request)
	parent :clients
end

crumb :clients do |client|
  link "Clients", admin_clients_path 
  parent :root
end

crumb :client_registration do |client|
  link "Client Registration", new_admin_client_path
  parent :root
end

crumb :show_client do |client|
  link "#{client.first_name}", admin_client_path(client)
  parent :clients
end

crumb :edit_client do |client|
  link "Edit #{client.first_name}", admin_client_path(client)
  parent :clients
end 

crumb :admin_list do |admin|
  link "Admins", admin_list_path
  parent :root
end

crumb :show_admin do |admin|
  link "#{admin.first_name}", admin_client_path(admin) 
  parent :admin_list
end

crumb :admin_registration do |admin|
  link "Admin Registration", admin_registration_path
  parent :root
end

crumb :edit_admin do |admin|
  link "Edit #{admin.first_name}", admin_client_path(admin)
  parent :admin_list
end

crumb :workers do |worker|
	link "Workers", admin_workers_path
	parent :root
end

crumb :new_worker do |worker|
  link "New Worker", new_admin_worker_path
  parent :root
end

crumb :show_worker do |worker|
  link worker.first_name, admin_worker_path(worker)
  parent :workers
end

crumb :edit_worker do |worker|
  link "Edit #{worker.first_name}", admin_worker_path(worker)
  parent :workers
end

crumb :history do |worker|
  link "Workers' History", admin_workers_history_path
  parent :root
end

crumb :worker_history do |worker|
  link worker.first_name, admin_worker_history_path(worker)
  parent :history
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