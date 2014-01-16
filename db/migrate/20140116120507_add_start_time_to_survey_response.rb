class AddStartTimeToSurveyResponse < ActiveRecord::Migration
  def change
    add_column :survey_responses, :start_time, :datetime
  end
end
