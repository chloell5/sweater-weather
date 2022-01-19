class BackgroundService
  class << self
    def image_data(loc)
      BackgroundClient.get_data("/photos/random?query=#{loc}")
    end
  end
end
