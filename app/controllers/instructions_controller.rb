class InstructionsController < ApplicationController
  def index
    # if we have been passed an ID to use from an external source,
    # then store it in the session - we'll generate one otherwise

    if params[:subsid] then
      session[:subsid] = params[:subsid]
      
      # check now to see if this is an external referrer request and our quota remaining
      survey_run = SurveyRun.find_by(active: true)
      if survey_run.survey_responses.length >= AttitudeSurvey::Application.config.referrer_quota then
        redirect_to AttitudeSurvey::Application.config.referrer_quotafull_link + params[:subsid]
      end
    end
  end
end
