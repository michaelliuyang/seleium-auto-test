# QoneDate component
# author: liuyang
# last modify time: 2012-06-19

# You can use this component to select date
# example:
#   qone_date = QoneDate.new(driver,"id='startPublishDate_id'")
#   method explain:
#     The second arg is a css attribute selector for input,
#     so it must be a css attribute selector,for instance id='xx' or class='xx'
#   
#   qone_date.input_date('2012-06-15')
#   method explain:
#     The arg's format may be '2012-06-15' or '2012-6-1'

module WebDriver
  module Support
    module Component
      class QoneDate
        
        def initialize(driver, find_input_css)
          @driver = driver
          @element = @driver[:css=> "input[#{find_input_css}]"]
          @date_picker = @driver.find_element(:css => "input[#{find_input_css}]+img.datePicker")
        end

        def input_date date
          year, month, day = date.split(/\s*\-\s*/)
          time = Time.new(year, month, day)
          input_date = time.strftime("%Y-%m-%d")
          @element.clear
          @element.send_keys input_date
        end

        def select_today
          @date_picker.click
          @driver[:css=>"div[id='ui-datepicker-div'] div.ui-datepicker-buttonpane button.ui-datepicker-current"].click
        end

      end # QoneDate
    end # Component
  end # Support
end # WebDriver