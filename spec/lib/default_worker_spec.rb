require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe "EzCrypter::DefaultWorker" do
  
  it 'should decrypt and encrypt consistently' do
    worker = EzCrypter::DefaultWorker.new
    unencrypted = "hello there, I'm now in the clear"
    encrypted_value = worker.ez_encrypt(unencrypted)
    decrypted_value = worker.ez_decrypt(encrypted_value)
    unencrypted.should == decrypted_value
  end
  
end