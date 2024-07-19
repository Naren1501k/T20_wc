class TeamsController < ApplicationController
    def show
        @teams = Team.find(params[:id])
    end

    def index
        @teams = Team.all
    end 

    def new
        @teams = Team.new
    end

    def edit
       
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
            render edit
        end

    end

    def destroy
        @teams = Team.find(params[:id])
        @teams.destroy
        redirect_to teams_path

    end
  
end