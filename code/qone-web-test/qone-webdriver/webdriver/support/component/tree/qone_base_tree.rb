require 'webdriver/support/driver_extension_action'

module WebDriver
  module Support
    module Component
      module Tree
        class QoneBaseTree
          include DriverExtensionAction
          
          def initialize(driver)
            element = driver[:id=>'mainDiv']
            raise NotVailidElementError unless element.is_a?(Selenium::WebDriver::Element)
            @driver = driver
            @element = element
            @select_type = select_type
            @del_list_name = nil
            @nodes = {}
            @profiles = Helper::ReadProfiles.apps_res_zh :global
          end
          
          def button_confirm
            confirm = @profiles['confirm']
            @element.find_element(:css=>"div#button_div input[type='button'][value='#{confirm}']")
          end
          
          def button_clear
            clear = @profiles['clear']
            @element.find_element(:css=>"div#button_div input[type='button'][value='#{clear}']")
          end
          
          def button_close
            close = @profiles['close']
            @element.find_element(:css=>"div#button_div input[type='button'][value='#{close}']")
          end
          
          def select_type
            url = @driver.current_url
            radio = url.match '&type=radio'
            check = url.match '&type=check'
            if radio
              type = 'radio'
            else
              type = 'checkbox'
            end
            type
          end
          
          def deselect_node_by_name(*node_names)
            raise "node_names size is zero" if node_names.size == 0
            options = @element.find_element(:id=>@del_list_name).all(:tag_name=>'option')
            node_names.each do |name|
              begin
                options.each do |option|
                  delete_option option,name
                end
              rescue
                next
              end
            end
          end
          
          private 
          
          def delete_option(option,name)
            if option['text'] == name
              option.click
              mouse_double_click(option)
            end
          end
          
        end # QoneBaseTree
      end # Tree
    end # Component
  end # Support
end # WebDriver