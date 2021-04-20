class Topic < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true do
    validates :title
    validates :text
  end

  def self.search(search)
    if search != ""
      Topic.where('text LIKE(?)', "%#{search}%")
    else
      Topic.all
    end
  end
end
