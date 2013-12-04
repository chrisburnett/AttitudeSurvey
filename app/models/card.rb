class Card < ActiveRecord::Base
  belongs_to :survey
  has_many :card_placements, dependent: :destroy
end
