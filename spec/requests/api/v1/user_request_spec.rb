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


  end
end
