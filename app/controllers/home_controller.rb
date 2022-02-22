class HomeController < ApplicationController
  def index
    @next_race = Circuit.next_race
  end
end