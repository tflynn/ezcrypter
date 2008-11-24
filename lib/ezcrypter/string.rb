class String
  
  def self.randomize(length = 10)
    chars = ("A".."H").to_a + ("J".."N").to_a + ("P".."T").to_a + ("W".."Z").to_a + ("3".."9").to_a
    newpass = ""
    1.upto(length) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass.upcase
  end
  
  # Maps to Kernel _ez_encrypt
  # 
  # Examples:
  #   "Hello World".ez_encrypt
  #   "Hello World".ez_encrypt(:my_crypt)
  def ez_encrypt(worker = :default)
    _ez_encrypt(self, worker)
  end
  
  # Maps to Kernel _ez_decrypt
  # 
  # Examples:
  #   some_encrypted_string.ez_decrypt
  #   some_encrypted_string.ez_ecrypt(:my_crypt)
  def ez_decrypt(worker = :default)
    _ez_decrypt(self, worker)
  end

  # Maps to Kernel _ez_encrypt64
  # 
  # Examples:
  #   "Hello World".ez_encrypt
  #   "Hello World".ez_encrypt(:my_crypt)
  def ez_encrypt64(worker = :default)
    _ez_encrypt64(self, worker)
  end
  
  # Maps to Kernel _ez_decrypt64
  # 
  # Examples:
  #   some_encrypted_string.ez_decrypt
  #   some_encrypted_string.ez_ecrypt(:my_crypt)
  def ez_decrypt64(worker = :default)
    _ez_decrypt64(self, worker)
  end
  
end