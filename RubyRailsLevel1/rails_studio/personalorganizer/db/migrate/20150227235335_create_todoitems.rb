class CreateTodoitems < ActiveRecord::Migration
  def change
    create_table :todoitems do |t|
      t.string :name
      t.date :dateToDo
      t.string :purpose

      t.timestamps
    end
  end
end
