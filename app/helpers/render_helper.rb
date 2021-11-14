# Helper methods defined here can be accessed in any controller or view in the application

module Userinfo
  class App
    module RenderHelper

      def success_response(data=nil, message=nil)
        {
          data: data,
          message: message,
          success: true
        }.to_json
      end

      def error_response(error)
        {
          data: nil,
          error: error,
          success: false
        }.to_json
      end
    end

    helpers RenderHelper
  end
  class ValidationError < StandardError; end
end
