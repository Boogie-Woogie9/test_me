class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|                                  # создание таблицы users
      t.string :surname, null: false                            # фамилия
      t.string :name, null: false                               # имя
      t.string :patronymic                                      # отчество (при наличии)
      t.string :email, null: false, unique: true                # электронная почта (логин)
      t.string :password_digest, null: false                    # пароль (зашифрованный)
      t.string :group                                           # номер группы (у студента)
      t.integer :type_user, default: 0, null: false             # флаг студента, преподавателя или администратора
      t.timestamps                                              # метки создания учетной записи
    end
  end
end
