class CreateMajors < ActiveRecord::Migration
  def change
    create_table :majors do |t|
      t.string :name
      t.string :degree
      t.string :dept
    end

    create_table :users_majors, :id => false do |t|
    	t.references :user
    	t.references :major
    end

    add_index :users_majors, [:user_id, :major_id]
    add_index :users_majors, [:major_id, :user_id]
  end
end
