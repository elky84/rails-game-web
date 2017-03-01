class GachaMachinesController < ApplicationController
  before_action :set_gacha_machine, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /gacha_machines
  # GET /gacha_machines.json
  def index
    if params[:search]
      @gacha_machines = GachaMachine.search(params[:search])
    else
      @gacha_machines = GachaMachine.limit(100)
    end
  end

  # GET /gacha_machines/1
  # GET /gacha_machines/1.json
  def show
  end

  # GET /gacha_machines/new
  def new
    @gacha_machine = GachaMachine.new
  end

  # GET /gacha_machines/1/edit
  def edit
  end

  # POST /gacha_machines
  # POST /gacha_machines.json
  def create
    @gacha_machine = create_or_update(:GACHA_MACHINE_ID)

    respond_to do |format|
      if @gacha_machine.save
        format.html { redirect_to @gacha_machine, notice: 'Gacha machine was successfully created.' }
        format.json { render :show, status: :created, location: @gacha_machine }
      else
        format.html { render :new }
        format.json { render json: @gacha_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gacha_machines/1
  # PATCH/PUT /gacha_machines/1.json
  def update
    respond_to do |format|
      if @gacha_machine.update(gacha_machine_params)
        format.html { redirect_to @gacha_machine, notice: 'Gacha machine was successfully updated.' }
        format.json { render :show, status: :ok, location: @gacha_machine }
      else
        format.html { render :edit }
        format.json { render json: @gacha_machine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gacha_machines/1
  # DELETE /gacha_machines/1.json
  def destroy
    @gacha_machine.destroy
    respond_to do |format|
      format.html { redirect_to gacha_machines_url, notice: 'Gacha machine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gacha_machine
      @gacha_machine = GachaMachine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gacha_machine_params
      params.require(:gacha_machine).permit(:GACHA_MACHINE_ID, :GACHA_MACHINE_TYPE)
    end
end
