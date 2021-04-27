class Tag < ApplicationRecord
  validates :tagname, presence: true, uniqueness: true, length: { maximum:50}
  has_many :topic_tag_relations, dependent: :destroy
  has_many :topics, through: :topic_tag_relations
end
