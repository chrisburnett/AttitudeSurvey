class SharingPrefsController < ApplicationController
  def new
    puts "GARGE"
  end

  def create
    #@sharing_pref = SharingPref.new()
    @sharing_pref = SharingPref.new(params[:sharingPrefs])
    respond_to do |format|
      format.json { render nothing: true }
    end
  end

end
