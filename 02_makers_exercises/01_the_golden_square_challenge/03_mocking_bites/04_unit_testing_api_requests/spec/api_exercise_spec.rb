require "date"
require "api_exercise"

describe TimeError do
  it "should return the difference between the remote time and the local time" do
    server_time = double :TimeFetcher
    expect(server_time)
    .to receive(:get)
    .with(URI("https://worldtimeapi.org/api/ip"))
    .and_return('{"abbreviation":"GMT","client_ip":"86.28.233.193",
      "datetime":"2023-02-20T22:56:38.115945+00:00","day_of_week":1,"day_of_year":51,"dst":false,
      "dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London",
      "unixtime":1676933798,"utc_datetime":"2023-02-20T22:56:38.115945+00:00","utc_offset":"+00:00","week_number":8}')
    time = Time.new(2023, 02, 20, 22, 56, 38)
    test1 = TimeError.new(server_time)
    expect(test1.error(time)).to eq 0.115945 
  end
end

