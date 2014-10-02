require 'test_helper'

class ListingBandsTest < ActionDispatch::IntegrationTest
  setup do
  	@band1 = Band.create!(name: 'Arcade Fire', id: 1)
  	@band2 = Band.create!(name: 'Joy Division', id: 2)
  end
  
  test 'listing bands' do
    get '/bands'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Band.count, json(response.body).size
  end

  test 'showing a band' do
    get "bands/#{@band1.id}"

    assert_equal 200, response.status
    #assert_equal Mime::JSON, response.content_type

    band_response = JSON.parse(response.body, symbolize_names: true)
    assert_equal @band1.name, band_response[:name]
  end
end
