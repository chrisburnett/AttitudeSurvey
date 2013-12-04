class CardPlacement < ActiveRecord::Base
  belongs_to :card
  belongs_to :sensitivity_category
  belongs_to :survey_response
end
