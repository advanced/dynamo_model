require 'spec_helper'

#describe DynamoModel::Properties do
  #class Tweet
    #include DynamoModel::Properties
    
    #property :content, String
    #property :posted_at, DateTime, :default => DateTime.now
  #end

  #describe ".property" do
    #let(:tweet) { Tweet.new }

    #it "should create a getter with the name provided to property call" do
      #tweet.should respond_to(:content)
    #end

    #it "should create a setter for the given property name" do
      #tweet.should respond_to(:content=)
    #end

    #it "should return the default value if a normal value has not been set" do
      #tweet.posted_at.to_date.should == DateTime.today.to_date
    #end
    
  #end
  
#end


describe DynamoModel::Property do
  
  subject { DynamoModel::Property }

  describe "#initialize" do
    it "should raise an Error if you try and save an incompatible type" do
      lambda { subject.new("FooBar", DateTime.now) }.should raise_error
    end 

    it "should not raise an error if a custom conversion proc is passed in" do
      lambda { 
        subject.new("Foobar", Date.today, :conversion => proc { |v| v.to_s })
      }.should_not raise_error
    end 

    it "should store the value and not raise an error if type is valid" do
      lambda { subject.new("FooBar", 1.0) }.should_not raise_error(/Invalid Dynamo Type/)
    end

    it "should store the custom encoded value" do
      prop = subject.new("Foobar", Date.today, :conversion => proc { |v| v.to_s })
      prop.value.should == Date.today.to_s
    end
  end

  describe "#value=" do
    subject { 
      DynamoModel::Property.new("FooBar", 1.0, :conversion => proc { |v| v.to_s }) 
    }

    it "should call custom conversion function on the new value" do
      subject.value = Date.today
      subject.value.should == Date.today.to_s
    end 

    it "should raise 'Invalid Dynamo Type' if new value is invalid dynamo type" do
      prop = DynamoModel::Property.new("FooBar", 1.0) 
      lambda { prop.value = Date.today }.should raise_error(/Invalid Dynamo Type/)
    end 
    
  end
end