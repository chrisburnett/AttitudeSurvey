class CreateTextQuestions < ActiveRecord::Migration
  def change
    create_table :text_questions do |t|
      t.references :question, index: true
      t.string :question

      t.timestamps
    end
  end
end
