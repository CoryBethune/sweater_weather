class UserSerializer

  def self.new_user(user)
    {
      data: {
        type: 'users',
        id: user.id.to_s,
        attributes: {
          email: user.email,
          api_key: user.auth_token
        }
      }
    }
  end

end
