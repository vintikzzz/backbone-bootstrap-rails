object false
@posts ||= locals[:object][:page]
node(:current_page) { @posts.current_page }
node(:total_items) { @posts.total_count }
node(:per_page) { @posts.limit_value }
node(:total_pages) { (@posts.offset_value / @posts.limit_value) + 1 }
node :items do
  @posts.map do |p|
    partial 'posts/post', object: p, root: false
  end
end

