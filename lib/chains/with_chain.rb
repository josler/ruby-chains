module Chains
  class WithChain
    class << self      
      def with_object(object, block)
        chain_object(object, block)
        object
      end
      
      def chain_object(object, block)
        object.send(:define_singleton_method, :chain_with_block, block)
        result = object.chain_with_block
        object.singleton_class.send(:undef_method, :chain_with_block)
        result
      end
    end
  end
end