require 'rails_helper'

RSpec.describe CalculatorsController, type: :controller do
  describe "GET #index" do
    it "renders the index page successfully" do
      get :index
      expect(response).to be_successful
      expect(response).to render_template(:index)
    end
  end

  describe "POST #calculate" do
    context "when input is empty" do
      it "returns 0" do
        post :calculate, params: { input_string: "" }
        expect(assigns(:result)).to eq(0)
        expect(response).to render_template(:index)
      end
    end

    context "when input is valid comma-separated numbers" do
      it "calculates the sum correctly" do
        post :calculate, params: { input_string: "1,2,3" }
        expect(assigns(:result)).to eq(6)
        expect(response).to render_template(:index)
      end
    end

    context "when input contains negative numbers" do
      it "returns an error message for negative numbers" do
        post :calculate, params: { input_string: "1,-2,3" }
        expect(assigns(:error)).to eq("negative numbers not allowed: -2")
        expect(response).to render_template(:index)
      end
    end

    context "when input contains newline delimiters" do
      it "parses the input and returns the correct sum" do
        post :calculate, params: { input_string: "1\\n2\\n3" }
        expect(assigns(:result)).to eq(6)
        expect(response).to render_template(:index)
      end
    end

    context "when input contains unsupported characters" do
      it "returns error message for invalid input" do
        post :calculate, params: { input_string: "1,2,a" }
        expect(assigns(:error)).to eq("invalid input: unsupported characters")
        expect(response).to render_template(:index)
      end
    end

    context "when using a custom delimiter" do
      it "calculates the sum correctly with custom delimiter" do
        post :calculate, params: { input_string: "//;\n1;2" }
        expect(assigns(:result)).to eq(3)
        expect(response).to render_template(:index)
      end
    end

    context "when using a custom delimiter but newline is missing after delimiter" do
      it "calculates the sum correctly with custom delimiter" do
        post :calculate, params: { input_string: "//;1;2" }
        expect(assigns(:error)).to eq("Invalid format: missing newline after delimiter")
        expect(response).to render_template(:index)
      end
    end
  end
end
