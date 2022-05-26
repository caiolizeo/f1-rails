class CircuitsController < ApplicationController
  def index
    @circuits = FormulaOneCircuit.all
  end

  def show
    @circuit = FormulaOneCircuit.find(params[:id])
  end
end