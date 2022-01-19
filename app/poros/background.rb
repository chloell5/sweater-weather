class Background
  attr_reader :id,
              :description,
              :url,
              :name,
              :owner_page

  def initialize(data)
    @id           = nil
    @description  = data[:description]
    @url          = data[:urls][:raw]
    @name         = data[:user][:name]
    @owner_page   = data[:user][:links][:self]
  end
end
