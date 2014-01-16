class AddCommentsToQuestionnaireResponses < ActiveRecord::Migration
  def change
    add_column :questionnaire_responses, :comments, :text
  end
end
