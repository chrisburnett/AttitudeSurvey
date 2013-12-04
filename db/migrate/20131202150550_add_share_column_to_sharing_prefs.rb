class AddShareColumnToSharingPrefs < ActiveRecord::Migration
  def change
    add_column :sharing_prefs, :share, :boolean
  end
end
