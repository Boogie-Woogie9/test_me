# frozen_string_literal: true

# модель теста, содержащего задания
class Test < ApplicationRecord
  belongs_to :mentor, foreign_key: 'mentor_id'
  has_many :questions
end
