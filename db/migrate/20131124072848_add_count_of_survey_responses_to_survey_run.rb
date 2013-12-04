class AddCountOfSurveyResponsesToSurveyRun < ActiveRecord::Migration
  def change
    add_column :survey_runs, :count_of_survey_responses, :integer
  end
end
