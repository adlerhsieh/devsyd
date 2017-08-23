class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  def content_html
    MarkdownRender.new(text: content).render
  end
end
