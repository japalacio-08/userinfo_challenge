Userinfo::App.controllers :user, cache: true do

  post "/info", :provides => :json, cache: true do
    cache_key = "user_info_#{params['drivers_license_number']}"
    validate_input_contract(params)

    cached_property = Service::Cache.get(cache_key)
    return success_response(JSON.parse(cached_property)) if cached_property
    Service::Cache.set(cache_key, parse_drive_information.to_json)
    success_response(parse_drive_information)
  rescue => e
    error_response(e.message)
  end

end
