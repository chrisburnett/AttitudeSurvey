class AddDisplayOrderToSensitivityCategories < ActiveRecord::Migration
  def change
    add_column :sensitivity_categories, :display_order, :integer
  end
end
