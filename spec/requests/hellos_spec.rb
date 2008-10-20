require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a hello exists" do
  request(resource(:hellos), :method => "POST", 
    :params => { :hello => {  }})
end

describe "resource(:hellos)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:hellos))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of speakers" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a hello exists" do
    before(:each) do
      @response = request(resource(:hellos))
    end
    
    it "has a list of hellos" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      @response = request(resource(:hellos), :method => "POST", 
        :params => { :hello => {  }})
    end
    
    it "redirects to resource(:hellos)" do
      @response.should redirect_to(resource(Hello.first), :message => {:notice => "hello was successfully created"})
    end
    
  end
end

