class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :multi_choice_question, index: true
      t.string :choice

      t.timestamps
    end
  end
end
