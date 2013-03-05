require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Cm
    module Page
      module ConfigProcessList
          class ConfigProcessListPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @cm_profiles = Helper::ReadProfiles.apps_res_zh :cm
            configuration_management =  @cm_profiles['configuration_management']
            config_process_list =  @cm_profiles['config_process_list']['config_process_list']
            menu_click configuration_management
            menu_click config_process_list
          end
          
          def processing_page
            processing.click
            processing.text
          end
          
          def processed_page
            processed.click
            processed.text
          end
             
          def check_the_application_form(item_identification)
            data_list.operate(item_identification,0,:view,6)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            page_title = top_title
            close_button.click
            switch_window first_handle
            page_title
          end   

          private

          def processing
            @driver.find_element(:class =>'divLeft').find_element(:id => 'ongoing')
          end

          def processed
            @driver.find_element(:class =>'divLeft').find_element(:id => 'already')
          end

          def data_list
            table_name = @driver.find_element(:id =>'dataListTable_NFSDataList')
            qone_data_list(table_name)
          end
          
          def close_button
            close_name = @cm_profiles['config_process_list']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          
        end #ConfigProcessListPage
      end #ConfigProcessList
    end #  Page
  end # Cm
end  # WebDriver