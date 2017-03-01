class ScenarioScriptsController < ApplicationController
  before_action :set_scenario_script, only: [:show, :edit, :update, :destroy]

  # GET /scenario_scripts
  # GET /scenario_scripts.json
  def index
    @scenario_scripts = ScenarioScript.all
  end

  # GET /scenario_scripts/1
  # GET /scenario_scripts/1.json
  def show
  end

  # GET /scenario_scripts/new
  def new
    @scenario_script = ScenarioScript.new
  end

  # GET /scenario_scripts/1/edit
  def edit
  end

  # POST /scenario_scripts
  # POST /scenario_scripts.json
  def create
    @scenario_script = create_or_update(:INDEX)

    respond_to do |format|
      if @scenario_script.save
        format.html { redirect_to @scenario_script, notice: 'Scenario script was successfully created.' }
        format.json { render :show, status: :created, location: @scenario_script }
      else
        format.html { render :new }
        format.json { render json: @scenario_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scenario_scripts/1
  # PATCH/PUT /scenario_scripts/1.json
  def update
    respond_to do |format|
      if @scenario_script.update(scenario_script_params)
        format.html { redirect_to @scenario_script, notice: 'Scenario script was successfully updated.' }
        format.json { render :show, status: :ok, location: @scenario_script }
      else
        format.html { render :edit }
        format.json { render json: @scenario_script.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scenario_scripts/1
  # DELETE /scenario_scripts/1.json
  def destroy
    @scenario_script.destroy
    respond_to do |format|
      format.html { redirect_to scenario_scripts_url, notice: 'Scenario script was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scenario_script
      @scenario_script = ScenarioScript.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scenario_script_params
      params.require(:scenario_script).permit(:INDEX, :DIALOGUE_TYPE, :DIALOGUE_EFFECT, :SPEECH_BACK, :CHARACTER_FACE, :FACE_POS, :CHARACOTR_INDEX, :STRING_INDEX)
    end
end
