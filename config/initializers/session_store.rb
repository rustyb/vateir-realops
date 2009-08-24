# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vateir_realops_session',
  :secret      => '5df265191a7f84eb482c806d8c1c1213c96610c40de740b72402048d978dda62c4fe546988c65354c3be7b6e16dfc63fa3fdeb5ebb28c4d1f9f83ab7b6161ac9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
