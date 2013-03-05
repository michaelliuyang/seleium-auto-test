require 'webdriver/support/component'
module WebDriver
  module Support
    module TableAction
      include Support::Component
      def find_target_row table,key,col
          num = table.row_count
          row = 0
          (1..num-2).each do |y|
            if table[y][col].text == key
              row =y
            end
          end
          row
      end

        def find_keyword_in_table table,key,col
           num = table.row_count
                result_flag = 0
                (1..num-2).each do |y|
                  if table[y][col].text == key
                    result_flag = 1
                  end
              end
          result_flag
        end

    end
  end
end
