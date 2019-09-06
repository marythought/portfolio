require Rails.root.join('lib', 'markdown_template_handler')

ActionView::Template.register_template_handler(:md, MarkdownTemplateHandler.new)