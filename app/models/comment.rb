class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic, dependent: :destroy
  has_one_attached :image

  validates :comment, presence: true, unless: :was_attached?

  def was_attached?
    image.attached?
  end
end
