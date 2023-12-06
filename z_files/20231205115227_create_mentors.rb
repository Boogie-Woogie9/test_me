# frozen_string_literal: true

# таблица Преподаватели в базе данных
class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :surname, null: false                            # фамилия
      t.string :name, null: false                               # имя
      t.string :email, null: false, unique: true                # электронная почта (логин)
      t.string :password_digest, null: false                    # пароль (зашифрованный)
      t.string :remember_digest                                 # вход с запоминанием
      t.integer :groups, array: true, default: []               # номер группы (у студента)
      t.timestamps
    end
  end
end
