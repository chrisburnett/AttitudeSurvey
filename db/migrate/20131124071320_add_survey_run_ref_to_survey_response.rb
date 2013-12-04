class AddSurveyRunRefToSurveyResponse < ActiveRecord::Migration
  def change
    add_reference :survey_responses, :survey_run, index: true
  end
end
