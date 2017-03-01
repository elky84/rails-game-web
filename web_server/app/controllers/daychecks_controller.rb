class DaychecksController < ApplicationController
  before_action :set_daycheck, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /daychecks
  # GET /daychecks.json
  def index
    if params[:search]
      @daychecks = Daycheck.search(params[:search])
    else
      @daychecks = Daycheck.limit(100)
    end
  end

  # GET /daychecks/1
  # GET /daychecks/1.json
  def show
  end

  # GET /daychecks/new
  def new
    @daycheck = Daycheck.new
  end

  # GET /daychecks/1/edit
  def edit
  end

  # POST /daychecks
  # POST /daychecks.json
  def create
    @daycheck = create_or_update(:DAYCHECK_ID)

    respond_to do |format|
      if @daycheck.save
        format.html { redirect_to @daycheck, notice: 'Daycheck was successfully created.' }
        format.json { render :show, status: :created, location: @daycheck }
      else
        format.html { render :new }
        format.json { render json: @daycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daychecks/1
  # PATCH/PUT /daychecks/1.json
  def update
    respond_to do |format|
      if @daycheck.update(daycheck_params)
        format.html { redirect_to @daycheck, notice: 'Daycheck was successfully updated.' }
        format.json { render :show, status: :ok, location: @daycheck }
      else
        format.html { render :edit }
        format.json { render json: @daycheck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daychecks/1
  # DELETE /daychecks/1.json
  def destroy
    @daycheck.destroy
    respond_to do |format|
      format.html { redirect_to daychecks_url, notice: 'Daycheck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daycheck
      @daycheck = Daycheck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daycheck_params
      params.require(:daycheck).permit(:DAYCHECK_ID, :USER_TYPE, :DAY, :REWARD, :UI_LABEL, :ICON)
    end
end
