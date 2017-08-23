class MarkdownRender
  def initialize(text:)
    @text = text
  end

  def render
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
    markdown.render(@text)
  end
end
