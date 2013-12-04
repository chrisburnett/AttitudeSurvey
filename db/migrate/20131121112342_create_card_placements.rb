class CreateCardPlacements < ActiveRecord::Migration
  def change
    create_table :card_placements do |t|
      t.references :card, index: true
      t.references :survey_response, index: true
      t.references :sensitivity_category, index: true
      t.timestamps
    end
  end
end
