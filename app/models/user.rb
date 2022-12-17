class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         :registerable, jwt_revocation_strategy: JwtDenylist
  has_many :items, class_name: 'Item', foreign_key: 'user_id', dependent: :destroy
  has_many :categories, class_name: 'Category', foreign_key: 'user_id', dependent: :destroy
  has_many :carts, class_name: 'Cart', foreign_key: 'user_id', dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
