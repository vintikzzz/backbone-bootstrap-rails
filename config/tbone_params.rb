@posts = Post.order_by([:created_at, :desc]).page(1)
{
  I18n: {
    default_locale: I18n.default_locale,
    locale: I18n.locale
  },
  posts: render_bootstrap_data('posts/index')
}
