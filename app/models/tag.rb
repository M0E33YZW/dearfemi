class Tag < ApplicationRecord
  has_many :topic_tag_relations, dependent: :destroy
  has_many :topics, through: :topic_tag_relations

  validates :tagname, uniqueness: true, length: { maximum: 30 }
end
