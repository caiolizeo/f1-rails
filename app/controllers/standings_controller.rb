class StandingsController < ApplicationController
  def index
    @drivers = F1Driver.standings
  end
end
