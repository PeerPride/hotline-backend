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

  after_create :assign_language

  has_many :lead_teams, :class_name => 'Team', :foreign_key => 'lead_id'
  has_and_belongs_to_many :languages
  has_and_belongs_to_many :teams, join_table: 'teams_users'

  def go_on_call
    OnCallManager.put_on_call(self, 'Phone', self.languages.first) #temporary
  end

  def go_off_call()
    OnCallManager.take_off_call(self, 'Phone', self.languages.first) #temporary
  end

  private
    def assign_languages
      self.languages << Language.first
    end
end
