require 'rails_helper'

describe 'Auth Token API', type: :request do
  it 'get an auth token' do
    user = FactoryGirl.create(:user)
    get '/api/auth_token', params: {}, headers: { 'Accept' => 'application/json',
                                                  'AUTHORIZATION' => 'Basic ' + Base64.strict_encode64("#{user.email}:vg5msvy1")}
    expect(response).to be_success
    json = JSON.parse(response.body)
    expect(json['auth_token']).to eq user.reload.auth_token
  end
end