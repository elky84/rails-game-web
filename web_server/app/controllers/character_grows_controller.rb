class CharacterGrowsController < ApplicationController
  before_action :set_character_grow, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /character_grows
  # GET /character_grows.json
  def index
    if params[:search]
      @character_grows = CharacterGrow.search(params[:search])
    else
      @character_grows = CharacterGrow.limit(100)
    end
  end

  # GET /character_grows/1
  # GET /character_grows/1.json
  def show
  end

  # GET /character_grows/new
  def new
    @character_grow = CharacterGrow.new
  end

  # GET /character_grows/1/edit
  def edit
  end

  # POST /character_grows
  # POST /character_grows.json
  def create
    @character_grow = create_or_update(:GROW_ID)

    respond_to do |format|
      if @character_grow.save
        format.html { redirect_to @character_grow, notice: 'Character grow was successfully created.' }
        format.json { render :show, status: :created, location: @character_grow }
      else
        format.html { render :new }
        format.json { render json: @character_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_grows/1
  # PATCH/PUT /character_grows/1.json
  def update
    respond_to do |format|
      if @character_grow.update(character_grow_params)
        format.html { redirect_to @character_grow, notice: 'Character grow was successfully updated.' }
        format.json { render :show, status: :ok, location: @character_grow }
      else
        format.html { render :edit }
        format.json { render json: @character_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_grows/1
  # DELETE /character_grows/1.json
  def destroy
    @character_grow.destroy
    respond_to do |format|
      format.html { redirect_to character_grows_url, notice: 'Character grow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character_grow
      @character_grow = CharacterGrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_grow_params
      params.require(:character_grow).permit(:GROW_ID, :LEVEL, :GROW_TYPE_DETAIL, :REQUIRE_EXP, :STATUS_ID)
    end
end
