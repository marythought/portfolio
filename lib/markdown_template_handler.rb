# https://bloggie.io/@kinopyo/rails-render-markdown-views-and-partials
class MarkdownTemplateHandler
  def call(template)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

    "#{markdown.render(template.source).inspect}.html_safe;"
  end
end
