# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_rps_session',
  :secret      => '26b258c93a9d1495ea72b74cd693a4df178f3e33f8dae4cea86d00224e7b9e2e03f05146da8cf7b9909be86e403df27edd85d8961c2e9ce02ac8444798c8494d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
