require 'spec_helper'

describe Person do
  before(:each) do
    @attr = { :name => 'Test Person' }
  end
  
  it "should create a new instance given valid attributes" do
    Person.create!(@attr)
  end
  
  it "should require a name" do
    no_name_person = Person.new(@attr.merge(:name => ""))
    no_name_person.should_not be_valid
  end
  
  it "should reject duplicate names" do
    Person.create!(@attr)
    person_with_duplicate_name = Person.new(@attr)
    person_with_duplicate_name.should_not be_valid
  end
end
