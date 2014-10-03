require 'test_helper'

class DeletingAlbumsTest < ActionDispatch::IntegrationTest
  setup do 
  	@band = Band.create!(name: 'Radiohead', id: 3)
  	@album1 = Album.create!(title: 'The Bends', band_id:3)
  	@album2 = Album.create!(title: 'Ok Computer', band_id:3)
  end

  test 'deletes an album' do 
  	albums = Album.count
  	delete "bands/#{@band.id}/albums/#{@album1.id}"
  	assert_equal 204, response.status
  	assert_equal albums-1, Album.count
  end
end
