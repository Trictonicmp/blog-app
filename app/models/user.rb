class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  ROLES = %i[admin user].freeze

  def is?(role)
    self.role == role.to_s
  end

  def three_most_recent_post
    posts.order(created_at: :desc).first(3)
  end

  validates :name, presence: true, length: { in: 2...25 }
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
