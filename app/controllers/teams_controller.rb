class TeamsController < ApplicationController
    before_action :authenticate_user!

    def show
        @teams = Team.find(params[:id])
    end

    def index
        @teams = Team.all
    end 

    def new
        @teams = Team.new
        @teams.players.build
    end

    def edit
        @teams = players.build if @team.players.empty?
        @teams = Team.find(params[:id])
    end

    def create
        @teams = Team.new(params.require(:teams).permit(:name, :country, :founded, :player_count, :description))
        if @teams.save
             flash[:notice] = "created successfully"
             redirect_to @teams
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        @teams = Team.find(params[:id])
        if @teams.update(params.require(:article).permit(:name, :country, :founded, :player_count, :description))
            flash[:notice] = "update successfully"
            redirect_to @teams
        else
            render edit , status: :unprocessable_entity
        end

    end

    def destroy
        @teams = Team.find(params[:id])
        @teams.destroy
        redirect_to teams_path

    end
     def team_params
    params.require(:school).permit(
      :name, :country, :founded, :player_count, :description, 
      plalyers_attributes: [:id, :name, :age, :position, :team_id, :role, :is_captain, :is_active, :description, :_destroy ],
      matches_attributes: [:location, :date, :home_team_id, :away_team_id, :_destroy]
     
    )
  end
  
end