# frozen_string_literal: true

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV['REDIS_URL'] || Rails.application.credentials[:redis][:url],
    username: ENV['REDIS_USERNAME'] || Rails.application.credentials[:redis][:username],
    password: ENV['REDIS_PASSWORD'] || Rails.application.credentials[:redis][:password],
    ssl: true,
    ssl_params: {
      cert: './certs/client-cert.pem',
      key: './certs/client-key.pem',
      ca_file: './certs/ca-cert.pem',
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
      min_version: OpenSSL::SSL::TLS1_2_VERSION,

    }
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV['REDIS_URL'] || Rails.application.credentials[:redis][:url],
    username: ENV['REDIS_USERNAME'] || Rails.application.credentials[:redis][:username],
    password: ENV['REDIS_PASSWORD'] || Rails.application.credentials[:redis][:password],
    ssl: true,
    min_version: 'TLSv1',
    ssl_params: {
      cert: './certs/client-cert.pem',
      key: './certs/client-key.pem',
      ca_file: './certs/ca-cert.pem',
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
      min_version: OpenSSL::SSL::TLS1_2_VERSION,
    }
  }
end
