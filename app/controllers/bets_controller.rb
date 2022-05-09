class BetsController < ApplicationController
  
  def index

  end

  def new
    @bet = Bet.new
  end
end
