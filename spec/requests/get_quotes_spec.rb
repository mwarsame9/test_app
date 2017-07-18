require 'rails_helper'

describe "get all quotes route", :type => :request do
  let!(:quotes) { FactoryGirl.create_list(:quote, 20)}

  before { get '/quotes'}

  it 'returns all quotes' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end

  it 'returns status code 422 when record is not found' do
    expect(response).to have_http_status(:not_found)
  end

  # context 'when not valid' do
  #   it { is_expected.to respond_with 422 }
  # end
end
