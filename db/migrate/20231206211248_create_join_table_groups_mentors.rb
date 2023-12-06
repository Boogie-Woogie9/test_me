# frozen_string_literal: true

# связующая таблица преподавателей и учебных групп
class CreateJoinTableGroupsMentors < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :mentors do |t|
      t.index %i[group_id mentor_id]
      t.index %i[mentor_id group_id]
    end
  end
end
