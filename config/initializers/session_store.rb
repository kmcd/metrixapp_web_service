# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_petri_session',
  :secret      => '6e0ff5b13ff4d4bae89e692fa0fea213aa4b44b2c303fc1ac0446c9e7bc1edbf1868c10ffe7f4da3ea31f01f52a70551a91011acdda298b2fa7ed07f5703b25e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
