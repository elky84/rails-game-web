class NoticeInstancesController < ApplicationController
  before_action :set_notice_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /notice_instances
  # GET /notice_instances.json
  def index
    if params[:search]
      @notice_instances = NoticeInstance.search(params[:search])
    else
      @notice_instances = NoticeInstance.limit(100)
    end
  end

  # GET /notice_instances/1
  # GET /notice_instances/1.json
  def show
  end

  # GET /notice_instances/new
  def new
    @notice_instance = NoticeInstance.new
  end

  # GET /notice_instances/1/edit
  def edit
  end

  # POST /notice_instances
  # POST /notice_instances.json
  def create
    @notice_instance = create_or_update(:NOTICE_NO)

    respond_to do |format|
      if @notice_instance.save
        format.html { redirect_to @notice_instance, notice: 'Notice instance was successfully created.' }
        format.json { render :show, status: :created, location: @notice_instance }
      else
        format.html { render :new }
        format.json { render json: @notice_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notice_instances/1
  # PATCH/PUT /notice_instances/1.json
  def update
    respond_to do |format|
      if @notice_instance.update(notice_instance_params)
        format.html { redirect_to @notice_instance, notice: 'Notice instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @notice_instance }
      else
        format.html { render :edit }
        format.json { render json: @notice_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notice_instances/1
  # DELETE /notice_instances/1.json
  def destroy
    @notice_instance.destroy
    respond_to do |format|
      format.html { redirect_to notice_instances_url, notice: 'Notice instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice_instance
      @notice_instance = NoticeInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notice_instance_params
      params.require(:notice_instance).permit(:NOTICE_NO, :NOTICE_TYPE, :CONTENT, :START_DATE, :END_DATE)
    end
end
