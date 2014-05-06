# this class is similar to the survey response controller, in that it
# creates a survey response, but it doesn't follow the full pathway of
# the whole survey (consent, all cards, all recipients) but rather
# shows a random card or recipient and asks to
class RapidfireController < ApplicationController

  # display the new page
  def new
    @survey = Survey.active_survey
    @survey_response = SurveyRun.active_survey_run.survey_responses.build
    #horribly inefficient, but we know we will not have a big number
    #of cards or accesses
    @card = Card.all.sample
    # create a placement object for the card we got
    @survey_response.card_placements.build(card_id: @card.id)
  end

  # save the response and display the shiny result page
  def create
  end

  # no need for edit/update/delete - each rapidfire response will be
  # saved as a new surveyresponse - very simple loop

end
