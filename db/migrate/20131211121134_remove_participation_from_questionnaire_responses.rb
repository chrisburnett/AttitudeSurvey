class RemoveParticipationFromQuestionnaireResponses < ActiveRecord::Migration
  def change
    remove_column :questionnaire_responses, :participation, :boolean
  end
end
