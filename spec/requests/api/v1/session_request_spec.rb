require "rails_helper"

RSpec.describe "Session Requests" do
  it "creates a session for a user once logged in" do
    user = User.create(email: "test@example.com", password: "test123")
    params = ({
          "email": "test@example.com",
          "password": "test123"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    expect(data).to have_key(:data)
    expect(data[:data]).to have_key(:type)
    expect(data[:data][:type]).to be_an(String)
    expect(data[:data]).to have_key(:id)
    expect(data[:data][:id]).to be_an(String)
    expect(data[:data]).to have_key(:attributes)
    expect(data[:data][:attributes]).to be_an(Hash)
    expect(data[:data][:attributes]).to have_key(:email)
    expect(data[:data][:attributes][:email]).to be_an(String)
    expect(data[:data][:attributes]).to have_key(:api_key)
    expect(data[:data][:attributes][:api_key]).to be_an(String)

    expect(data[:data][:attributes]).to_not have_key(:password)
    expect(data[:data][:attributes]).to_not have_key(:password_digest)
  end

  it "fails to create a session due to bad credentials given at login" do
    user = User.create(email: "test@example.com", password: "test123")
    params = ({
          "email": "test@example.com",
          "password": "test"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/sessions", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    expect(data[:errors]).to eq("The given credentials are not valid.")

  end

end
