collection @posts, object_root: false
attributes :id, :title, :content, :created_at, :updated_at
node :markdown do |p|
  markdown(p.content)
end
node :truncate do |p|
  truncate(strip_tags(markdown(p.content)))
end
