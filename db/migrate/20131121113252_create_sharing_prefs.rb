class CreateSharingPrefs < ActiveRecord::Migration
  def change
    create_table :sharing_prefs do |t|
      t.references :card, index: true
      t.references :survey_response, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
