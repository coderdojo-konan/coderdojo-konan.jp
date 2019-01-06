require 'oembed'

class Redcarpet::Render::OriginalHTML < Redcarpet::Render::HTML
  def header(text, level)
    level += 1
    "<h#{level}>#{text}</h#{level}>"
  end

  def postprocess(full_document)
    OEmbed::Providers.register_all

    regex_oembed = /\[oembed:(.+)\]/
    full_document.gsub(regex_oembed){ generate_oembed_html($1.strip) }
  end

  private
    def generate_oembed_html(oembed_url)
      resource = OEmbed::Providers.get(oembed_url)
      html = resource.html

      "<div class='oembed oembed_#{resource.type}'>#{html}</div>"
    rescue OEmbed::NotFound
      warn "No embeddable content at #{oembed_url}"
      "<a href='#{oembed_url}'>#{oembed_url}</a>"
    end
end
