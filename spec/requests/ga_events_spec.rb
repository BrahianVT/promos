require "rails_helper"

vcr_option = {
  cassette_name: "ga_event",
  allow_playback_repeats: "true"
}

RSpec.describe "GaEvents", type: :request, vcr: vcr_option do
  describe "POST /fallback_activity_recorder" do
    it "posts to fallback_activity_recorder" do
      post "/fallback_activity_recorder", params: {
        path: "/ben", user_language: "en"
      }.to_json
      expect(response.body).to eq("")
    end

    it "renders normal response even if site config is private" do
      SiteConfig.public = false
      post "/fallback_activity_recorder", params: {
        path: "/ben", user_language: "en"
      }.to_json
      expect(response.body).to eq("")
    end
  end
end
