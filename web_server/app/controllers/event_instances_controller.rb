class EventInstancesController < ApplicationController
  before_action :set_event_instance, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /event_instances
  # GET /event_instances.json
  def index
    if params[:search]
      @event_instances = EventInstance.search(params[:search])
    else
      @event_instances = EventInstance.limit(100)
    end
  end

  # GET /event_instances/1
  # GET /event_instances/1.json
  def show
  end

  # GET /event_instances/new
  def new
    @event_instance = EventInstance.new
  end

  # GET /event_instances/1/edit
  def edit
  end

  # POST /event_instances
  # POST /event_instances.json
  def create
    @event_instance = create_or_update(:EVENT_NO)

    respond_to do |format|
      if @event_instance.save
        format.html { redirect_to @event_instance, notice: 'Event instance was successfully created.' }
        format.json { render :show, status: :created, location: @event_instance }
      else
        format.html { render :new }
        format.json { render json: @event_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_instances/1
  # PATCH/PUT /event_instances/1.json
  def update
    respond_to do |format|
      if @event_instance.update(event_instance_params)
        format.html { redirect_to @event_instance, notice: 'Event instance was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_instance }
      else
        format.html { render :edit }
        format.json { render json: @event_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_instances/1
  # DELETE /event_instances/1.json
  def destroy
    @event_instance.destroy
    respond_to do |format|
      format.html { redirect_to event_instances_url, notice: 'Event instance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_instance
      @event_instance = EventInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_instance_params
      params.require(:event_instance).permit(:EVENT_NO, :EVENT_TYPE, :REWARD, :START_DATE, :END_DATE)
    end
end
