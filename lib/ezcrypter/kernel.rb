module Kernel
  
  # A helper method that calls Mack::Utils::Crypt::Keeper with the specified worker
  # and calls the encrypt method on that worker.
  def _ez_encrypt(value, worker = :default)
    EzCrypter::Keeper.instance.worker(worker).ez_encrypt(value)
  end
  
  # A helper method that calls Mack::Utils::Crypt::Keeper with the specified worker
  # and calls the decrypt method on that worker.
  def _ez_decrypt(value, worker = :default)
    EzCrypter::Keeper.instance.worker(worker).ez_decrypt(value)
  end
  
end