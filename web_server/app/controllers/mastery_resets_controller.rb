class MasteryResetsController < ApplicationController
  before_action :set_mastery_reset, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /mastery_resets
  # GET /mastery_resets.json
  def index
    if params[:search]
      @mastery_resets = MasteryReset.search(params[:search])
    else
      @mastery_resets = MasteryReset.limit(100)
    end
  end

  # GET /mastery_resets/1
  # GET /mastery_resets/1.json
  def show
  end

  # GET /mastery_resets/new
  def new
    @mastery_reset = MasteryReset.new
  end

  # GET /mastery_resets/1/edit
  def edit
  end

  # POST /mastery_resets
  # POST /mastery_resets.json
  def create
    @mastery_reset = create_or_update(:MASTERY_RESET_ID)

    respond_to do |format|
      if @mastery_reset.save
        format.html { redirect_to @mastery_reset, notice: 'Mastery reset was successfully created.' }
        format.json { render :show, status: :created, location: @mastery_reset }
      else
        format.html { render :new }
        format.json { render json: @mastery_reset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mastery_resets/1
  # PATCH/PUT /mastery_resets/1.json
  def update
    respond_to do |format|
      if @mastery_reset.update(mastery_reset_params)
        format.html { redirect_to @mastery_reset, notice: 'Mastery reset was successfully updated.' }
        format.json { render :show, status: :ok, location: @mastery_reset }
      else
        format.html { render :edit }
        format.json { render json: @mastery_reset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mastery_resets/1
  # DELETE /mastery_resets/1.json
  def destroy
    @mastery_reset.destroy
    respond_to do |format|
      format.html { redirect_to mastery_resets_url, notice: 'Mastery reset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mastery_reset
      @mastery_reset = MasteryReset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mastery_reset_params
      params.require(:mastery_reset).permit(:MASTERY_RESET_ID, :COST)
    end
end
