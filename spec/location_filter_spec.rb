require 'location_filter'

describe "#talent_list" do
  context "Filtered list of talent returned" do
    let(:talent_list) { filter_talent('springfield', 'data/example.json') }

    it "should return an array of talent" do
      expect(talent_list).to be_a Array
    end

    it "should represent each talent as a hash" do
      expect(talent_list.all? { |talent| talent.is_a? Hash }).to eq true
    end

    it "should represent each talent with keys: name, location, date_of_birth" do
      expect(talent_list.first.keys.all? { |key| ["name", "location", "date_of_birth"].include? key }).to eq true
    end

    it "should only keep talent that have location springfield (case insensitive)" do
      expect(talent_list.all? { |talent| talent["location"].downcase == "springfield" }).to eq true
    end

    it "should return talent Homer Simpson and Krusty the Clown" do
      target = [
        {"name" => "Homer Simpson", "location" => "Springfield",  "date_of_birth" => "1956-05-12"},
        {"name" => "Krusty the Clown", "location" => "SpringField", "date_of_birth" => "1957-10-29"},
      ]
      expect(talent_list).to eq target
    end
  end
end
