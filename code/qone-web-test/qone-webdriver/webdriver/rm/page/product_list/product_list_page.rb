require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module ProductList
        class ProductListPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          def to_this_page
            @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
            requirements_manage = @page_profiles['requirements_manage']
            product_list = @page_profiles['product_list']['product_list']
            product_list = @page_profiles['product_list']['product_list']
            menu_click requirements_manage
            menu_click_for_hide(product_list, product_list)
          end

          def top_title
            top_title = @driver[:css=>'#content h2'].text
          end

          def add_product_title
            add_product_button.click
            sleep 2
            add_product_title = top_title
            add_product_title
          end

          def authority_setting_title
            authority_setting_link.click
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            authority_setting_title = top_title
            sleep 2
            close_button.click
            switch_window current_handle
            authority_setting_title
          end

          def serial_number_manage_title
            serial_number_manage_link.click
            sleep 3
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            serial_number_manage_title = top_title
            sleep 2
            close_button.click
            switch_window current_handle
            serial_number_manage_title
          end

          def product_attribute_title
            add_product_button.click
            product_attribute_link.click
            sleep 3
            current_handle = @driver.window_handle
            handles = @driver.window_handles
            switch_alert_window(handles, current_handle)
            product_attribute_title = top_title
            sleep 2
            close_button.click
            switch_window current_handle
            product_attribute_title
          end
          
          def add_product name
            add_product_button.click
            product_name_input name
            submit_button.click
            switch_window current_handle
          end
          
          def modify_product old_name,new_name
            table = table product_list_table
            name_col = 0
            row = find_target_row table,old_name,name_col
            if row
              modify_button(table,row).click
              current_handle = @driver.window_handle
              handles = @driver.window_handles
              switch_alert_window(handles, current_handle)
              product_name_input new_name
              submit_button.click
              switch_window current_handle
            else
              puts"can't find target row"
            end
          end
          
          def del_product name
            table = table product_list_table
            name_col = 0
            row = find_tatget_row table,name_col
            if row
              del_button(table,row).click
              alert_ok
            else
              puts"can't find target row"
            end
          end
          
          def product_name_exsit? name
            name_col = 0
            table = table product_list_table
            find_keyword_in_table talble,name,name_col
          end

          private

          def product_list_table
            @driver[:id => 'rmgrid']
          end

          def product_name_input name
            @driver[:id => 'productName'].clear
            @driver[:id => 'productName'].send_keys name
          end

          def add_product_button
            add_product_button_name = @page_profiles['product_list']['add_product']
            @driver.find_element(:link => "#{add_product_button_name}")
          end

          def return_button
            @driver[:id => 'Scenter']
          end

          def submit_button
            @driver[:id => 'submit']
          end

          def close_button
            close_button_name =  @page_profiles['product_list']['close_button_name']
            @driver[:css => "#Sbutton [value = #{close_button_name}]"]
          end

          def look_button table,row
            look_button_name = @page_profiles['product_list']['look_button_name']
            table[row][:css => "input[value = '#{look_button_name}']"]
          end

          def modify_button table,row
            modify_button_name = @page_profiles['product_list']['modify_button_name']
            table[row][:css => "input[value = '#{modify_button_name}']"]
          end

          def del_button table,row
            del_button_name = @page_profiles['product_list']['del_button_name']
            table[row][:css => "input[value = '#{del_button_name}']"]
          end

          def status_report_button
            status_report_button_name = @page_profiles['product_list']['status_report_button_name']
            table[row][:css => "input[value = '#{status_report_button_name}']"]
          end

          def authority_setting_link
            authority_setting_link = @page_profiles['product_list']['authority_setting']
            @driver[:link => authority_setting_link]
          end

          def serial_number_manage_link
            serial_number_manage = @page_profiles['product_list']['serial_number_manage']
            @driver[:link => serial_number_manage]
          end

          def product_attribute_link
            product_attribute = @page_profiles['product_list']['product_attribute']
            @driver[:link => product_attribute]
          end

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

        end#ProductListPage
      end#ProductList
    end#Rm
  end#Page
end#WebDriver