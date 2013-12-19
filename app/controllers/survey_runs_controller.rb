class SurveyRunsController < ApplicationController

  def create
    @survey = Survey.find(params[:survey_id])
    @survey.survey_runs.create(active: false)
    redirect_to surveys_path
  end

  def index
    @survey = SurveyRun.find_by(active: true)
    respond_with @survey
  end

  def update
    # we only ever toggle active status or delete runs, so deactivate all
    current_runs = SurveyRun.where(active: true)
    current_runs.each do |r| r.update(active: false) end
    @survey_run = SurveyRun.find(params[:id])
    respond_to do |format|
      if @survey_run.update(survey_run_params)
        format.html { redirect_to surveys_url, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey_run.errors, status: :unprocessable_entity }
      end
    end
    # need to check only one active survey at a time

  end

  def destroy
    @run = SurveyRun.find(params[:id])
    @run.destroy
    redirect_to surveys_path
  end

  def show
    @survey = Survey.find(params[:survey_id])
    @survey_run = SurveyRun.find(params[:id])
    @survey_responses = @survey_run.survey_responses
  end

  private
  def survey_run_params
    params.permit(:active)
  end

end
