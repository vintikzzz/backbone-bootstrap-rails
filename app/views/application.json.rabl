object false
node :currentUser do
  partial("users/show", object: user_signed_in? ? current_user : User.new)
end
node :guestUser do
  partial("users/show", object: User.new)
end
node :posts do
  partial("posts/index", object: Post.all)
end
