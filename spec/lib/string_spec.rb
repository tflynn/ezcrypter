require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe String do
  
  describe "Encryption Engine" do
    
    it "should be able to encrypt/decrypt string" do
      raw_value = "hello world"
      encrypted_value = raw_value.ez_encrypt
      encrypted_value.should_not == raw_value
      raw_value.should == encrypted_value.ez_decrypt
    end

    it "should be able to encrypt64/decrypt64 string" do
      raw_value = "hello world"
      encrypted_value = raw_value.ez_encrypt64
      encrypted_value.should_not == raw_value
      raw_value.should == encrypted_value.ez_decrypt64
    end
    
  end
  
end