class String
  
  def self.randomize_full_ascii(length = 10)
    unless defined?(String::RANDOM_STRING_SEED)
      chars = Array.new(255,nil)
      255.times do |char|
        chars[char] = (char + 1).chr
      end
      String.const_set('RANDOM_STRING_SEED',chars)
    end
    chars = String::RANDOM_STRING_SEED
    new_string = ""
    rand_limit = String::RANDOM_STRING_SEED.size - 1
    1.upto(length) { |i| new_string << chars[rand(rand_limit)] }
    return new_string
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