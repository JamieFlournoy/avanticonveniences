require 'rubygems'
gem 'activesupport'
require 'active_support/core_ext/hash/indifferent_access'

require 'uri'
require File.dirname(__FILE__) + '/hash_extensions'

class URI::Generic
    # Create a URI query string from a Hash. The keys in the returned query string
    # are sorted for easier testing.
    # Example: {:foo => 'bar', :biz => 'b a z'} -> '?biz=b%20a%20z&foo=bar'
    def self.query_from_hash(q_hash)
        return '' if q_hash.nil?

        # Reveal cases where the caller thought they were using HashWithIndifferentAccess
        # but actually they used Hash and probably got duplicate keys (:foo vs 'foo')
        q_hash = q_hash.rekey{|k| k.is_a?(Symbol) ? ":#{k}" : k} unless q_hash.is_a?(HashWithIndifferentAccess)

        pairs = []
        q_hash.each_pair{|k,v| pairs << "#{k}=#{URI.escape(v.to_s)}" unless v.nil?}
        '?' + pairs.sort.join('&')
    end
end
