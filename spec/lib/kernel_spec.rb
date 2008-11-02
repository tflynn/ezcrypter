require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Kernel do
  
  describe "Encryption Engine" do
    
    it "should be able to encrypt text using the reverse worker" do
      _ez_encrypt("hello world", :reverse).should == "dlrow olleh"
    end
  
    it "should be able to decrypt text using the reverse worker" do
      _ez_decrypt("dlrow olleh", :reverse).should == "hello world"
    end
    
  end
  
end