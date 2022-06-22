class HomeController < ApplicationController
  def index
    @next_race = F1Circuit.next_race
  end
end