class AddActiveToSurveyRuns < ActiveRecord::Migration
  def change
    add_column :survey_runs, :active, :boolean
  end
end
