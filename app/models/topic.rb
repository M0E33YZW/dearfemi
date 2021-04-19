class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts

  with_options presence: true do
    validates :title
    validates :text
  end
end
