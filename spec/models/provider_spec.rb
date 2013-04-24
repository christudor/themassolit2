require 'spec_helper'

describe Provider do
  
  before do
  	@provider = Provider.new(name:"Coursera")
  end

  subject { @provider }

  it { should respond_to(:name) }
  it { should be_valid }

end
