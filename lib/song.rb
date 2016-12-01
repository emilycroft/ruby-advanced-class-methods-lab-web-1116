class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "unamed song", artist_name = "unknown")
    @artist_name = artist_name
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
    @@all.last
  end

  def self.create
    self.new.save
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    self.new(name).save
  end

  def self.find_by_name(song_name)
    @@all.find { |element| element.name == song_name }
  end

  def self.find_or_create_by_name(song_name)
    unless self.find_by_name(song_name)
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" -")[0]
    name_array = filename.split("- ")[1].split(".")
    name_array.pop
    new(name_array[0], artist_name)
  end

  def self.create_from_filename(filename)
    artist_name = filename.split(" -")[0]
    name_array = filename.split("- ")[1].split(".")
    name_array.pop
    new(name_array[0], artist_name).save
  end

  def self.destroy_all
    @@all = []
  end
end
