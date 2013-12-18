class SurveyRun < ActiveRecord::Base

  belongs_to :survey
  has_many :survey_responses, dependent: :destroy

  
  # return the % of the time this card was assigned to this category
  def proportion_card_assigned_to_category(card, category)
    card_count = survey.cards.length
    response_count = survey_responses.length
    
    # get the number of responses which assigned this card to this category
    card_to_cat_count = 
      survey_responses
      .joins(:card_placements)
      .where(card_placements: 
             {card_id: card.id, sensitivity_category_id: category.id}).length
    
    card_to_cat_count.to_f / response_count.to_f
  end

end
