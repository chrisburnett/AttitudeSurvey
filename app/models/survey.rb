class Survey < ActiveRecord::Base

  has_many :cards, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :recipients, dependent: :destroy
  has_many :sensitivity_categories, dependent: :destroy
  has_many :survey_runs, dependent: :destroy

  accepts_nested_attributes_for :cards, allow_destroy: true
  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :recipients, allow_destroy: true
  accepts_nested_attributes_for :sensitivity_categories, allow_destroy: true

  # Return a duplicate of this survey with the same cards, categories and recipients, but none of the responses or runs
  def duplicate_survey
    survey = self.dup
    survey.title = survey.title + " copy"
    cards.each do |card| 
      survey.cards << card.dup
    end

    recipients.each do |recipient| 
      survey.recipients << recipient.dup
    end
    
    sensitivity_categories.each do |sc| 
      survey.sensitivity_categories << sc.dup
    end
    return survey
  end
end
