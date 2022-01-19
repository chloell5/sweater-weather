class BackgroundFacade
  class << self
    def get_image(loc)
      bg = BackgroundService.image_data(loc)
      Background.new(bg)
    end
  end
end
