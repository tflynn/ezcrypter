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
      # Needs poor man's camelcase
      if key.is_a?(Symbol)
        key = key.to_s
        key[0,1] = key[0,1].upcase
      end
      worker = @crypt_workers_cache[key.to_sym]
      if worker.nil?
        worker_klass = key + "Worker"
        if EzCrypter.const_defined?(worker_klass)
          worker = nil
          worker = eval("worker = EzCrypter::#{worker_klass}.new(options)")
          # puts "worker class inst #{worker.class.name}"
        else
          worker = EzCrypter::DefaultWorker.new(options)
          # puts "worker class inst defaulted to #{worker.class.name}"
        end
        @crypt_workers_cache[key.to_sym] = worker
      end
      worker
    end
  
  end # Keeper
end # Crypt
