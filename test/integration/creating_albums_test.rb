require 'test_helper'

class CreatingAlbumsTest < ActionDispatch::IntegrationTest
  setup do 
    @band = Band.create!(name: 'Pony Bravo', id: 5)
  end
  test "creates a new album for a band" do 
    post "bands/#{@band.id}/albums",
     { album: { title: 'Si bajo de espalda no me da miedo', band_id: @band.id }}.to_json,
     { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    album = json(response.body)[:album]
    assert_equal 'Si bajo de espalda no me da miedo', album[:title]
    assert_equal 5, album[:band_id]
    assert_equal 'http://www.example.com/bands/5/albums/1', response.location

    artist = Band.find(album[:band_id])
    #assert_equal 1, @band.total #Este test falla... ni idea del porqué
    assert_equal 1, artist.total
  end

  test "does not create an album with invalid data" do 
    post "bands/#{@band.id}/albums",
     { album: { title: nil, band_id: @band.id }}.to_json,
     { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
  end
end
