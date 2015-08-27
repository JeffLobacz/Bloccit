module PostsHelper

  def markdown_title
    render_as_markdown
  end

  def markdown_body
    render_as_markdown
  end

  private

  def render_as_markdown(markdown)
    renderer = Redcarpet::Render::HTML.new
    extentions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extentions)
    (redcarpet.render markdown).html_safe
  end
end
