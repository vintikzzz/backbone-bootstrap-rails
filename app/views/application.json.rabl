object false
node :currentUser do
  partial("users/show", object: user_signed_in? ? current_user : User.new(roles: [:guest]))
end
node :guestUser do
  partial("users/show", object: User.new(roles: [:guest]))
end
node :posts do
  partial("posts/index", object: {page: Post.order_by([:created_at, :desc]).page(1)})
end
node :defaultLocale do
  I18n.default_locale
end
node :locale do
  I18n.locale
end
