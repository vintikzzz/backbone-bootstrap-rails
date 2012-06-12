object false
node :currentUser do
  partial("users/show", object: user_signed_in? ? current_user : User.new)
end
node :guestUser do
  partial("users/show", object: User.new)
end
node :posts do
  partial("posts/index", object: {page: Post.order_by([:created_at, :desc]).page(1)})
end
