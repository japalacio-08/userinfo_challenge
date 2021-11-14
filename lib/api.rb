require 'json'
class Api
    
  def get(url, headers={})
    validate_response(HTTParty.get(url, headers: concat_headers(headers)))
  end

  def post(url, params={}, headers={})
    response = HTTParty.post(url, body: params.to_json, headers: concat_headers(headers))
    validate_response(response)
  end

  private

  def concat_headers(headers)
    headers.merge({ 'Content-Type' => 'application/json' })
  end
  
  def validate_response(response)
    raise ApiError, 'Resource not found' if response.code == 404
    raise ApiError, 'Forbidden' if response.code == 403
    raise ApiError, 'Unprocessable Entity' if response.code >= 400
    return JSON.parse response&.body, symbolize_names: true if response.code < 400
  end
  
end

class ApiError < StandardError;end