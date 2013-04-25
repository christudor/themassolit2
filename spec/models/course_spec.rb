require 'spec_helper'

describe Course do
  
  before do
  	@course = Course.new(name:"The Iliad", category:"Literature", description: "Introduction to the Iliad")
  end

  subject { @course }

  it { should respond_to(:name) }
  it { should respond_to(:category) }
  it { should respond_to(:description) }
  it { should respond_to(:relationships) }

end
