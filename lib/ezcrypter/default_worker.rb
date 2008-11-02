module EzCrypter # :nodoc:
  # The default worker is one that is used when no other worker is specified or the 
  # specified worker does not exist. It uses the EzCrypto library and get's 
  # its secret key from configatron.default_secret_key
  class DefaultWorker
    
    def initialize(options = {})
      options = {:secret_key =>  String.randomize(40), :salt => '_salt_and_pepper'}.merge(options)
      @aes_key = EzCrypto::Key.with_password(options[:secret_key], options[:salt])
    end
    
    # Encrypts a string using the EzCrypto library and the secret key found in
    # configatron.default_secret_key
    def ez_encrypt(x)
      @aes_key.encrypt(x)
    end
    
    # Decrypts a string using the EzCrypto library and the secret key found in
    # configatron.default_secret_key
    def ez_decrypt(x)
      @aes_key.decrypt(x)
    end
    
  end # DefaultWorker
end # Crypt
