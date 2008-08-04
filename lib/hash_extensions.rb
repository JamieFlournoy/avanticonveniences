class Hash
    unless Hash.new.respond_to? :rekey
        # Return a copy of this Hash where each key is result of calling the block with each key as the argument.
        def rekey(&block)
            rekeyed = {}
            keys.each{|k| rekeyed[yield(k)] = self[k] }
            rekeyed
        end
    end
end
