class AddFinishTimeToSurveyResponse < ActiveRecord::Migration
  def change
    add_column :survey_responses, :finish_time, :datetime
  end
end
