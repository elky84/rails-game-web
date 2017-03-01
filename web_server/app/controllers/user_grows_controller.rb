class UserGrowsController < ApplicationController
  before_action :set_user_grow, only: [:show, :edit, :update, :destroy]
	before_action :ip_check

  # GET /user_grows
  # GET /user_grows.json
  def index
    if params[:search]
      @user_grows = UserGrow.search(params[:search])
    else
      @user_grows = UserGrow.limit(100)
    end
  end

  # GET /user_grows/1
  # GET /user_grows/1.json
  def show
  end

  # GET /user_grows/new
  def new
    @user_grow = UserGrow.new
  end

  # GET /user_grows/1/edit
  def edit
  end

  # POST /user_grows
  # POST /user_grows.json
  def create
    @user_grow = create_or_update(:GROW_ID)

    respond_to do |format|
      if @user_grow.save
        format.html { redirect_to @user_grow, notice: 'User grow was successfully created.' }
        format.json { render :show, status: :created, location: @user_grow }
      else
        format.html { render :new }
        format.json { render json: @user_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_grows/1
  # PATCH/PUT /user_grows/1.json
  def update
    respond_to do |format|
      if @user_grow.update(user_grow_params)
        format.html { redirect_to @user_grow, notice: 'User grow was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_grow }
      else
        format.html { render :edit }
        format.json { render json: @user_grow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_grows/1
  # DELETE /user_grows/1.json
  def destroy
    @user_grow.destroy
    respond_to do |format|
      format.html { redirect_to user_grows_url, notice: 'User grow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_grow
      @user_grow = UserGrow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_grow_params
      params.require(:user_grow).permit(:GROW_ID, :LEVEL, :REQUIRE_EXP)
    end
end
