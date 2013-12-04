class Question < ActiveRecord::Base

  has_one :text_question
  has_one :slider_question
  has_one :multi_choice_question



end


class QuestionValidator < ActiveModel::Validator

  # A question can only be of one 'kind'.
  def validate(question)
    if (%w(question.text_question question.slider_question question.multi_choice_question).find_all { |i| i.blank? }) != 1
      question.errors[:error] << 'Invalid question'
    end
  end

end
