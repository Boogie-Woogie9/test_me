# frozen_string_literal: true

# model for Student
class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :group
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 8 }
  validates :study_group, presence: true

  # # Возвращает дайджест для указанной строки.
  # def self.digest(string)
  #   cost = if ActiveModel::SecurePassword.min_cost
  #            BCrypt::Engine::MIN_COST
  #          else
  #            BCrypt::Engine.cost
  #          end
  #   BCrypt::Password.create(string, cost:)
  # end

  # # Возвращает случайный токен.
  # def self.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def remember
  #   self.remember_token = Student.new_token
  #   update_attribute(:remember_digest, Student.digest(remember_token))
  # end
end
