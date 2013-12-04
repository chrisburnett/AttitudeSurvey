class CreateSliderQuestions < ActiveRecord::Migration
  def change
    create_table :slider_questions do |t|
      t.references :question, index: true
      t.string :min
      t.string :max

      t.timestamps
    end
  end
end
