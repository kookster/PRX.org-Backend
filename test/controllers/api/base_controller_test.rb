require 'test_helper'

describe Api::BaseController do

  it 'should show entrypoint' do
    get(:entrypoint, { api_version: 'v1', format: 'json' } )
    assert_response :success
  end

  it "determines show action options for roar" do
    @controller.class.resource_representer = "rr"
    @controller.show_options[:represent_with].must_equal "rr"
  end

  it "can parse a zoom parameter" do
    @controller.params[:zoom] = "a,test"
    @controller.zoom_param.must_equal ['a', 'test']
  end

end
