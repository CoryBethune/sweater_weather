require "rails_helper"

RSpec.describe "User Creation" do
  it "Creates a user from a POST request" do
    params = ({
          "email": "test@example.com",
          "password": "test123",
          "password_confirmation": "test123"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)

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

  it "fails to create a user via post request because user is already created" do
    User.create!(email: "test@example.com", password: "test123")

    params = ({
          "email": "test@example.com",
          "password": "test123",
          "password_confirmation": "test123"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)

    expect(data).to have_key(:errors)
    expect(data[:errors]).to be_an(Array)
    expect(data[:errors].first).to be_an(String)
    expect(data[:errors].first).to eq("Email has already been taken")
  end

  it "fails to create user via post request because the passwords do not match" do
    params = ({
          "email": "test@example.com",
          "password": "test123",
          "password_confirmation": "test"
    })
    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users", headers: headers, params: JSON.generate(params)

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
    
    expect(data).to have_key(:errors)
    expect(data[:errors]).to be_an(String)
    expect(data[:errors]).to eq("Password and password confirmation fields must match.")
  end
end
