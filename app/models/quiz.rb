# модель теста
class Quiz < ApplicationRecord
  has_many :questions,  dependent: :destroy, inverse_of: :quiz
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  belongs_to :mentor
  validates :title, 
    presence: true, 
    length: { maximum: 50 },
    uniqueness: { case_sensitive: false} 
  # def correct_answer_text
  #   # answer1, answer2, answer3, answer4 are in the model
  #   send("answer#{correct_answer}")
  # end
end
