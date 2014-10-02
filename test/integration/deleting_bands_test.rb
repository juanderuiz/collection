require 'test_helper'

class DeletingBandsTest < ActionDispatch::IntegrationTest
  setup do 
    @band = Band.create!(name:'Franc3s')
  end
  test 'delete bands' do 
    delete "bands/#{@band.id}"

    assert_equal 204, response.status
  end
end
