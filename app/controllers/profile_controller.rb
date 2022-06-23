class ProfileController < ApplicationController
  def index
    @bets = Bet.where(user: current_user)
  end
end