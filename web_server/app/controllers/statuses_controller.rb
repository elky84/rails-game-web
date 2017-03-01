class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /statuses
  # GET /statuses.json
  def index
    if params[:search]
      @statuses = Status.search(params[:search])
    else
      @statuses = Status.limit(100)
    end
  end

  # GET /statuses/1
  # GET /statuses/1.json
  def show
  end

  # GET /statuses/new
  def new
    @status = Status.new
  end

  # GET /statuses/1/edit
  def edit
  end

  # POST /statuses
  # POST /statuses.json
  def create
    @status = create_or_update(:STATUS_ID)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render :show, status: :created, location: @status }
      else
        format.html { render :new }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /statuses/1
  # PATCH/PUT /statuses/1.json
  def update
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @status }
      else
        format.html { render :edit }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /statuses/1
  # DELETE /statuses/1.json
  def destroy
    @status.destroy
    respond_to do |format|
      format.html { redirect_to statuses_url, notice: 'Status was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status
      @status = Status.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_params
      params.require(:status).permit(:STATUS_ID, :ATTACK, :DEFENSE, :HP, :MP, :RAGE_BASE, :ATTACK_SPEED, :MOVE_SPEED_X, :MOVE_SPEED_Z, :CRITICAL_RATE, :CRITICAL_AVOID, :CRITICAL_DAMAGE, :HIT_RATE, :DODGE_RATE, :HP_REGEN, :MP_REGEN, :RAGE_REGEN, :COOL_TIME_ALL, :RESIST_POISON, :RESIST_SILENCE, :RESIST_STUN, :RESIST_SLOW, :LEVEL)
    end
end
