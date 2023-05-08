require "api_challenge"

describe CatFacts do
    it "should return cat fact from an API request" do
      net_http = double :Net_HTTP
      expect(net_http)
      .to receive(:get)
      .with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"If they have ample water, cats can tolerate temperatures up to 133 \u00b0F.","length":70}')

      fact = CatFacts.new(net_http)
      expect(fact.provide).to eq "Cat fact: If they have ample water, cats can tolerate temperatures up to 133 \u00b0F."
    end
end