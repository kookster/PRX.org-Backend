require 'test_helper'

describe Api::AccountsController do

  let(:account) { FactoryGirl.create(:account) }

  it 'should show' do
    get(:show, { api_version: 'v1', format: 'json', id: account.id } )
    assert_response :success
  end

  it 'should list' do
    account.id.wont_be_nil
    get(:index, { api_version: 'v1', format: 'json' } )
    assert_response :success
  end

end
