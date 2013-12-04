class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :role
      t.text :description

      t.timestamps
    end
  end
end
