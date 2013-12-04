class CreateSensitivityCategories < ActiveRecord::Migration
  def change
    create_table :sensitivity_categories do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
