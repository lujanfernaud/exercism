module Acronym
    def self.abbreviate (text)

        require 'pry'
        binding.pry
        
        text.upcase.scan(/([A-Z])[A-Z]*/).flatten.join('')
    end
end