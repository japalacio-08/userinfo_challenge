RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include RSpec::Padrino # add this
end

def app
  ##
  # You should point toplevel #app method to:
  Padrino.application
end