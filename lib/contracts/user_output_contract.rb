require 'dry/validation'
class UserOutputContract < Dry::Validation::Contract
  params do
    required(:data).hash do
      required(:id).filled(:string)
      required(:type).filled(:string)
      required(:attributes).hash do
        required(:first_name).filled(:string)
        required(:last_name).filled(:string)
        required(:drivers_license_number).filled(:string)
        required(:number_of_incidents).filled(:integer)
        required(:number_of_vehicles).filled(:integer)
      end
    end
  end
end
