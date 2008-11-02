require 'rubygems'
gem 'rspec'
require 'spec'
require File.join(File.dirname(__FILE__), "..", "lib", "ezcrypter")

module EzCrypter
  class ReverseWorker
    
    def initialize(options = {})
    end
    
    def ez_encrypt(x)
      x.reverse
    end
    
    def ez_decrypt(x)
      x.reverse
    end
    
  end
end
