class StandingsController < ApplicationController
  def index
    @drivers = Driver.standings
  end
end