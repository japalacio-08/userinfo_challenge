require 'dry/validation'
class UserInputContract < Dry::Validation::Contract
  params do
    required(:first_name).filled(:string)
    required(:last_name).filled(:string)
    required(:drivers_license_number).filled(:string)
  end

  rule(:drivers_license_number) do
    key.failure('must be integer') if !(/\A\d+\z/.match(value))
    key.failure('must be 8 digits long') if "#{value}".length > 8
  end
end
