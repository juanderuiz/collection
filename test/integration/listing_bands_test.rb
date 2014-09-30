require 'test_helper'

class ListingBandsTest < ActionDispatch::IntegrationTest
  setup do
  	Band.create!(name: 'Arcade Fire')
  	Band.create!(name: 'Joy Division')
  end
  test 'listing bands'  do
    get '/bands'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Band.count, JSON.parse(response.body).size
  end
end
