require 'chains/version'
require 'chains/with_chain'

module Chains
  def with(block)
    WithChain::with_object(self, block)
  end
  
  def chain(block)
    WithChain::chain_object(self, block)
  end
  
  class << self
    def with(object, block)
      WithChain::with_object(object, block)
    end
    
    def chain(object, block)
      WithChain::chain_object(object, block)
    end
  end
end
