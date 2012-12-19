require 'ostruct'

module CoreExtensions
  module Array

    def rand
      self[Kernel.rand(length)]
    end

    def ostructify 
      collect { |i| (i.is_a?(Hash) || i.is_a?(Array)) ? i.ostructify : i }
    end

  end
end

Array.send :include, CoreExtensions::Array
