require 'github/markup'

module MessagesHelper

  def username( user )
    user == current_user ? "me" : user.email.split("@")[0]
  end

  def render_markdown( text )
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, prettify: true)
    markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true, autolink: true, tables: true, highlight: true)
    markdown.render( emojify(text) ).html_safe
    # GitHub::Markup.render_s(GitHub::Markups::MARKUP_MARKDOWN, text).html_safe
    # sanitize Kramdown::Document.new(text, input: 'GFM').to_html
  end
end
