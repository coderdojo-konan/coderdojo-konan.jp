require 'oembed'

module OembedHelper
  def oembed(embed_url)
    OEmbed::Providers.register_all

    return generate_oembed_html(embed_url.strip)
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
