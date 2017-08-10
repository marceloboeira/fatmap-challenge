require "spec_helper"
require_relative "../src/off_piste"

describe OffPiste do
  let(:fixture) { File.join(__dir__, "fixtures/sample.json") }
  let(:off_piste) { OffPiste.new(fixture) }

  describe "content load" do
    context "when the input file is not valid" do
      context "because the file does not exist" do
        let(:fixture) { "invalid_path" }

        it "returns an error" do
          expect { off_piste }.to raise_error(Errno::ENOENT)
        end
      end

      context "because the file is not json valid" do
        let(:fixture) { File.join(__dir__, "fixtures/invalid.json") }

        it "returns an error" do
          expect { off_piste }.to raise_error(JSON::ParserError)
        end
      end
    end

    context "when a valid file is given" do
      it "loads the content" do
        expect(off_piste.find(1)).to eq({
          "id": 1,
          "name": "Foo",
          "description": "Foobar"
        })
      end
    end
  end

  describe "search" do
    let(:fixture) { File.join(__dir__, "fixtures/searchable.json") }

    context "when the query return results"  do
      let(:query) { "foo" }
      let(:results) { off_piste.search(query) }
      let(:titles) { results.map { |item| item[:name] } }

      it "returns full match" do
        expect(titles).to include("foo")
      end

      it "returns case insensitive matches" do
        expect(titles).to include("Foo")
      end

      it "returns partial matches on starting of the word" do
        expect(titles).to include("fool")
      end

      it "returns partial matches on the end of the word" do
        expect(titles).to include("barfoo")
      end

      it "does not return non-matches" do
        expect(titles).to_not include("bar")
      end
    end
  end
end
