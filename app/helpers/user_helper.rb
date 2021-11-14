# Helper methods defined here can be accessed in any controller or view in the application

module Userinfo
  class App
    module UserHelper
      include ValidatorHelper
      include RenderHelper

      def validate_input_contract(params)
        validate_contract(UserInputContract, params)
      end

      def validate_output_contract(params)
        validate_contract(UserOutputContract, params)
      end

      def parse_drive_information
        validated = validate_output_contract(retrieve_user_info).to_h
        return validated[:data][:attributes]
      end

      private

      def retrieve_user_info
        Api.new.post(
          'https://cover-driver-information-mock.herokuapp.com/reports',
          { "data": { "attributes": params } },
          { 'Authorization': 'Bearer a9f05b05ce6d' }
        )
      end
      
    end

    helpers UserHelper
  end
end
