class InstructionsController < ApplicationController
  def index
    # if we have been passed an ID to use from an external source,
    # then store it in the session - we'll generate one otherwise

    if params[:subsid] then
      session[:subsid] = params[:subsid]
    end
  end
    
end
