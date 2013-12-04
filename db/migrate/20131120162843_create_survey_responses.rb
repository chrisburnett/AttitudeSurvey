class CreateSurveyResponses < ActiveRecord::Migration
  def change
    create_table :survey_responses do |t|
      t.string :rnid
      t.timestamps
    end
  end
end
