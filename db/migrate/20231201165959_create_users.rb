class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|                                  # создание таблицы users
      t.string :name, null: false                               # имя
      t.string :email, null: false, unique: true                # электронная почта
      t.string :password_digest, null: false                    # пароль (зашифрованный)
      t.string :group, null: false
      t.integer :type_user, default: 0, null: false             # флаг студента, преподавателя или администратора
      t.timestamps                                              # метки создания учетной записи
    end
  end
end
