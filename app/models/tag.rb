class Tag < ApplicationRecord
  has_many :topic_tag_relations
  has_many :topics, through: :topic_tag_relations
end
