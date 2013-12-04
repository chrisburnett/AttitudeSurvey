class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :survey_response
end
