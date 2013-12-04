class CreateSurveyRuns < ActiveRecord::Migration
  def change
    create_table :survey_runs do |t|

      t.timestamps
    end
  end
end
