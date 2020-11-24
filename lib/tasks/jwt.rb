class JsonWebToken
  def self.encode(payload)
    JWT.encode(
      payload, 
      Rails.application.credentials.dig(:)
    )
  end

  def self.decode(token)
    return HashWithIndifferentAccess.new(JWT.decode(token, Rails.application.credentials.dig(:SECRET_KEY_BASE))[0])
  rescue
    nil
  end
end