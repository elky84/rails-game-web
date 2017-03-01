# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_web_server_session'

if Rails.env.development?
else
	Rails.application.config.session_store :redis_store, servers: 'redis://127.0.0.1:6379/0/cache'
end