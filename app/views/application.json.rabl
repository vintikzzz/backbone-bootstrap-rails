object false
node :currentUser do
  partial("users/show", object: current_user || User.new)
end
node :guestUser do
  partial("users/show", object: User.new)
end
