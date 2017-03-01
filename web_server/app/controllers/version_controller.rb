class VersionController < ApplicationController
  def get
  	@version_instance = VersionInstance.where(:VALUE => params[:version]).first
  	if @version_instance == nil
      return invalid_version("invalid version. " + params[:version].to_s, 120002)
    end
    
	 respond_to do |format|
      format.html 
      format.json { render json: @version_instance }
    end
  end
end
