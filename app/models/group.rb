# frozen_string_literal: true

# валидация модели Группа
class Group < ApplicationRecord
  has_and_belongs_to_many :mentors
  validates :id, uniqueness: true
  validates :group_name, uniqueness: true, presence: true
end
