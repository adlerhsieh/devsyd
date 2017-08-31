class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  belongs_to :parent_comment, class_name: "Comment", primary_key: :id, foreign_key: :parent_id, optional: true
  has_many :comments, class_name: "Comment", primary_key: :id, foreign_key: :parent_id
end
