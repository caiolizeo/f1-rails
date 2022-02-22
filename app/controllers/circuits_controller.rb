class CircuitsController < ApplicationController
  def index
    @circuits = Circuit.all
  end

  def show
    @circuit = Circuit.find(params[:id])
  end
end