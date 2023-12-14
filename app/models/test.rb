# frozen_string_literal: true

# модель теста, содержащего задания
class Test < ApplicationRecord
  belongs_to :mentor
  has_many :questions

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :description, presence: true, length: { minimum: 10, maximum: 150 }
  validates :mentor_id, presence: true

  # validates :time_limit, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
