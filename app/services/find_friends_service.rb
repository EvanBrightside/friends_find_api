class FindFriendsService
  def initialize(params)
    @radius = params['radius'].to_i
    @origin = [params['lat'].to_f, params['lng'].to_f]
  end

  def call
    find_friends(@radius, @origin)
  end

  private

  def find_friends(radius, origin)
    User.within(radius, origin: origin)
  end
end

# FindFriendsService.new({"radius"=>"5", "lat"=>"55.75", "lng"=>"37.6167"}).call
