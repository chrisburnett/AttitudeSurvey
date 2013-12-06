class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate

  protect_from_forgery except: :create

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    @survey_runs = SurveyRun.all
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = Survey.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @survey.to_json(include: [:cards, :recipients, :sensitivity_categories]) }
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    #@survey.cards.build
    #@survey.sensitivity_categories.build
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey_run = @survey.survey_runs.build
    if SurveyRun.count == 0
    then @survey_run.active = true
    end

    respond_to do |format|
      if @survey.save
        format.html { redirect_to surveys_url, notice: 'Survey was successfully created.' }
        format.json { render action: 'show', status: :created, location: @survey }
      else
        format.html { render action: 'new' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to surveys_url, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to surveys_url }
      format.json { head :no_content }
    end
  end

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |u,p|
      u=='cburnett' and p=='trumpadmin'

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title, :description, cards_attributes: [:id, :title, :description, :_destroy], sensitivity_categories_attributes: [:id, :title, :description, :_destroy], recipients_attributes: [:id, :role, :description, :_destroy])
    end
end
