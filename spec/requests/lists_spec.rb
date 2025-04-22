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

    it "renders the header" do
      expect(response.body).to have_text("Here are your lists")
    end

    it "sets lists and renders the user's lists" do
      expect(lists.count).to eq(list_count)
      expect(response.body).to have_text(lists.first.title)
      expect(response.body).to have_text(lists.first.description)
    end
  end
end
