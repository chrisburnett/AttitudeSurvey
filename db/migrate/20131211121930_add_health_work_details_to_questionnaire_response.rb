class AddHealthWorkDetailsToQuestionnaireResponse < ActiveRecord::Migration
  def change
    add_column :questionnaire_responses, :worked_in_healthcare, :boolean
    add_column :questionnaire_responses, :worked_in_healthcare_occupation, :string
  end
end
