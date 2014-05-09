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

  def self.active_survey
    # get currently active survey run and its survey
    SurveyRun.active_survey_run.survey
  end

  # return the % of the time this card was assigned to this category in all runs
  def proportion_card_assigned_to_category(card, category)
    
    # get the number of responses to all runs of this survey
    response_count = 0
    survey_runs.each do |run|
      # only count responses which have an answer for this card
      run.survey_responses.each do |response|
        if (response.card_placements.find_by card_id: card.id) != nil
          response_count += 1
        end
      end
    end    
    
    # get the number of responses which assigned this card to this category
    card_to_cat_count = 0
    survey_runs.each do |run| 
      card_to_cat_count += run.survey_responses
        .joins(:card_placements)
        .where(card_placements: 
               {card_id: card.id, sensitivity_category_id: category.id}).length
    end
    (card_to_cat_count.to_f / response_count.to_f).round(2)
  end


  # return the proportion of responses, in all runs of this survey,
  # who said they would share this card with this recipient
  def proportion_would_share(card, recipient)
    responses_count = 0
    would_share_count = 0
    survey_runs.each do |run| 
      # only count responses which have an answer for this card/recipient
      run.survey_responses.each do |response|
        r = response.sharing_prefs.find_by card_id: card.id, recipient_id: recipient.id
        if r != nil then 
          responses_count += 1
          if r.share == true then would_share_count += 1 end
        end
      end
    end
    (would_share_count.to_f / responses_count.to_f).round(2)
  end

end
