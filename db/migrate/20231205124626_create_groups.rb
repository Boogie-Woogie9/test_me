# frozen_string_literal: true

# таблица Группы в базе данных
class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :group_name # номер группы
    end
  end
end
