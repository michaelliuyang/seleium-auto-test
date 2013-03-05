require 'webdriver/support/component/table/table'
require 'webdriver/support/component/table/table_row'

# QoneDataList component
# author: liuyang
# last modify time: 2012-06-19

# You can use the 'operate' method to operate any row data
# All index from 0 start and the row is only include data row(td),not include title row(th),
#   column index only include displayed index,you don't think over the hide column index
# OperateType is include :view,:edit,:delete,it is the picture's name,
#       if picture name has changed,the symbol must change
#
# example:
#   data_list = QoneDataList.new(element,"style*='display:none'",:td)
#     method explain:
#       params:
#         element: table element
#         hide_css: td or th is hidden,the arg is css attribute selector to find these
#         hide_type: :all,:th:,:td,table's th or td ,and both of them is hidden
#
#   data_list.operate(value,value_col_index,operate_type,operate_col_index)
#     method explain:
#       params:
#         value: data's text
#         value_col_index: value's column index
#         operate_type: :view,:edit,:delete and so on , picture name.to_sym,delete.gif => :delete
#         operate_col_index: operate_column_index
#
#   data_list.data_exist?(value,value_col_index)
#     method explain:
#       params:
#         value: data's text
#         value_col_index: value's column index

module WebDriver
  module Support
    module Component
      class QoneDataList < Table::Table
        def initialize(element,hide_css,hide_type)
          super(element)
          @rows = rows
          @hide_css = hide_css
          @hide_type = hide_type
        end

        def row_count
          @rows.size
        end

        def col_count
          get_no_hides_th.size
        end

        def operate(value,value_col_index,operate_type,operate_col_index)
          valid_index? value_col_index
          valid_index? operate_col_index
          @rows.each do |row|
            table_cell = Table::TableCell.new get_no_hides_td_in_row(row)[value_col_index]
            if table_cell.text == value
              operate_cell = Table::TableCell.new(get_no_hides_td_in_row(row)[operate_col_index])
              if operate_type.is_a? Symbol
                operate_cell.find_element(:css=>"img[src*='#{operate_type.to_s}']").click
              else
                operate_cell.find_element(:css=> operate_type).click
              end
            end
          end
        end

        def data_exist?(value,value_col_index)
          valid_index? value_col_index
          flag = false
          @rows.each do |row|
            table_cell = Table::TableCell.new get_no_hides_td_in_row(row)[value_col_index]
            if table_cell.text == value
            flag = true
            break
            end
          end
          flag
        end

        private

        def valid_index?(index)
          raise IncorrectdIndexError if((index.to_i > col_count - 1) || (index.to_i < 0))
        end

        def rows
          @rows = @element.all(:css=>"tbody tr")
        end

        def get_no_hides_td_in_row(row)
          ths = row.all(:css=>"td")
          if(@hide_css && (@hide_type == :td || @hide_type == :all))
          hide_ths = row.all(:css=>"td[#{@hide_css}]")
          ths = remove_hides ths,hide_ths
          end
          ths
        end

        def get_no_hides_th
          ths = @element.all(:css=>"thead tr th")
          ths = row.all(:css=>"thead tr td") if ths.empty?
          if(@hide_css && (@hide_type == :th || @hide_type == :all))
          hide_ths = @element.all(:css=>"thead tr th[#{@hide_css}]")
          hide_ths = @element.all(:css=>"thead tr td[#{@hide_css}]") if hide_ths.empty?
          ths = remove_hides ths,hide_ths
          end
          ths
        end

        def remove_hides(old,remove)
          remove.each do |t|
            old.delete t
          end
          old
        end

      end
    end
  end
end