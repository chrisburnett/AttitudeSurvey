class Survey < ActiveRecord::Base

  has_many :cards, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :recipients, dependent: :destroy
  has_many :sensitivity_categories, dependent: :destroy
  has_many :survey_runs, dependent: :destroy

  accepts_nested_attributes_for :cards, allow_destroy: true
  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :recipients, allow_destroy: true
  accepts_nested_attributes_for :sensitivity_categories, allow_destroy: true

end
