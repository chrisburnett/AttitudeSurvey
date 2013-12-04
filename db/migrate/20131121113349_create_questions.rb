class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.text :description
      t.references :survey
      t.string :type
      t.timestamps
    end
  end
end
