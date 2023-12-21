class CreateQuizSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_submissions do |t|
      t.references :student, null: false, foreign_key: true # user-> mentor
      t.references :quiz, null: false, foreign_key: true
      t.float :score
      t.json :user_answers

      t.timestamps
    end
  end
end
