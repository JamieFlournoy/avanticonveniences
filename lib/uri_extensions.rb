gem 'activesupport'
require 'active_support/core_ext/hash/indifferent_access'

require 'uri'
require File.dirname(__FILE__) + '/hash_extensions'

class URI::Generic
    def Generic.query_from_hash(q_hash)
        return '' if q_hash.nil?

        # Reveal cases where the caller thought they were using HashWithIndifferentAccess
        # but actually they used Hash and probably got duplicate keys (:foo vs 'foo')
        q_hash = q_hash.rekey{|k| k.is_a?(Symbol) ? ":#{k}" : k} unless q_hash.is_a?(HashWithIndifferentAccess)

        pairs = []
        q_hash.each_pair{|k,v| pairs << "#{k}=#{URI.escape(v.to_s)}" unless v.nil?}
        '?' + pairs.sort.join('&')
    end
end
