class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title
    validates :text
  end
end
