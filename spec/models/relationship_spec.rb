require 'spec_helper'

describe Relationship do

  let(:student) { FactoryGirl.create(:user) }
  let(:course) { FactoryGirl.create(:course) }
  let(:relationship) { student.relationships.build(course_id: course.id) }

  subject { relationship }

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to student_id" do
      expect do
        Relationship.new(student_id: student.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "student methods" do
  	it { should respond_to(:student) }
  	it { should respond_to(:course) }
  	its(:student) { should == student }
  	its(:course) { should == course }
  end

  describe "when course id is not present" do
    before { relationship.course_id = nil }
    it { should_not be_valid }
  end

  describe "when student id is not present" do
    before { relationship.student_id = nil }
    it { should_not be_valid }
  end

end