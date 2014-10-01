require 'test_helper'

class ListingAlbumsTest < ActionDispatch::IntegrationTest
  setup do
  	Album.create!(title: 'The Suburbs', band_id: 1)
  	Album.create!(title: 'Unknown Pleasures', band_id: 2)
    Album.create!(title: 'Reflektor', band_id: 1)
    @band = Band.create!(id: 1, name: 'Arcade Fire')
  end

  test 'listing albums'  do
    get "/bands/#{@band.id}/albums"

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 2, json(response.body).size
  end
end