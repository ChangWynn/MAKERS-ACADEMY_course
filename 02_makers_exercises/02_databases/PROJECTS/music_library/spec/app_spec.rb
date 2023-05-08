require_relative "../app"

describe Application do
  let(:out_of_loop) { allow(kernel).to receive(:gets) {""} }
  let(:database) { "music_library"}
  let(:kernel) { spy(double :Kernel)}
  let(:album_repo) { spy(double :AlbumRepository)}
  let(:artist_repo) { spy(double :ArtistRepository)}
  subject { Application.new(database, kernel, album_repo, artist_repo) }


  # before do
  #   allow(kernel).to receive(:gets) {""}
  # end

  context "#initialize method" do
    it "should accept 4 arguments" do
      expect(subject).to be
    end
    it "should throw an error if wrong number of argument is given" do
      expect{Application.new(database, kernel)}.to raise_error ArgumentError
    end
  end

  context "#run method" do
    it "should be a loop" do
      expect(kernel).to receive(:gets) {"1"}
      expect(kernel).to receive(:gets) {"2"}
      expect(kernel).to receive(:gets) {""}
      subject.run
    end
    it "should output some welcome texts" do
      out_of_loop
      subject.run
      expect(kernel).to have_received(:puts).with('Welcome to the music library manager!').ordered
      expect(kernel).to have_received(:puts).with('What would you like to do?').ordered
      expect(kernel).to have_received(:puts).with(' 1 - List all albums').ordered
      expect(kernel).to have_received(:puts).with(' 2 - List all artists').ordered
      expect(kernel).to have_received(:puts).with('Enter your choice:').ordered
    end
    it "should get user choice" do
      expect(kernel).to receive(:gets) { "1" }
      out_of_loop
      subject.run
    end
    it "should get user choice" do
      expect(kernel).to receive(:gets) { "2" }
      out_of_loop
      subject.run
    end
    it "should returns a list of albums when user chose 1" do
      expect(kernel).to receive(:gets) { "1" }
      out_of_loop
      subject.run
      expect(kernel).to have_received(:puts).with('Here is the list of albums:')
    end
    it "should returns a list of artists when user chose 1" do
      expect(kernel).to receive(:gets) { "2" }
      out_of_loop
      subject.run
      expect(kernel).to have_received(:puts).with('Here is the list of artists:')
    end
    it "should call the all method on the album repository" do
      expect(kernel).to receive(:gets) {"1"}
      out_of_loop
      subject.run
      expect(album_repo).to have_received(:all)
    end
    it "should output a list of albums when the all method is called on the album repository" do
      album1 = double :Album, id: "1", title: "Doolittle"
      album2 = double :Album, id: "2", title: "Surfer Rosa"
      album3 = double :Album, id: "3", title: "Waterloo"
      expect(kernel).to receive(:gets) {"1"}
      expect(album_repo).to receive(:all) { [album1, album2, album3] }
      expect(kernel).to receive(:puts).with(" * 1 - Doolittle").ordered
      expect(kernel).to receive(:puts).with(" * 2 - Surfer Rosa").ordered
      expect(kernel).to receive(:puts).with(" * 3 - Waterloo").ordered
      out_of_loop
      subject.run
    end
    it "should output a list of artists when the all method is called on the artist repository" do
      artist1 = double :Artist, id: "1", name: "Pixies"
      artist2 = double :Artist, id: "2", name: "ABBA"
      artist3 = double :Artist, id: "3", name: "Taylor Swift"
      expect(kernel).to receive(:gets) {"2"}
      expect(artist_repo).to receive(:all) { [artist1, artist2, artist3] }
      expect(kernel).to receive(:puts).with(" * 1 - Pixies").ordered
      expect(kernel).to receive(:puts).with(" * 2 - ABBA").ordered
      expect(kernel).to receive(:puts).with(" * 3 - Taylor Swift").ordered
      out_of_loop
      subject.run      
    end
    it "" do
      expect(kernel).to receive(:gets) { "3" }
      expect(kernel).to receive(:puts).with('What is the title?' )
      expect(kernel).to receive(:gets) { "8 mile" }
      expect(kernel).to receive(:puts).with('What is the release year?' )
      expect(kernel).to receive(:gets) { "2002" }
      out_of_loop
      subject.run
    end
  end
end
 