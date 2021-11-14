require File.dirname(__FILE__) + "/../spec_helper.rb"

describe "get '/home'" do
  it "should display hello world" do
    get '/home'
    expect(JSON.parse(last_response.body)["message"]).to eq('Welcome to my App')
  end
end