require "bundler"
Bundler.require

require_relative "off_piste"

class Application < Sinatra::Base
  get "/search" do
    query = params[:query]

    content_type(:json)

    off_piste.search(query).to_json
  end

  private

  def data_source_path
    File.join(__dir__, "../data/off-pistes.json")
  end

  def off_piste
    @off_piste ||= OffPiste.new(data_source_path)
  end
end
