class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :survey_response, index: true
      t.string :answer

      t.timestamps
    end
  end
end
