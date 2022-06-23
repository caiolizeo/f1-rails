class HomeController < ApplicationController
  def index
    @next_race = F1Circuit.next_race
    @race = @next_race.race
    @sprint = @next_race.sprint
    @qualifying = @next_race.qualifying
    @fp3 = @next_race.fp3
    @fp2 = @next_race.fp2
    @fp1 = @next_race.fp1
  end
end