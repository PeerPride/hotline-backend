# frozen_string_literal: true

# Split up seeds across multiple files in db/seeds to keep this file from getting really long and unwieldy

Dir[Rails.root.join('db/seeds/*.rb')].each do |seed_file|
  require seed_file
end
