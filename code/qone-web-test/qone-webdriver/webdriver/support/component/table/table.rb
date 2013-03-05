require 'webdriver/support/component/table/base_table'
require 'webdriver/support/component/table/table_row'

module WebDriver
  module Support
    module Component
      module Table
        class Table < BaseTable
        
          def initialize element
            super(element)
            __rows
          end
        
          def __rows
            @rows = @element.find_elements(:css => 'tr')
          end
  
          def rows
            all_rows = []   
            @rows.each { |r| rows << TableRow.new(r)}
            all_rows
          end
  
          def row_count
            @rows.size
          end
  
          def [](index)
            valid_index? index
            TableRow.new @rows[index]
          end
  
          def valid_index?(index)
            raise IncorrectdIndexError if index.to_i > row_count
          end
        
          private :__rows , :valid_index?
         
        end # Table
      end # Table
    end # Component
  end # Support
end # WebDriver