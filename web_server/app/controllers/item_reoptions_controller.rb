class ItemReoptionsController < ApplicationController
  before_action :set_item_reoption, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /item_reoptions
  # GET /item_reoptions.json
  def index
    if params[:search]
      @item_reoptions = ItemReoption.search(params[:search])
    else
      @item_reoptions = ItemReoption.limit(100)
    end
  end

  # GET /item_reoptions/1
  # GET /item_reoptions/1.json
  def show
  end

  # GET /item_reoptions/new
  def new
    @item_reoption = ItemReoption.new
  end

  # GET /item_reoptions/1/edit
  def edit
  end

  # POST /item_reoptions
  # POST /item_reoptions.json
  def create
    @item_reoption = create_or_update(:ITEM_REOPTION_ID)

    respond_to do |format|
      if @item_reoption.save
        format.html { redirect_to @item_reoption, notice: 'Item reoption was successfully created.' }
        format.json { render :show, status: :created, location: @item_reoption }
      else
        format.html { render :new }
        format.json { render json: @item_reoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_reoptions/1
  # PATCH/PUT /item_reoptions/1.json
  def update
    respond_to do |format|
      if @item_reoption.update(item_reoption_params)
        format.html { redirect_to @item_reoption, notice: 'Item reoption was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_reoption }
      else
        format.html { render :edit }
        format.json { render json: @item_reoption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_reoptions/1
  # DELETE /item_reoptions/1.json
  def destroy
    @item_reoption.destroy
    respond_to do |format|
      format.html { redirect_to item_reoptions_url, notice: 'Item reoption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_reoption
      @item_reoption = ItemReoption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_reoption_params
      params.require(:item_reoption).permit(:ITEM_REOPTION_ID, :ITEM_CATEGORY, :GRADE, :LEVEL, :MONEY)
    end
end
