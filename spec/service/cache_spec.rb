require File.dirname(__FILE__) + "/../spec_helper.rb"
require 'active_support/time'

describe "test Service::Cache" do
  it "should display dummy key value" do
    expect(Service::Cache.set('dummy', 'hey!')).to eq('hey!')
  end

  it "should display dummy key value from get" do
    Service::Cache.set('dummy', 'hey!')
    expect(Service::Cache.get('dummy')).to eq('hey!')
  end

  it "should display dummy key value" do
    Service::Cache.set('dummy', 'hey!', 3.seconds)
    sleep 3
    expect(Service::Cache.get('dummy')).to be_nil
  end
end