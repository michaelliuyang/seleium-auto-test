module WebDriver
  module Support
    module Component
      module Table
        class BaseTable
        
          attr_reader :element
        
          def initialize element
            raise NotValidElementError unless element.is_a?(Selenium::WebDriver::Element)
            @element = element 
          end
        
          def method_missing(m, *params, &blk)
            @element.send(m, *params) if @element.respond_to?(m)
          end
        
        end # BaseTable
      end # Table
    end # Component
  end # Support
end # WebDriver