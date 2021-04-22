class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image

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
