class Topic < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :topic_tag_relations
  has_many :tags, through: :topic_tag_relations
  has_many :comments

  with_options presence: true do
    validates :title
    validates :text, unless: :was_attached?
  end

  def self.search(search)
    if search != ''
      Topic.where('text LIKE(?)', "%#{search}%")
    else
      Topic.all
    end
  end

  def was_attached?
    image.attached?
  end
end
