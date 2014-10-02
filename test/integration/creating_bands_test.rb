require 'test_helper'

class CreatingBandsTest < ActionDispatch::IntegrationTest
  test 'creates a new band' do	
    post 'bands',
      { band:
      	{ name: 'Radiohead'}
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type 

    band = json(response.body)
    assert_equal band_url(band[:id]), response.location
    #band_url es un método que te da la url de un id
    assert_equal 'Radiohead', band[:name]
  end

  test 'does not create a band with invalid data' do 
    post 'bands',
      { band:
      	{ name: nil}
      }.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
  end
end
