class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         invite_for: 2.weeks

  with_options presence: true do
    validates :name
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }, uniqueness: true
    validates :birthday
  end

  has_many :topics
  has_many :comments
end
