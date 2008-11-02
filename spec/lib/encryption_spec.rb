require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe EzCrypter do
  
  it "should be able to encrypt/decrypt using default worker" do
    EzCrypter::Keeper.instance.worker.is_a?(EzCrypter::DefaultWorker).should == true
    EzCrypter::Keeper.instance.worker(:unknown).is_a?(EzCrypter::DefaultWorker).should == true
    en = EzCrypter::Keeper.instance.worker.ez_encrypt("hello world")
    en.should_not == "hello world"
    EzCrypter::Keeper.instance.worker.ez_decrypt(en).should == "hello world"
  end
  
  it "should be able to encrypt/decrypt using other worker" do
    EzCrypter::Keeper.instance.worker(:reverse).is_a?(EzCrypter::ReverseWorker).should == true
    EzCrypter::Keeper.instance.worker(:reverse).ez_encrypt("hello world").should == "dlrow olleh"
    EzCrypter::Keeper.instance.worker(:reverse).ez_decrypt("dlrow olleh").should == "hello world"
  end
end
