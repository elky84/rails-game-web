class QuestSchedulesController < ApplicationController
  before_action :set_quest_schedule, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /quest_schedules
  # GET /quest_schedules.json
  def index
    if params[:search]
      @quest_schedules = QuestSchedule.search(params[:search])
    else
      @quest_schedules = QuestSchedule.limit(100)
    end
  end

  # GET /quest_schedules/1
  # GET /quest_schedules/1.json
  def show
  end

  # GET /quest_schedules/new
  def new
    @quest_schedule = QuestSchedule.new
  end

  # GET /quest_schedules/1/edit
  def edit
  end

  # POST /quest_schedules
  # POST /quest_schedules.json
  def create
    @quest_schedule = create_or_update(:QUEST_SCHEDULE_ID)

    respond_to do |format|
      if @quest_schedule.save
        format.html { redirect_to @quest_schedule, notice: 'Quest schedule was successfully created.' }
        format.json { render :show, status: :created, location: @quest_schedule }
      else
        format.html { render :new }
        format.json { render json: @quest_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_schedules/1
  # PATCH/PUT /quest_schedules/1.json
  def update
    respond_to do |format|
      if @quest_schedule.update(quest_schedule_params)
        format.html { redirect_to @quest_schedule, notice: 'Quest schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_schedule }
      else
        format.html { render :edit }
        format.json { render json: @quest_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_schedules/1
  # DELETE /quest_schedules/1.json
  def destroy
    @quest_schedule.destroy
    respond_to do |format|
      format.html { redirect_to quest_schedules_url, notice: 'Quest schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_schedule
      @quest_schedule = QuestSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_schedule_params
      params.require(:quest_schedule).permit(:QUEST_SCHEDULE_ID, :QUEST_SCHEDULE_TYPE, :ODD_OR_EVEN, :START, :END, :EXPLAIN)
    end
end
