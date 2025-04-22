require 'rails_helper'

RSpec.describe "Lists", type: :request do
  describe "GET /index" do
    let!(:user) { create(:user) }
    let(:list_count) { 3 }
    let!(:lists) { create_list(:list, list_count, user: user) }

    before do
      get lists_path
    end

    it "returns a successful response" do
      expect(response).to have_http_status(:ok)
    end

    it "renders content from the index template" do
      expect(response.body).to include("Here are your lists")
    end

    it "returns all lists for the user" do
      expect(lists.count).to eq(list_count)

      lists.each do |list|
        expect(response.body).to have_css("div", text: "#{list.title}")
        expect(response.body).to have_css("div", text: "#{list.description}")
      end
    end
  end
end
