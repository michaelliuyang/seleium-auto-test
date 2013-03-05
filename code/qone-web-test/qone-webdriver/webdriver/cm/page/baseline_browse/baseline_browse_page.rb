require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Cm
    module Page
      module BaselineBrowse
          class BaselineBrowsePage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          
          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
            @cm_data = Helper::ReadProfiles.data :cm
            configuration_management =  @cm_profiles['configuration_management']
            baseline_browse =  @cm_profiles['baseline_browse']['baseline_browse']
            menu_click configuration_management
            menu_click baseline_browse
          end
          
          def click_change_view(linkname)
            change_view(linkname).click
            sleep 3
          end
          
          def baseline_name(baseline_identification)
            item_name = @cm_data['baseline_browse']['baseline_name']
            str ="table[id='dataListTable_NFSDataList'] tr td[title='#{item_name}'] div div a"
            data_list.operate(baseline_identification,1,str,2)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title  
          end
          
          def the_baseline_is_established_for(baseline_identification)
            data_list.operate(baseline_identification,1,:bl_create,7)
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
          
          def baseline_database_application(baseline_identification)
            data_list.operate(baseline_identification,1,:bl_out,7)
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

          def change_view(linkname)
            @driver.find_element(:class => 'view-change-button-bar').find_element(:link =>linkname)
          end
          def data_list
            table_name = @driver.find_element(:id =>'dataListTable_NFSDataList')
            qone_data_list(table_name)
          end
          
          def close_button
            close_name = @cm_profiles['baseline_browse']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          
          def cancel_button
            cancel_name =  @cm_profiles['baseline_browse']['cancel']
            @driver.find_element(:css =>"input[value='#{cancel_name}']")
          end
          
          def submit_button
            #@driver.find_elemet(:id => 'onsubmit')
            submit_name =  @cm_profiles['baseline_browse']['submit']
            @driver.find_element(:css =>"input[value='#{submit_name}']")
          end

            end #BaselineBrowsePage
      end #BaselineBrowse
    end #  Page
  end # Cm
end  # WebDriver