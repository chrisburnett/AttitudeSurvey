class CreateQuestionnaireResponses < ActiveRecord::Migration
  def change
    create_table :questionnaire_responses do |t|
      t.references :survey_response, index: true
      t.boolean :participation
      t.string :gender
      t.string :employment_status
      t.string :age_range
      t.text :open_feedback
      t.boolean :app_user
      t.timestamps
    end
  end
end
