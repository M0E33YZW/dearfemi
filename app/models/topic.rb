class Topic < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :topic_tag_relations, dependent: :destroy
  has_many :tags, through: :topic_tag_relations
  has_many :comments, dependent: :destroy

  validate :text, unless: :was_attached?

  def was_attached?
    image.attached?
  end

  def self.search(search)
    if search != ''
      Topic.where('text LIKE(?)', "%#{search}%")
    else
      Topic.all
    end
  end
end
