class DaycheckInstancesController < ApplicationController
  before_action :set_daycheck_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /daycheck_instances
  # GET /daycheck_instances.json
  def index
    if params[:search]
      @daycheck_instances = DaycheckInstance.search(params[:search])
    else
      @daycheck_instances = DaycheckInstance.limit(100)
    end
  end

  # GET /daycheck_instances/1
  # GET /daycheck_instances/1.json
  def show
  end

  # GET /daycheck_instances/new
  def new
    @daycheck_instance = DaycheckInstance.new
  end

  # GET /daycheck_instances/1/edit
  def edit
  end

  # POST /daycheck_instances
  # POST /daycheck_instances.json
  def create
    @daycheck_instance = create_or_update(:DAYCHECK_ID)

    respond_to do |format|
      if @daycheck_instance.save
        format.html { redirect_to @daycheck_instance, notice: 'Daycheck instance was successfully created.' }
        format.json { render :show, status: :created, location: @daycheck_instance }
      else
        format.html { render :new }
        format.json { render json: @daycheck_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daycheck_instances/1
  # PATCH/PUT /daycheck_instances/1.json
  def update
    respond_to do |format|
      if @daycheck_instance.update(daycheck_instance_params)
        format.html { redirect_to @daycheck_instance, notice: 'Daycheck instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @daycheck_instance }
      else
        format.html { render :edit }
        format.json { render json: @daycheck_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daycheck_instances/1
  # DELETE /daycheck_instances/1.json
  def destroy
    @daycheck_instance.destroy
    respond_to do |format|
      format.html { redirect_to daycheck_instances_url, notice: 'Daycheck instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daycheck_instance
      @daycheck_instance = DaycheckInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daycheck_instance_params
      params.require(:daycheck_instance).permit(:DAYCHECK_NO, :USER_NO, :USER_TYPE, :DAYCHECK_ID, :TIME, :CHECK)
    end
end
