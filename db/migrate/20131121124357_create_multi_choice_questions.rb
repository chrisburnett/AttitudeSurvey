class CreateMultiChoiceQuestions < ActiveRecord::Migration
  def change
    create_table :multi_choice_questions do |t|
      t.references :question, index: true
      t.string :question

      t.timestamps
    end
  end
end
