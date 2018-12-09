module MarkdownHelper
  def md_to_html(md_text)
    options = {
      space_after_headers: true
    }

    extensions = {
      autolink:           true,
      no_intra_emphasis:  true,
      fenced_code_blocks: true,
      tables: true
    }
    unless @markdown
      renderer = Redcarpet::Render::OriginalHTML.new(options)
      @markdown = Redcarpet::Markdown.new(renderer, extensions)
    end

    @markdown.render(md_text).html_safe
  end
end
