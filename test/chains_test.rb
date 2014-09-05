require 'test_helper'

describe 'chains' do
  describe 'with included chains' do
    it 'returns the object from with' do
      result = DummyObject.new.with(-> {
        add(1)
      })
      result.number.must_equal(1)
    end
    
    it 'returns the result from chain' do
      result = DummyObject.new.chain(-> {
        add(1)
        add(2)
      })
      result.must_equal(3)
    end
    
    it 'can use with within method' do
      obj = DummyObject.new
      obj.do_with.number.must_equal(4)
    end
    
    it 'can use chain within method' do
      obj = DummyObject.new
      obj.do_chained.must_equal(4)
    end
  end
  
  describe 'with required Chains' do
    it 'can with any object' do
      obj = DummyObject.new
      result = Chains::with(obj, -> {
        add(1)
      })
      result.number.must_equal(1)
    end
    
    it 'can chain any object' do
      obj = DummyObject.new
      result = Chains::chain(obj, -> {
        add(2)
      })
      result.must_equal(2)
    end
  end
end

class DummyObject
  include Chains
  attr_accessor :number
  
  def initialize
    @number = 0
  end
  
  def add(num)
    @number += num
  end
  
  def do_chained
    chain(-> {
      add(4)
    })
  end
  
  def do_with
    with(-> {
      add(4)
    })
  end
end