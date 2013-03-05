require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Cm
    module Page
      module ConfigItemBrowse
          class ConfigItemBrowsePage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction

          def to_this_page
            @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
            @cm_data = Helper::ReadProfiles.data :cm
            configuration_management = @cm_profiles['configuration_management']
            config_item_browse = @cm_profiles['config_item_browse']['config_item_browse']
            menu_click configuration_management
            menu_click config_item_browse
          end

          def top_title
            @driver[:css => '#content h2'].text
          end
          
          def software_control_library_tab_check
            software_control_library.click
            software_control_library.text
          end

          def software_product_library_tab_check
            software_product_library.click
            software_product_library.text
          end
          
          def click_change_view(linkname)
            change_view(linkname).click
          end
          def configuration_item_name(item_identification)
            item_name = @cm_data['config_item_browse']['configuration_item_name']
            str ="table[id='dataListTable_NFSDataList'] tr td[title='#{item_name}'] div div a"
            data_list.operate(item_identification,1,str,2)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title
          end 
          def product_item_name(item_identification)
            item_name = @cm_data['config_item_browse']['product_item_name']
            str ="table[id='dataListTable_NFSDataList'] tr td[title='#{item_name}'] div div a"
            data_list.operate(item_identification,1,str,2)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title
          end
          def control_library_storage_application(item_identification)
            data_list.operate(item_identification,1,:control_in,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end   
                    
          def change_request_operate(item_identification)   
            data_list.operate(item_identification,1,:change_apply,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end
  
          def control_library_database_application(item_identification)
            data_list.operate(item_identification,1,:control_out,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end
          
          def change_report_operate(item_identification)
            data_list.operate(item_identification,1,:change_report,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end
          
          def product_library_storage_application(item_identification)
            data_list.operate(item_identification,1,:product_in,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end 
          
          def product_library_database_application(item_identification)
            data_list.operate(item_identification,1,:product_out,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end
          
          def product_database_for_publication(item_identification)
            data_list.operate(item_identification,1,:product_release,7)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            cancel_button.click
            alert_ok
            switch_window first_handle
            page_title
          end
          private

          def software_control_library
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[0]
          end

          def software_product_library
            @driver.find_element(:class => 'dh_menu').find_elements(:tag_name => 'a')[1]
          end

          def change_view(linkname)
            @driver.find_element(:class => 'view-change-button-bar').find_element(:link =>linkname)
          end
          
          def data_list
            table_name = @driver.find_element(:id =>'dataListTable_NFSDataList')
            qone_data_list(table_name)
          end
          
          def close_button
            close_name = @cm_profiles['config_item_browse']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          
          def cancel_button
            cancel_name =  @cm_profiles['config_item_browse']['cancel']
            @driver.find_element(:css =>"input[value='#{cancel_name}']")
          end
          
          def submit_button
            #@driver.find_elemet(:id => 'onsubmit')
            submit_name =  @cm_profiles['config_item_browse']['submit']
            @driver.find_element(:css =>"input[value='#{submit_name}']")
          end
         end #ConfigItemBrowsePage
      end #ConfigItemBrowse
    end #  Page
  end # Cm
end  # WebDriver