json.array!(@users) do |user|
  json.(user, *User.column_names)
  # Hidden N+1 query!
  json.followed(current_user.follows?(user))
end

# this is what is rendered from json format, and the array object is passed on as argument to
# success functioin
