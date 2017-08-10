require "spec_helper"
require_relative "../src/application"

describe "Application" do
  def app
    @app ||= Application
  end

  describe "GET /search" do
    let(:query) { "cesso" }
    let(:json_response) { JSON.parse(last_response.body, symbolize_names: true) }
    let(:names) { json_response.map { |item| item[:name] } }

    before do
      get "/search?query=#{query}"
    end

    it "returns with status ok" do
      expect(last_response).to be_ok
    end

    it "returns the expected result items of the query" do
      expect(names).to eq(["Cesso Plus Couloir", "Cesso Couloir"])
    end

    it "returned results contain the same fields of the given" do
      expect(json_response.first.keys).to eq([
        :id,
        :name,
        :description,
        :groomed,
        :number,
        :piste_type,
        :rating,
        :access,
        :aspect,
        :snow_cannon,
        :glacier,
        :sun,
        :max_gradient,
        :fatmap_url,
        :ski_difficulty,
        :ski_seriousness,
        :route_finding,
        :grade,
        :exposure,
        :terrain,
        :walk_required,
        :time_required,
        :equipment,
        :risks,
        :trees,
        :cliffs,
        :moguls,
        :crampons,
        :rope,
        :skins,
        :ski_grade,
        :ski_grade_labande,
        :ski_tour,
        :location,
        :more_info_url,
        :short_description,
        :geo_data,
        :topology_data,
        :lifts,
        :tags,
        :area,
        :moderation,
        :contributors
      ])
    end
  end
end
