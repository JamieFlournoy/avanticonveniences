class Hash
  # Call a block for every key in the Hash, and replace each key with the block's return value.
  # This returns a new Hash, so you do not need to call #rehash on it.
  def map_keys(&block)
    mapped = Hash.new
    self.to_a.map{|k,v| [yield(k), v] }.each{|k,v| mapped[k] = v}
    mapped
  end
  alias_method :rekey, :map_keys  unless Hash.new.respond_to? :rekey

  # Call a block for every value in the Hash, and replace each value with the block's return value.
  def map_values(&block)
    mapped = Hash.new
    self.to_a.map{|k,v| [k, yield(v)] }.each{|k,v| mapped[k] = v}
    mapped
  end
  alias_method :revalue, :map_keys unless Hash.new.respond_to? :revalue

  # Call a block for every (key, value) pair in the hash, passing them in as a 2-element Array.
  # The block should return a similar 2-element array of (key, value) which will be used to replace
  # the original key and value.
  def map_pairs(&block)
    mapped = Hash.new
    self.to_a.map{|k,v| yield(k,v) }.each{|k,v| mapped[k] = v}
    mapped
  end

end
