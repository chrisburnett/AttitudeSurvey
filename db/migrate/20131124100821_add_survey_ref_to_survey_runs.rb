class AddSurveyRefToSurveyRuns < ActiveRecord::Migration
  def change
    add_reference :survey_runs, :survey
  end
end
