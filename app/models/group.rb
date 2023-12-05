# frozen_string_literal: true

# валидация модели Группа
class Group < ApplicationRecord
  validates :id, uniqueness: true
  validates :group_name, uniqueness: true
end
