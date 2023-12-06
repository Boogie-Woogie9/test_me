# frozen_string_literal: true

# таблица Студенты в базе данных
class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.belongs_to :group
      t.string :surname, null: false                            # фамилия
      t.string :name, null: false                               # имя
      t.string :email, null: false, unique: true                # электронная почта (логин)
      t.string :password_digest, null: false                    # пароль (зашифрованный)
      t.string :remember_digest                                 # вход с запоминанием
      t.string :group                                           # номер группы (у студента)
      t.timestamps
    end
  end
end
