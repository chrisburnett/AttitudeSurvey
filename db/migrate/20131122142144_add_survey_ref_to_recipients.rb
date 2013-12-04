class AddSurveyRefToRecipients < ActiveRecord::Migration
  def change
    add_reference :recipients, :survey, index: true
  end
end
