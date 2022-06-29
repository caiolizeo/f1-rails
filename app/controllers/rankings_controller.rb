class RankingsController < ApplicationController
  
  def index

  end

  def last_race
    b = Bet.where(circuit: F1Circuit.last_race.code, year: Date.today.year, validated: true).order(result_points: :desc)
    @bets = b.map.with_index { |x, i| [i+1, x] }.to_h
  end
end
