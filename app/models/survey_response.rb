class SurveyResponse < ActiveRecord::Base

  # this is a non-persistent variable that keeps track of the 'phase' the user is at
  # in filling out the survey - the controller uses this to determine which view to show,
  # and ultimately when to save the record
  attr_accessor :current_phase

  belongs_to :survey_run, counter_cache: :count_of_survey_responses
  has_many :answers
  has_many :card_placements
  has_many :sharing_prefs

  # 'hard coded' for now, so no corresponding template questionnaire model. Could be added layer
  has_one :questionnaire_response

  accepts_nested_attributes_for :card_placements
  accepts_nested_attributes_for :sharing_prefs
  accepts_nested_attributes_for :questionnaire_response

  def self.phases
    %w[categories]
  end


end
