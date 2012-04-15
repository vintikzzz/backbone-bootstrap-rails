object @post
attributes :id, :title, :content, :created_at, :updated_at
node :markdown do
  markdown(@post.content)
end
node :truncate do |p|
  truncate(strip_tags(markdown(p.content)))
end
