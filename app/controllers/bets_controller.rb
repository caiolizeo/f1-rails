class BetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :duplicated_bet, only: [:new, :create]
  before_action :private_bet, only: [:show]

  def index

  end

  def new
    @bet = Bet.new
    @next_race = F1Circuit.next_race
    @drivers = F1Driver.where("year = '#{@next_race.year}'")
  end

  def create
    bet_params = params.require(:bet).permit(:pole, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eighth, :ninth, :tenth)
    
    b = Bet.new(bet_params)
    b.user = current_user
    b.year = F1Circuit.next_race.year
    b.circuit = F1Circuit.next_race 
    if b.save
      redirect_to b, notice: 'Aposta realizada com sucesso' 
    else
      @next_race = Circuit.next_race
      @errors = b.errors.full_messages
      flash.now[:alert] = 'Aposta inválida'
      render 'new'
    end
  end


  def show
    @bet = Bet.find(params[:id])
    @pole = F1Driver.find_by(code: @bet.pole, year: @bet.year)
    codes = [@bet.first, @bet.second,  @bet.third, @bet.fourth, @bet.fifth, @bet.sixth, @bet.seventh, @bet.eighth, @bet.ninth, @bet.tenth]
    @last_drivers = []

    codes.each do |code|
      driver = F1Driver.find_by(code: code, year: @bet.year)
      @last_drivers << driver
    end

    @first_drivers = @last_drivers.take(3)
    3.times do
      @last_drivers.delete_at(0)
    end

  end


  private
  def duplicated_bet
    bet = Bet.find_by(user: current_user, year: F1Circuit.next_race.year, circuit: F1Circuit.next_race.code)
    redirect_to bet if bet != nil
  end

  def private_bet
    bet = Bet.find(params[:id])
    redirect_to root_path if current_user != bet.user
  end
end
