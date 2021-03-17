class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum role: {super_admin: 0, regular_user: 1}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
