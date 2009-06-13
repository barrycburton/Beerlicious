# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_beerlicious_session',
  :secret      => '0f655665a4e2ec908107641828894920d43ee85954d2345c6db726e6dc214de0a8969c209a22f129a0a955a2bbc5b02691473be5aff5ac55f6e863a7e2baa0b5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
