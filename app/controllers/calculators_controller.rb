class CalculatorsController < ApplicationController
  def index; end

  def calculate
    input_string = params[:input_string]

    input_string = input_string.strip.gsub(/^"|"$/, "")

    @result = StringCalculator.add(input_string)

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream
    end
  end
end
