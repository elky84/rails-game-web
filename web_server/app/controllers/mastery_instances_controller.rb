class MasteryInstancesController < ApplicationController
  before_action :set_mastery_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /mastery_instances
  # GET /mastery_instances.json
  def index
    if params[:search]
      @mastery_instances = MasteryInstance.search(params[:search])
    else
      @mastery_instances = MasteryInstance.limit(100)
    end
  end

  # GET /mastery_instances/1
  # GET /mastery_instances/1.json
  def show
  end

  # GET /mastery_instances/new
  def new
    @mastery_instance = MasteryInstance.new
  end

  # GET /mastery_instances/1/edit
  def edit
  end

  # POST /mastery_instances
  # POST /mastery_instances.json
  def create
    @mastery_instance = create_or_update(:GROUP_NO)

    respond_to do |format|
      if @mastery_instance.save
        format.html { redirect_to @mastery_instance, notice: 'Mastery instance was successfully created.' }
        format.json { render :show, status: :created, location: @mastery_instance }
      else
        format.html { render :new }
        format.json { render json: @mastery_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mastery_instances/1
  # PATCH/PUT /mastery_instances/1.json
  def update
    respond_to do |format|
      if @mastery_instance.update(mastery_instance_params)
        format.html { redirect_to @mastery_instance, notice: 'Mastery instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @mastery_instance }
      else
        format.html { render :edit }
        format.json { render json: @mastery_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mastery_instances/1
  # DELETE /mastery_instances/1.json
  def destroy
    @mastery_instance.destroy
    respond_to do |format|
      format.html { redirect_to mastery_instances_url, notice: 'Mastery instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastery_instance
      @mastery_instance = MasteryInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastery_instance_params
      params.require(:mastery_instance).permit(:MASTERY_NO, :GROUP_NO, :USER_NO, :CHARACTER_NO, :MASTERY)
    end
end
