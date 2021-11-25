# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable, :lockable, :timeoutable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  validates :name, presence: true
  validates :email, uniqueness: true
end
