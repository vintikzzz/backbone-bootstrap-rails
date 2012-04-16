collection @posts, object_root: false
attributes :id, :created_at, :updated_at
node :content do |p|
  strip_tags(p.content)
end
node :title do |p|
  strip_tags(p.title)
end
node :markdown do |p|
  markdown(p.content)
end
node :truncate do |p|
  truncate(strip_tags(markdown(p.content)))
end
