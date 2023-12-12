# frozen_string_literal: true

# связующая таблица преподавателей и учебных групп
class CreateJoinTableGroupsMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :groups_mentors, id: false do |t|
      t.belongs_to :mentor
      t.belongs_to :group
    end
  end
end
