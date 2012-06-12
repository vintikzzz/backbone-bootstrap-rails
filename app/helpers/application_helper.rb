module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new({filter_html: true, safe_links_only: true}), :autolink => true, :space_after_headers => true)
    markdown.render(text)
  end
  def with_format(format, &block)
    old_format = @template_format
    @template_format = format
    result = block.call
    @template_format = old_format
    return result
  end
end
