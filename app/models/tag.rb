class Tag < ApplicationRecord
  has_many :topic_tag_relations, dependent: :destroy
  has_many :topics, through: :topic_tag_relations

  validates :tagname, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 50 }
end
