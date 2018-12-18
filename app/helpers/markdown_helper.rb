module MarkdownHelper
  def md_to_html(text)
    html_render = Redcarpet::Render::HTML.new(hard_wrap: true)
    options = {
        autolink: true,
        space_after_headers: true,
        no_intra_emphasis: true,
        fenced_code_blocks: true,
        tables: true
    }
    markdown = Redcarpet::Markdown.new(html_render, options)
    markdown.render(text)
  end
end
