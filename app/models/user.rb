class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :listings, dependent: :destroy, foreign_key: 'host_id'
  has_many :bookings, dependent: :destroy, foreign_key: 'guest_id'

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
