class AuthInstancesController < ApplicationController
  before_action :set_auth_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /auth_instances
  # GET /auth_instances.json
  def index
    if params[:search]
      @auth_instances = AuthInstance.search(params[:search])
    else
      @auth_instances = AuthInstance.limit(100)
    end
  end

  # GET /auth_instances/1
  # GET /auth_instances/1.json
  def show
  end

  # GET /auth_instances/new
  def new
    @auth_instance = AuthInstance.new
  end

  # GET /auth_instances/1/edit
  def edit
  end

  # POST /auth_instances
  # POST /auth_instances.json
  def create
    @auth_instance = create_or_update(:USER_NO)

    respond_to do |format|
      if @auth_instance.save
        format.html { redirect_to @auth_instance, notice: 'Auth instance was successfully created.' }
        format.json { render :show, status: :created, location: @auth_instance }
      else
        format.html { render :new }
        format.json { render json: @auth_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auth_instances/1
  # PATCH/PUT /auth_instances/1.json
  def update
    respond_to do |format|
      if @auth_instance.update(auth_instance_params)
        format.html { redirect_to @auth_instance, notice: 'Auth instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @auth_instance }
      else
        format.html { render :edit }
        format.json { render json: @auth_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auth_instances/1
  # DELETE /auth_instances/1.json
  def destroy
    @auth_instance.destroy
    respond_to do |format|
      format.html { redirect_to auth_instances_url, notice: 'Auth instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auth_instance
      @auth_instance = AuthInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auth_instance_params
      params.require(:auth_instance).permit(:USER_NO, :PRIVATE_KEY, :IP, :AUTH_KEY)
    end
end
