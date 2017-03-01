class ServerListController < ApplicationController
  def get
    @remote_ip = request.remote_ip.encode('utf-8')
    if "106.251.53.134" != @remote_ip && "211.192.197.103" != @remote_ip
      @server_lists = ServerList.where("#{column_name("NAME")} NOT LIKE 'HIDDEN_%'")
    else
      @server_lists = ServerList.all
    end
    
    respond_to do |format|
      format.html 
      format.json { render json: @server_lists }
    end
  end
  
  def update
    @server = ServerList.where(:NAME => params[:name])
    if @server == nil
      return error("not find server info. " + params[:name])
    end
    
    @server.RU = params[:ru]
    @server.CU = params[:cu]
    
    @server.save
    
    respond_to do |format|
      format.html 
      format.json { render json: @server }
    end
  end
end
