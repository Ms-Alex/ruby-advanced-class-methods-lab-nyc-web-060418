class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      return song if song.name == name
    end
    return nil
  end

  def self.find_or_create_by_name(name)

    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end

  end


  def self.alphabetical
    new_arr = @@all.sort_by do |song|
      song.name
    end
    new_arr
  end

  def self.new_from_filename(file_name)
    file_name_arr = file_name.split(" - ")
    reformat_song = (file_name_arr.pop).split(".")
    file_name_arr += reformat_song
    song = self.new_by_name(file_name_arr[1])
    song.artist_name = file_name_arr[0]
    song
  end

  def self.create_from_filename(file_name)
    file_name_arr = file_name.split(" - ")
    reformat_song = (file_name_arr.pop).split(".")
    file_name_arr += reformat_song
    song = self.create_by_name(file_name_arr[1])
    song.artist_name = file_name_arr[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
