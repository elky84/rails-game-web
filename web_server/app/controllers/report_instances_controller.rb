class ReportInstancesController < ApplicationController
  before_action :set_report_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /report_instances
  # GET /report_instances.json
  def index
    if params[:search]
      @report_instances = ReportInstance.search(params[:search])
    else
      @report_instances = ReportInstance.limit(100)
    end
  end

  # GET /report_instances/1
  # GET /report_instances/1.json
  def show
  end

  # GET /report_instances/new
  def new
    @report_instance = ReportInstance.new
  end

  # GET /report_instances/1/edit
  def edit
  end

  # POST /report_instances
  # POST /report_instances.json
  def create
    @report_instance = create_or_update(:REPORT_NO)

    respond_to do |format|
      if @report_instance.save
        format.html { redirect_to @report_instance, notice: 'Report instance was successfully created.' }
        format.json { render :show, status: :created, location: @report_instance }
      else
        format.html { render :new }
        format.json { render json: @report_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_instances/1
  # PATCH/PUT /report_instances/1.json
  def update
    respond_to do |format|
      if @report_instance.update(report_instance_params)
        format.html { redirect_to @report_instance, notice: 'Report instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_instance }
      else
        format.html { render :edit }
        format.json { render json: @report_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_instances/1
  # DELETE /report_instances/1.json
  def destroy
    @report_instance.destroy
    respond_to do |format|
      format.html { redirect_to report_instances_url, notice: 'Report instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_instance
      @report_instance = ReportInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_instance_params
      params.require(:report_instance).permit(:REPORT_NO, :USER_NO, :CHARACTER_NO, :REPORT_TYPE, :VALUE, :USER_LV, :EXP, :ACTION_TIME, :IP)
    end
end
