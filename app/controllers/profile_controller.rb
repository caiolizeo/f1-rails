class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @bets = Bet.where(user: current_user)
  end
end