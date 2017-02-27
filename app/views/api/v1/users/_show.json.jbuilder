json.extract! @current_user, :id, :email
json.first_name @current_user.first_name.to_s
json.last_name @current_user.last_name.to_s
json.contact_no @current_user.contact_no.to_s