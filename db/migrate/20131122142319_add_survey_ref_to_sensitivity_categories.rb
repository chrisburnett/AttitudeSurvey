class AddSurveyRefToSensitivityCategories < ActiveRecord::Migration
  def change
    add_reference :sensitivity_categories, :survey, index: true
  end
end
