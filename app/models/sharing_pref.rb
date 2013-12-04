class SharingPref < ActiveRecord::Base
  belongs_to :card
  belongs_to :survey_response
  belongs_to :recipient
end
