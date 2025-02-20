module TokenDecryptor
  def decrypt(token)
    decrypted = crypt.decrypt_and_verify(token)
    decrypted.gsub('user-id:', '').to_i
  rescue ActiveSupport::MessageEncryptor::InvalidMessage
    raise GraphQL::ExecutionError, 'Invalid token'
  end

  private

  def crypt
    if Rails.env.production?
      ActiveSupport::MessageEncryptor.new(ENV['SECRET_KEY_BASE'][0..31])
    else
      ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base[0..31])
    end
  end
end
