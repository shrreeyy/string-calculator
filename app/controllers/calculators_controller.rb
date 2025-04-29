class CalculatorsController < ApplicationController
  def index; end

  def calculate
    input_string = params[:input_string]

    begin
      input_string = input_string.strip.gsub(/^"|"$/, "")

      input_string = input_string.gsub("\\n", "\n")

      if input_string.match?(/[a-zA-Z]/) && !input_string.start_with?("//")
        raise "invalid input: unsupported characters"
      end

      @result = StringCalculator.add(input_string)
    rescue RuntimeError => e
      @error = e.message
    end

    respond_to do |format|
      format.html { render :index }
      format.turbo_stream
    end
  end
end
