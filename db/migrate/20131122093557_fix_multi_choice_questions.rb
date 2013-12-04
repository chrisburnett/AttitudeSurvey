class FixMultiChoiceQuestions < ActiveRecord::Migration
  def change
    rename_column :choices, :question_id, :multi_choice_question_id
  end
end
