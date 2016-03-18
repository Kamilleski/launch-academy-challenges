class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :project, null: false
    end
  end
end
