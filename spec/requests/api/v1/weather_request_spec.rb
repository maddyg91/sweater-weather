require 'rails_helper'

describe 'Weather API', :vcr do
  it 'Can get weather by location' do
    location = "denver,co"

    get "/api/v1/forecast?location=#{location}"

    forecast_json = JSON.parse(response.body)

    expect(response).to be_successful
    expect(forecast_json).to have_key("data")
  end
end
