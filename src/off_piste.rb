class OffPiste
  def initialize(path)
    load_from(path)
  end

  def find(id)
    data.find do |item|
      item[:id] == id
    end
  end

  def search(query)
    data.select do |item|
      item[:name].match(/#{query}/i)
    end
  end

  private

  def load_from(path)
    @data = parse(read_from(path))
  end

  def read_from(path)
    File.read(path)
  end

  def parse(content)
    JSON.parse(content, symbolize_names: true)
  end

  attr_reader :data
end
