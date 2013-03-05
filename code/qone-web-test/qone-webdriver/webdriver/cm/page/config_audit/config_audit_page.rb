require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Cm
    module Page
      module ConfigAudit
          class ConfigAuditPage < Common::BasePage
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
            config_audit =  @cm_profiles['config_audit']['config_audit']
            menu_click configuration_management
            menu_click config_audit
          end

          def pending_page
            pending.click
            pending.text
          end
          
          def approved_page
            approved.click
            approved.text
          end
          
          def new_audit_report_page_import_check_list_click(audit_products,audit_conclusion)
            click_new_button.click
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            audit_products_text.send_keys(audit_products)
            audit_conclusion_text.send_keys(audit_conclusion)
            title = top_title
            sleep 3
            submit_button.click
            switch_window first_handle
            title
          end
          
            # def new_audit_report_page_import_check_list_click
            # approved.click
            # click_new_button.click
            # first_handle =@driver.window_handle
            # handles = @driver.window_handles
            # second_handle = switch_alert_window handles,first_handle
            # switch_to_frame check_list_frame
            # import_check_list_button.click
            # handles = @driver.window_handles
            # switch_three_window handles,first_handle,second_handle
            # frame_close_button
            # switch_window second_handle
            # title = top_title
            # close_button.click
            # switch_window first_handle
            # title
          # end
          def look_config_audit_report(serial_number)
            data_list.operate(serial_number,0,:view,6)
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

          def pending
            @driver.find_element(:class =>'divLeft').find_element(:id => 'already')
          end
          def approved
            @driver.find_element(:class =>'divLeft').find_element(:id => 'await')
          end
          def audit_products_text
            @driver.find_element(:css=> "table[class ='addTable'] tr td textarea[id='auditProduct']")
          end
          def audit_conclusion_text
            @driver.find_element(:css=> "table[class ='addTable'] tr td textarea[id='auditResult']")
          end
          def click_new_button
            @driver.find_element(:id=> 'yellowButton')
          end
          def import_check_list_button
            import_check_list = @cm_profiles['config_audit']['new_audit_report_import_check_list']
            @driver.find_element(:link => import_check_list )
          end
          def data_list
            table_name = @driver.find_element(:id =>'dataListTable_NFSDataList')
            qone_data_list(table_name)
          end
          def close_button
            close_name = @cm_profiles['config_audit']['close']
            @driver[:css => "input[value = #{close_name}]"]
          end
          def submit_button
            submit_name = @cm_profiles['config_audit']['submit']
            @driver[:css => "input[value = #{submit_name}]"]
          end
          def check_list_frame
            @driver.find_element(:name=>'checklistFrame')
          end
          def frame_close_button
            frame_close_button=@driver.find_element(:name=>'left')
            switch_to_frame frame_close_button
            close_button.click
          end
          def switch_three_window(handles, first_handle, second_handle)
            handles.each do |handle|
              unless handle == first_handle &&handle == second_handle
              @driver.switch_to.window(handle)
              end # unless
            end #  do
          end
         end #ConfigAuditPage
      end #ConfigAudit
    end #  Page
  end # Cm
end  # WebDriver