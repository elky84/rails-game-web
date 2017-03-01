class MailInstancesController < ApplicationController
  before_action :set_mail_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /mail_instances
  # GET /mail_instances.json
  def index
    if params[:search]
      @mail_instances = MailInstance.search(params[:search])
    else
      @mail_instances = MailInstance.limit(100)
    end
  end

  # GET /mail_instances/1
  # GET /mail_instances/1.json
  def show
  end

  # GET /mail_instances/new
  def new
    @mail_instance = MailInstance.new
  end

  # GET /mail_instances/1/edit
  def edit
  end

  # POST /mail_instances
  # POST /mail_instances.json
  def create
    @mail_instance = create_or_update(:MAIL_NO)

    respond_to do |format|
      if @mail_instance.save
        format.html { redirect_to @mail_instance, notice: 'Mail instance was successfully created.' }
        format.json { render :show, status: :created, location: @mail_instance }
      else
        format.html { render :new }
        format.json { render json: @mail_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_instances/1
  # PATCH/PUT /mail_instances/1.json
  def update
    respond_to do |format|
      if @mail_instance.update(mail_instance_params)
        format.html { redirect_to @mail_instance, notice: 'Mail instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @mail_instance }
      else
        format.html { render :edit }
        format.json { render json: @mail_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_instances/1
  # DELETE /mail_instances/1.json
  def destroy
    @mail_instance.destroy
    respond_to do |format|
      format.html { redirect_to mail_instances_url, notice: 'Mail instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_instance
      @mail_instance = MailInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_instance_params
      params.require(:mail_instance).permit(:MAIL_NO, :USER_NO, :TITLE, :CONTENT, :SENDER, :SENDER_ACTOR_ID, :SENDER_USER_NO, :OPENED, :REWARD, :END_DATE, :MAIL_TYPE)
    end
end
