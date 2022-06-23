class CircuitsController < ApplicationController
  def show
    begin
      @circuit = F1Circuit.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @circuit = nil
    end
  end
end