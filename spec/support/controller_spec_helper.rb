# frozen_string_literal: true

module ControllerSpecHelper
  def encode_token(payload)
    JWT.encode(payload, 'my_s3cr3t')
  end

  def token_generator(user_id)
    encode_token(user_id: user_id)
  end

  def valid_headers
    {
      'Authorization' => token_generator(user.id),
      'Content-Type' => 'application/json'
    }
  end

  def valid_headers_without_content_type
    {
      'Authorization' => token_generator(user.id)
    }
  end

  def invalid_headers
    {
      'Authorization' => nil,
      'Content-Type' => 'application/json'
    }
  end
end
