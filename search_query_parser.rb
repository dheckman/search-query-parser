class SearchQueryParser
  def initialize(string)
    @tags = string.scan(/'([^']*)'/).flatten.reject { |tag| tag.to_s == "" }            
    @text = string.gsub(/'([^']*)'/,"").split("tag:").join("").strip
  end

  def text
    @text
  end

  def tags
    @tags
  end
end

describe SearchQueryParser do
  describe '#text' do
    it "finds the text" do
      parser = described_class.new("tag:'monkey' tag:'monkey business' monkey")
      expect(parser.text).to eql('monkey')
    end
    it "allows no text" do
      parser = described_class.new("tag:'curious george' tag:'king kong'")
      expect(parser.text).to eql("")
    end
    it "allows text in any location" do 
      parser = described_class.new("text here tag:'a tag in the middle!'and here")
      expect(parser.text).to eql("text here and here") 
    end 
  end

  describe '#tags' do
    it "finds the tags" do
      parser = described_class.new("tag:'monkey' tag:'monkey business' monkey")
      expect(parser.tags).to eql(['monkey', 'monkey business'])
    end
    it "removes empty tags" do
      parser = described_class.new("tag:'look at me I am not an empty tag' tag:''")
      expect(parser.tags).to eql((['look at me I am not an empty tag']))
    end
    it "allows no tags" do
      parser = described_class.new("Look at all my text without tags. I'm so wild!")
      expect(parser.tags).to eql([])
    end
  end
end
