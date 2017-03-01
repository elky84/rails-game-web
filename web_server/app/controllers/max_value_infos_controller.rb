class MaxValueInfosController < ApplicationController
  before_action :set_max_value_info, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /max_value_infos
  # GET /max_value_infos.json
  def index
    if params[:search]
      @max_value_infos = MaxValueInfo.search(params[:search])
    else
      @max_value_infos = MaxValueInfo.limit(100)
    end
  end

  # GET /max_value_infos/1
  # GET /max_value_infos/1.json
  def show
  end

  # GET /max_value_infos/new
  def new
    @max_value_info = MaxValueInfo.new
  end

  # GET /max_value_infos/1/edit
  def edit
  end

  # POST /max_value_infos
  # POST /max_value_infos.json
  def create
    @max_value_info = create_or_update(:MAX_VALUE_ID)

    respond_to do |format|
      if @max_value_info.save
        format.html { redirect_to @max_value_info, notice: 'Max value info was successfully created.' }
        format.json { render :show, status: :created, location: @max_value_info }
      else
        format.html { render :new }
        format.json { render json: @max_value_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /max_value_infos/1
  # PATCH/PUT /max_value_infos/1.json
  def update
    respond_to do |format|
      if @max_value_info.update(max_value_info_params)
        format.html { redirect_to @max_value_info, notice: 'Max value info was successfully updated.' }
        format.json { render :show, status: :ok, location: @max_value_info }
      else
        format.html { render :edit }
        format.json { render json: @max_value_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /max_value_infos/1
  # DELETE /max_value_infos/1.json
  def destroy
    @max_value_info.destroy
    respond_to do |format|
      format.html { redirect_to max_value_infos_url, notice: 'Max value info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_max_value_info
      @max_value_info = MaxValueInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def max_value_info_params
      params.require(:max_value_info).permit(:MAX_VALUE_ID, :MAX_SLOT_TYPE, :EXT_SLOT, :NEXT_EXT_SLOT, :NEXT_COST)
    end
end
