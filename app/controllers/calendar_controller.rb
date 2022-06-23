class CalendarController < ApplicationController
  def index
    @circuits = F1Circuit.all
  end
end