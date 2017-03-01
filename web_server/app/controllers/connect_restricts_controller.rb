class ConnectRestrictsController < ApplicationController
  before_action :set_connect_restrict, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /connect_restricts
  # GET /connect_restricts.json
  def index
    if params[:search]
      @connect_restricts = ConnectRestrict.search(params[:search])
    else
      @connect_restricts = ConnectRestrict.limit(100)
    end
  end

  # GET /connect_restricts/1
  # GET /connect_restricts/1.json
  def show
  end

  # GET /connect_restricts/new
  def new
    @connect_restrict = ConnectRestrict.new
  end

  # GET /connect_restricts/1/edit
  def edit
  end

  # POST /connect_restricts
  # POST /connect_restricts.json
  def create
    @connect_restrict = create_or_update(:CONNECT_RESTRICT_NO)

    respond_to do |format|
      if @connect_restrict.save
        format.html { redirect_to @connect_restrict, notice: 'Connect restrict was successfully created.' }
        format.json { render :show, status: :created, location: @connect_restrict }
      else
        format.html { render :new }
        format.json { render json: @connect_restrict.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connect_restricts/1
  # PATCH/PUT /connect_restricts/1.json
  def update
    respond_to do |format|
      if @connect_restrict.update(connect_restrict_params)
        format.html { redirect_to @connect_restrict, notice: 'Connect restrict was successfully updated.' }
        format.json { render :show, status: :ok, location: @connect_restrict }
      else
        format.html { render :edit }
        format.json { render json: @connect_restrict.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connect_restricts/1
  # DELETE /connect_restricts/1.json
  def destroy
    @connect_restrict.destroy
    respond_to do |format|
      format.html { redirect_to connect_restricts_url, notice: 'Connect restrict was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connect_restrict
      @connect_restrict = ConnectRestrict.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connect_restrict_params
      params.require(:connect_restrict).permit(:CONNECT_RESTRICT_ID, :TYPE, :VALUE)
    end
end
