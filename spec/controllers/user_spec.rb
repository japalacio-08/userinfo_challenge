require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "get '/user/info'" do
  before(:each) do
    @dummy = {
      first_name: 'Jane',
      last_name: "Doe",
      drivers_license_number: "00002011"
    }
    @with_response = {
      number_of_incidents: 1,
      number_of_vehicles: 1
    }
    allow_any_instance_of(HTTParty).to receive(:post).and_return(@dummy.merge(@with_response))
  end

  it "should display required first_name error" do
    post '/user/info'
    expect(JSON.parse(last_response.body)["error"]).to eq('first_name is missing')
  end

  it "should display required last_name error" do
    post '/user/info', { first_name: 'Jane' }
    expect(JSON.parse(last_response.body)["error"]).to eq('last_name is missing')
  end

  it "should display required drivers_license_number error" do
    post '/user/info', { first_name: 'Jane', last_name: "Doe" }
    expect(JSON.parse(last_response.body)["error"]).to eq('drivers_license_number is missing')
  end

  it "should display licenses must be 8 digits long error" do
    post '/user/info', { first_name: 'Jane', last_name: "Doe", drivers_license_number: "000020131" }
    expect(JSON.parse(last_response.body)["error"]).to eq('drivers_license_number must be 8 digits long')
  end

  it "should display licenses must be 8 digits long error" do
    post '/user/info', { first_name: 'Jane', last_name: "Doe", drivers_license_number: "0000201a" }
    expect(JSON.parse(last_response.body)["error"]).to eq('drivers_license_number must be integer')
  end

  it "should display response success true" do
    post '/user/info', { first_name: 'Jane', last_name: "Doe", drivers_license_number: "00002013" }
    expect(JSON.parse(last_response.body)["success"]).to be_truthy
  end

  it "should display response data->first_name" do
    post '/user/info', {
      first_name: 'Jane',
      last_name: "Doe",
      drivers_license_number: "00002011"
    }
    expect(JSON.parse(last_response.body)["data"]["first_name"]).to eq('Jane')
    expect(JSON.parse(last_response.body)["data"]["number_of_incidents"]).to eq(1)
  end
  
end