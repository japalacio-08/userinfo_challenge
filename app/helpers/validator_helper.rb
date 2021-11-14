# Helper methods defined here can be accessed in any controller or view in the application

module Userinfo
  class App
    module ValidatorHelper

      def validate_contract(validator_class, params)
        params.delete(:format)
        validation_result = validator_class.new.call(params)
        errors = validation_result.errors
        return validation_result if errors.count.zero?
        first_error = errors.first
        raise Userinfo::ValidationError, "#{first_error.path.first.to_s} #{first_error.text}"
      end

    end

    helpers ValidatorHelper
  end
  class ValidationError < StandardError; end
end
