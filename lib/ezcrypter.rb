require 'singleton'
require 'ezcrypto'

module EzCrypter
end

base = File.join(File.dirname(__FILE__), "ezcrypter")

Dir.glob(File.join(base, "**/*.rb")).each do |f|
  require f
end