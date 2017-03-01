class QuestShortCutsController < ApplicationController
  before_action :set_quest_short_cut, only: [:show, :edit, :update, :destroy]

  # GET /quest_short_cuts
  # GET /quest_short_cuts.json
  def index
    @quest_short_cuts = QuestShortCut.all
  end

  # GET /quest_short_cuts/1
  # GET /quest_short_cuts/1.json
  def show
  end

  # GET /quest_short_cuts/new
  def new
    @quest_short_cut = QuestShortCut.new
  end

  # GET /quest_short_cuts/1/edit
  def edit
  end

  # POST /quest_short_cuts
  # POST /quest_short_cuts.json
  def create
    @quest_short_cut = create_or_update(:SHORT_CUT_NO)

    respond_to do |format|
      if @quest_short_cut.save
        format.html { redirect_to @quest_short_cut, notice: 'Quest short cut was successfully created.' }
        format.json { render :show, status: :created, location: @quest_short_cut }
      else
        format.html { render :new }
        format.json { render json: @quest_short_cut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_short_cuts/1
  # PATCH/PUT /quest_short_cuts/1.json
  def update
    respond_to do |format|
      if @quest_short_cut.update(quest_short_cut_params)
        format.html { redirect_to @quest_short_cut, notice: 'Quest short cut was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_short_cut }
      else
        format.html { render :edit }
        format.json { render json: @quest_short_cut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_short_cuts/1
  # DELETE /quest_short_cuts/1.json
  def destroy
    @quest_short_cut.destroy
    respond_to do |format|
      format.html { redirect_to quest_short_cuts_url, notice: 'Quest short cut was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_short_cut
      @quest_short_cut = QuestShortCut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_short_cut_params
      params.require(:quest_short_cut).permit(:SHORT_CUT_NO, :SHORT_CUT_TYPE)
    end
end
