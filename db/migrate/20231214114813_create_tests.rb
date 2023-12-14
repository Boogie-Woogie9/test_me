# frozen_string_literal: true

# создаем таблицу Тесты в базе данных
class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :name            # название теста
      t.text :description       # описание темы и заданий теста
      t.timestamps
    end
  end
end
