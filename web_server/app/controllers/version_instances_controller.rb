class VersionInstancesController < ApplicationController
  before_action :set_version_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /version_instances
  # GET /version_instances.json
  def index
    if params[:search]
      @version_instances = VersionInstance.search(params[:search])
    else
      @version_instances = VersionInstance.limit(100)
    end
  end

  # GET /version_instances/1
  # GET /version_instances/1.json
  def show
  end

  # GET /version_instances/new
  def new
    @version_instance = VersionInstance.new
  end

  # GET /version_instances/1/edit
  def edit
  end

  # POST /version_instances
  # POST /version_instances.json
  def create
    @version_instance = create_or_update(:VALUE)

    respond_to do |format|
      if @version_instance.save
        format.html { redirect_to @version_instance, notice: 'Version instance was successfully created.' }
        format.json { render :show, status: :created, location: @version_instance }
      else
        format.html { render :new }
        format.json { render json: @version_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /version_instances/1
  # PATCH/PUT /version_instances/1.json
  def update
    respond_to do |format|
      if @version_instance.update(version_instance_params)
        format.html { redirect_to @version_instance, notice: 'Version instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @version_instance }
      else
        format.html { render :edit }
        format.json { render json: @version_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /version_instances/1
  # DELETE /version_instances/1.json
  def destroy
    @version_instance.destroy
    respond_to do |format|
      format.html { redirect_to version_instances_url, notice: 'Version instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_version_instance
      @version_instance = VersionInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_instance_params
      params.require(:version_instance).permit(:VALUE, :EXPLAIN)
    end
end
