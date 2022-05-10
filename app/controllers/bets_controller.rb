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
    bet_params = params.require(:bet).permit(:pole_position, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eighth, :ninth, :tenth)
    
    b = Bet.new(bet_params)
    b.user_id = current_user.id
    b.year = Circuit.next_race.date.last(4)
    b.circuit = Circuit.next_race.id    
    
    if b.save
    redirect_to b, notice: 'Aposta cadastrada com sucesso' 
    else
      @next_race = Circuit.next_race
      @errors = b.errors.full_messages
      flash.now[:alert] = 'Aposta inválida'
      render 'new'
    end
  end


  def show
    @bet = Bet.find(params[:id])
    @pole = FormulaOneDriver.find_by(code: @bet.pole_position, year: @bet.year)
    codes = [@bet.first, @bet.second,  @bet.third, @bet.fourth, @bet.fifth, @bet.sixth, @bet.seventh, @bet.eighth, @bet.ninth, @bet.tenth]
    @drivers = []

    codes.each do |code|
      driver = FormulaOneDriver.find_by(code: code, year: @bet.year)
      @drivers << driver
    end

  end
end
