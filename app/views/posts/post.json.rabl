attributes :id, :title, :content, :created_at, :updated_at
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
node :is_manageable? do |p|
  can? :manage, p
end
node :user_email do |p|
  p.user.nil? ? 'unknown' : p.user.email
end
