require 'webdriver/support/component/table/base_table'
require 'webdriver/support/component/table/table_cell'

module WebDriver
  module Support
    module Component
      module Table
        class TableRow < BaseTable
        
          def initialize element
            super(element)
            __cells
          end
        
          def __cells 
            @cells = @element.find_elements(:tag_name => 'td') 
            @cells = @element.find_elements(:tag_name => 'th') if @cells.empty?
          end
        
          def cells
            all_cells = []
            @cells.each {|c| all_cells << TableCell.new(c)} 
          end
  
          def cell_count
            @cells.size
          end
  
          def [](index)
            valid_index? index
            TableCell.new @cells[index]
          end
        
          def valid_index?(index)
            raise IncorrectdIndexError if index.to_i > cell_count
          end
        
          private :__cells , :valid_index?
        
        end # TableRow
      end # Table
    end # Component
  end # Support
end # WebDriver