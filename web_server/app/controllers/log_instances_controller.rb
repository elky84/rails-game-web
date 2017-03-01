class LogInstancesController < ApplicationController
  before_action :set_log_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /log_instances
  # GET /log_instances.json
  def index
    if params[:search]
      @log_instances = LogInstance.search(params[:search])
    else
      @log_instances = LogInstance.limit(100)
    end
  end

  # GET /log_instances/1
  # GET /log_instances/1.json
  def show
  end

  # GET /log_instances/new
  def new
    @log_instance = LogInstance.new
  end

  # GET /log_instances/1/edit
  def edit
  end

  # POST /log_instances
  # POST /log_instances.json
  def create
    @log_instance = create_or_update(:LOG_NO)

    respond_to do |format|
      if @log_instance.save
        format.html { redirect_to @log_instance, notice: 'Log instance was successfully created.' }
        format.json { render :show, status: :created, location: @log_instance }
      else
        format.html { render :new }
        format.json { render json: @log_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /log_instances/1
  # PATCH/PUT /log_instances/1.json
  def update
    respond_to do |format|
      if @log_instance.update(log_instance_params)
        format.html { redirect_to @log_instance, notice: 'Log instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @log_instance }
      else
        format.html { render :edit }
        format.json { render json: @log_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /log_instances/1
  # DELETE /log_instances/1.json
  def destroy
    @log_instance.destroy
    respond_to do |format|
      format.html { redirect_to log_instances_url, notice: 'Log instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_instance
      @log_instance = LogInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_instance_params
      params.require(:log_instance).permit(:LOG_NO, :USER_NO, :CHARACTER_NO, :LOG_TYPE, :VALUE, :CASH, :MONEY, :USER_LV, :EXP, :ACTION_TIME, :IP)
    end
end
