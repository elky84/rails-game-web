class DaycheckScriptsController < ApplicationController
  before_action :set_daycheck_script, only: [:show, :edit, :update, :destroy]

  # GET /daycheck_scripts
  # GET /daycheck_scripts.json
  def index
    @daycheck_scripts = DaycheckScript.all
  end

  # GET /daycheck_scripts/1
  # GET /daycheck_scripts/1.json
  def show
  end

  # GET /daycheck_scripts/new
  def new
    @daycheck_script = DaycheckScript.new
  end

  # GET /daycheck_scripts/1/edit
  def edit
  end

  # POST /daycheck_scripts
  # POST /daycheck_scripts.json
  def create
    @daycheck_script = create_or_update(:DAYCHECK_ID)

    respond_to do |format|
      if @daycheck_script.save
        format.html { redirect_to @daycheck_script, notice: 'Daycheck script was successfully created.' }
        format.json { render :show, status: :created, location: @daycheck_script }
      else
        format.html { render :new }
        format.json { render json: @daycheck_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daycheck_scripts/1
  # PATCH/PUT /daycheck_scripts/1.json
  def update
    respond_to do |format|
      if @daycheck_script.update(daycheck_script_params)
        format.html { redirect_to @daycheck_script, notice: 'Daycheck script was successfully updated.' }
        format.json { render :show, status: :ok, location: @daycheck_script }
      else
        format.html { render :edit }
        format.json { render json: @daycheck_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daycheck_scripts/1
  # DELETE /daycheck_scripts/1.json
  def destroy
    @daycheck_script.destroy
    respond_to do |format|
      format.html { redirect_to daycheck_scripts_url, notice: 'Daycheck script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daycheck_script
      @daycheck_script = DaycheckScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def daycheck_script_params
      params.require(:daycheck_script).permit(:DAYCHECK_ID, :USER_TYPE, :DAY, :REWARD, :UI_LABEL, :ICON)
    end
end
