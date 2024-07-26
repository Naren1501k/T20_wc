class PlayersController < ApplicationController
  before_action :set_player, only: %i[ show edit update destroy ]
  before_action :set_team
  before_action :authenticate_user!


  def index
    @players = Player.includes(:team).all
    puts @players
    puts params.inspect
    if params[:team_id].present?
     
      @players = @players.where('players.team_id = ?', params[:team_id])
    end
    if params[:player_name].present?
      @players = @players.where('players.name = ?', params[:player_name])
    end
    if params[:age_min].present? && params[:age_max].present?
      @players = @players.where(age: params[:age_min]..params[:age_max])
    elsif params[:age_min].present?
      @players = @players.where('age >= ?', params[:age_min])
    elsif params[:age_max].present?
      @players = @players.where('age <= ?', params[:age_max])
    end
  end

  

  # GET /players or /players.json
  

  # GET /players/1 or /players/1.json
  def show
  end
  

  # GET /players/new
  def new
    @player = Player.new
  end

  # GET /players/1/edit
  def edit
  end

  # POST /players or /players.json
  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to player_url(@player), notice: "Player was successfully created." }
        format.json { render :show, status: :created, location: @player }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /players/1 or /players/1.json
  def update
    respond_to do |format|
      if @player.update(player_params)
        format.html { redirect_to player_url(@player), notice: "Player was successfully updated." }
        format.json { render :show, status: :ok, location: @player }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /players/1 or /players/1.json
  def destroy
    @player.destroy!

    respond_to do |format|
      format.html { redirect_to players_url, notice: "Player was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def player_params
      params.require(:player).permit(:name, :age, :position, :team_id, :role, :is_captain, :is_active, :description)
    end
    
    
end