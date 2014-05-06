#!/bin/ruby 
require 'csv'
require 'pp'
active_survey_run = SurveyRun.active_survey_run
survey = active_survey_run.survey

# write out the percentage of responses who would share with each recipient
# for each data type

CSV.open("sharing_pref_summary.csv", "wb") do |csv|
  header = ["recipient"]
  responses = active_survey_run.survey_responses
  cards = survey.cards
  cards.each do |card| header << card.title end
  survey.recipients.each do |recipient| 
    row = []
    row << recipient.role
    cards.each do |card|
      card_sharing_count = 0
      # for each response, check the sharing preference for this card
      responses.each do |resp|
        if resp.sharing_prefs.size > 0 then card_sharing_count += 1 end
        
        #if resp.sharing_prefs.where(card: card).first.share
         # card_sharing_count += 1
        #end
      end
      puts card_sharing_count
      percent = (card_sharing_count / responses.size) * 100
      row << percent
    end
    csv << row
  end
end
