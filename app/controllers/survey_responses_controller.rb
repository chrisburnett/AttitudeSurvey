class SurveyResponsesController < ApplicationController

  def new
    @survey = active_survey
    @survey_response = active_survey_run.survey_responses.build
    # add the card placements
    @survey.cards.each do |card|
      @survey_response.card_placements.build(card_id: card.id)
    end
    # create questionnaire response
    @questionnaire_response = @survey_response.build_questionnaire_response
    # send the recipient cards to javascript so we can page through them without refreshing
    gon.recipients = @survey.recipients
  end

  def create
    @survey_run = active_survey_run
    @survey_response = @survey_run.survey_responses.create(survey_response_params)
    #@survey_response.save

    # respond with the survey_response ID so subsequent AJAX calls can append
    respond_to do |format|
      format.json { render json: @survey_response }
    end
  end

  def edit
    @survey_response = SurveyResponse.find(params[:id])
  end

  def update
    @survey = active_survey
    @survey_response = SurveyResponse.find(params[:id])
    @survey_response.update(survey_response_params)

    # if finished param set, go to final page
    respond_to do |format|
      format.json { render json: @survey_response, include: [:card_placements, :sharing_prefs] }
    end
  end


  def show
    @survey_response = SurveyResponse.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @survey_response, include: [:card_placements, :sharing_prefs] }
    end
  end


  private
  def survey_response_params
    params.require(:survey_response).permit(:id, :rnid, :back, :current_phase, card_placements_attributes: [:id, :card_id, :sensitivity_category_id], sharing_prefs_attributes: [:id, :recipient_id, :card_id, :share])
  end

  # def next_phase(current_phase)
  #    SurveyResponse.phases[SurveyResponse.phases.index(current_phase) + 1]
  # end

  # def previous_phase(current_phase)
  #   SurveyResponse.phases[SurveyResponse.phases.index(current_phase) - 1]
  # end

  #def advance_or_finish
    # if params[:back]
    #   session[:current_phase] = previous_phase(session[:current_phase])
    # elsif session[:current_phase] == SurveyResponse.phases.last
    #   session[:current_phase] = nil
    # else
    #   session[:current_phase] = next_phase(session[:current_phase])
    # end

    # if not session[:current_phase]
    #   redirect_to @survey_response
    # else

  #end

  def active_survey_run
    SurveyRun.find_by(active: true)
  end


  def active_survey
    # get currently active survey run and its survey
    active_survey_run.survey
  end

end
