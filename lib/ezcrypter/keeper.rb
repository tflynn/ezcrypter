module EzCrypter
  # A singleton class that holds/manages all the workers for the system.
  # 
  # A worker must be defined as EzCrypter::<name>Worker and must
  # define an ez_encrypt(value) method and a ez_decrypt(value) method.
  # 
  # Example:
  #  class EzCrypter::ReverseWorker
  #    def ez_encrypt(x)
  #      x.reverse
  #    end
  #
  #    def ez_decrypt(x)
  #      x.reverse
  #    end
  #  end
  class Keeper
    include Singleton
  
    def initialize
      @crypt_workers_cache = {}
    end
    
    # Returns a worker object to handle the encrytion/decryption.
    # If the specified worker doesn't exist then EzCrypter::DefaultWorker
    # is returned.
    def worker(key = :default, options = {})
      worker = @crypt_workers_cache[key.to_sym]
      if worker.nil?
        # Needs poor man's camelcase
        worker_klass = key.to_s.capitalize + "Worker"
        if EzCrypter.const_defined?(worker_klass)
          # cheat
          #worker = "EzCrypter::#{worker_klass}".constantize.new(options)
          worker = nil
          worker = eval("worker = EzCrypter::#{worker_klass}.new(options)")
        else
          worker = EzCrypter::DefaultWorker.new(options)
        end
        @crypt_workers_cache[key.to_sym] = worker
      end
      worker
    end
  
  end # Keeper
end # Crypt
