class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index

  end

  def new
    @bet = Bet.new
    @next_race = Circuit.next_race
    @year = @next_race.date.last(4)
    @user = current_user.id
  end
  
  def create
    valid = true
    bet_params = params.require(:bet).permit(:circuit, :year, :user_id, :pole_position, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eighth, :ninth, :tenth)
    positions = [bet_params[:first], bet_params[:second], bet_params[:third], bet_params[:fourth], bet_params[:fifth], bet_params[:sixth], bet_params[:seventh], bet_params[:eighth], bet_params[:ninth], bet_params[:tenth]]
    
    valid = false if positions.detect{ |e| positions.count(e) > 1 } != nil || 
            bet_params[:circuit] != Circuit.next_race.id || bet_params[:year] != Circuit.next_race.date.last(4)

    if valid == true
      b = Bet.new(bet_params)
      b.save
      return redirect_to root_path, notice: 'Aposta realizada com sucesso' if b.valid?
    end
    @next_race = Circuit.next_race
    flash.now[:alert] = 'Aposta inválida'
    render 'new'
  end

end
