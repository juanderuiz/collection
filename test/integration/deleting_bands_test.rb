require 'test_helper'

class DeletingBandsTest < ActionDispatch::IntegrationTest
  setup do 
    @band = Band.create!(name:'Franc3s')
  end

  test 'delete bands' do 
  	bands = Band.count
    delete "bands/#{@band.id}"

    assert_equal 204, response.status
    assert 0, Band.count
  end
end
