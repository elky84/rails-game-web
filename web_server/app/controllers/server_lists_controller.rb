class ServerListsController < ApplicationController
  before_action :set_server_list, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /server_lists
  # GET /server_lists.json
  def index
    if params[:search]
      @server_lists = ServerList.search(params[:search])
    else
      @server_lists = ServerList.limit(100)
    end
  end

  # GET /server_lists/1
  # GET /server_lists/1.json
  def show
  end

  # GET /server_lists/new
  def new
    @server_list = ServerList.new
  end

  # GET /server_lists/1/edit
  def edit
  end

  # POST /server_lists
  # POST /server_lists.json
  def create
    @server_list = create_or_update(:INDEX)

    respond_to do |format|
      if @server_list.save
        format.html { redirect_to @server_list, notice: 'Server list was successfully created.' }
        format.json { render :show, status: :created, location: @server_list }
      else
        format.html { render :new }
        format.json { render json: @server_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /server_lists/1
  # PATCH/PUT /server_lists/1.json
  def update
    respond_to do |format|
      if @server_list.update(server_list_params)
        format.html { redirect_to @server_list, notice: 'Server list was successfully updated.' }
        format.json { render :show, status: :ok, location: @server_list }
      else
        format.html { render :edit }
        format.json { render json: @server_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /server_lists/1
  # DELETE /server_lists/1.json
  def destroy
    @server_list.destroy
    respond_to do |format|
      format.html { redirect_to server_lists_url, notice: 'Server list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_server_list
      @server_list = ServerList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def server_list_params
      params.require(:server_list).permit(:INDEX, :SERVER_TYPE, :ADDRESS, :NAME, :CU, :RU)
    end
end
