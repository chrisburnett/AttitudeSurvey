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
    # set start time
    @survey_response.start_time = Time.now
    # send the recipient cards to javascript so we can page through them without refreshing
    gon.recipients = @survey.recipients
  end

  def create
    @survey_run = active_survey_run
    @survey_response = @survey_run.survey_responses.build(survey_response_params)
    # if we have an externally provided ID in the session, set it
    @survey_response.rnid = session[:subsid]
    @survey_response.save
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

    # we know the survey is completed once a questionnaire response object is provided, so
    # use this to set the finishing time step
    if params[:commit]
      @survey_response.finish_time = Time.now
      @survey_response.save
    end

    respond_to do |format|
      format.json { render json: @survey_response, include: [:card_placements, :sharing_prefs] }
    end
  end


  def show
    @survey_response = SurveyResponse.find(params[:id])
    @questionnaire_response = @survey_response.questionnaire_response

    respond_to do |format|
      format.html
      format.json { render json: @survey_response, include: [:card_placements, :sharing_prefs] }
    end
  end

  # def index
  #   @survey = active_survey
  #   @survey_run = active_survey_run
  #   @survey_responses = @survey_run.survey_responses
  # end

  def destroy
    @survey_response = SurveyResponse.find(params[:id])
    @survey_response.destroy

    respond_to do |format|
      format.json { render json: @survey_response }
    end
  end

  private
  def survey_response_params
    params.require(:survey_response).permit(:id, :rnid, :back, :current_phase, :commit, :start_time, card_placements_attributes: [:id, :card_id, :sensitivity_category_id], sharing_prefs_attributes: [:id, :recipient_id, :card_id, :share], questionnaire_response_attributes: [:id, :gender, :employment_status, :age_range, :open_feedback, :app_user, :worked_in_healthcare, :worked_in_healthcare_occupation])
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
