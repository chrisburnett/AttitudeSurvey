class MultiChoiceQuestion < ActiveRecord::Base
  belongs_to :question
  has_many :choices
end
