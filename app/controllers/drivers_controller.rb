class DriversController < ApplicationController
  def show
    begin
      @driver = F1Driver.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @driver = nil
    end
  end
end
