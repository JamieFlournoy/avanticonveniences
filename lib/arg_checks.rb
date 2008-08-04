module ArgChecks
    # Require that all arguments be of the specified class, or one of its subclasses
    def arg_type(klass, *args)
        raise ArgumentError, "First argument must be a class. Got #{klass.to_s}" unless klass.is_a? Class
        args.each{|obj| raise ArgumentError, "Wrong type for argument (should be #{klass})" unless obj.is_a? klass }
    end
  
    # Require that all arguments be non-nil
    def arg_required(*args)
        args.each{|obj| raise ArgumentError, "Argument cannot be nil" if obj.nil? }
    end
    
    # Require that the second argument, be non-nil. Upon failure the first argument is used in the error message.
    def named_arg_required(name, obj)
        named_arg_required('name', name) unless name.eql?('name')
        raise ArgumentError, "Argument \"#{name}\" cannot be nil" if obj.nil?
    end
    
    # Require that all values in the hash be non-nil. Returns the list of all keys whose values were nil.
    def named_args_required(obj_hash)
        keys_with_nil_values = obj_hash.select{|k,v| v.nil?}.collect{|e| e[0]}
        raise ArgumentError, "Nil argument not allowed in #{keys_with_nil_values.join(', ')}" unless keys_with_nil_values.empty?
    end
    
    # Require that all arguments be greater than or equal to max
    def arg_max(max, *args)
        args.each{|obj| raise ArgumentError, "Argument exceeds maxmimum value (max is #{max.to_s})" unless max >= obj}
    end
    
    # Require that all arguments be less than or equal to min
    def arg_min(min, *args)
        args.each{|obj| raise ArgumentError, "Argument is lower than minimum value (min is #{min.to_s})" unless min <= obj }
    end

    # Require that all arguments return a set of keys containing at least the specified elements
    def arg_hash_keys_required(required_keys, *args)
        args.each do |h|
            missing = required_keys - h.keys
            raise ArgumentError, "Hash is missing required keys (#{missing.join(', ')}). Got:\n#{h.inspect}" if missing.length > 0
        end
    end

    # Require that all arguments return a set of keys containing exactly the specified elements
    def arg_hash_keys_exact(exact_keys, *args)
        args.each do |h|
            missing = exact_keys - h.keys
            extra = h.keys - exact_keys
            raise ArgumentError, "Hash keys don't match required set (#{exact_keys.join(', ')}). " +
                "Missing required keys (#{missing.join(', ')}); extra keys not allowed (#{extra.join(', ')}).\n" +
                "Got:\n#{h.inspect}" if (missing.length > 0) || (extra.length >0)
        end
    end

    # Require that all arguments return a set of keys containing a set of required keys, zero or more of the optional keys, and nothing else
    def arg_hash_keys_limit(required_keys, optional_keys, *args)
        args.each do |h|
          missing = required_keys - h.keys
          extra = h.keys - required_keys - optional_keys
      
          unless missing.empty? && extra.empty?
              msg = ""
              msg << "Hash is missing required keys (#{missing.join(', ')}).\n" unless missing.empty?
              msg << "Hash has extra keys which aren't allowed (#{extra.join(', ')}).\n" unless extra.empty?
              msg << " Got: #{h.inspect}"
              raise ArgumentError, msg
          end
        end
    end
end
