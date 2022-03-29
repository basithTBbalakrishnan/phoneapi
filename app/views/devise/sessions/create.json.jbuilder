json.user do |json|
  json.partial! 'users/login_user', user: current_user
end