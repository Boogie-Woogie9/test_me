# frozen_string_literal: true

# model for Student
class Mentor < ApplicationRecord
  has_many :groups
  # class_name: "group", foreign_key: "reference_id"
  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :groups, presence: true

  # Возвращает дайджест для указанной строки.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost:)
  end

  # Возвращает случайный токен.
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Mentor.new_token
    update_attribute(:remember_digest, Mentor.digest(remember_token))
  end
end
