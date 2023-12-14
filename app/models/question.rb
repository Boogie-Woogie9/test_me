# frozen_string_literal: true

# модель вопроса (задания) в тесте
class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
end
