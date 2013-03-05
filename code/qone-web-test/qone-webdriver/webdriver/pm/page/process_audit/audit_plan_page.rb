require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProcessAudit
          class AuditPlanPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            @pm_data = Helper::ReadProfiles.data :pm
            process_audit = @pm_profiles['process_audit']['process_audit']
            audit_plan = @pm_profiles['process_audit']['audit_plan']
            menu_click_for_hide(process_audit,audit_plan)
            #show_menu_by_js "audit_plan"
            #menu_click audit_plan
          end
          
          def top_title
            @driver[:css=>'#content h2'].text
          end
          
          def process_audit_report(plan_name)
            report_name = @pm_data['process_audit']['process_audit_report_for_find']
            str ="table[id='dataListTable_NFSDataList'] tr td[title='#{report_name}'] div div a"
            data_list = qone_data_list(table_name)
            data_list.operate(plan_name,2,str,5)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            #page_title = top_title
            close_button.click
            switch_window first_handle
            #page_title
          end
          def modify_of_process_audit_plan(plan_name)
            data_list = qone_data_list(table_name)
            data_list.operate(plan_name,2,:edit,6)
            first_handle =@driver.window_handle
            handles = @driver.window_handles
            switch_alert_window handles,first_handle
            sleep 3
            #page_title = top_title
            close_button.click
            switch_window first_handle
            #page_title
          end
          def delete_of_process_audit_plan(plan_name)
            data_list = qone_data_list(table_name)
            data_list.operate(plan_name,2,:delete,6)
            alert_cancel
            sleep 3
          end
         
         
         
          private
          def table_name
              @driver.find_element(:id => 'dataListTable_NFSDataList')
          end
          def close_button
            close_name = @pm_profiles['process_audit']['close']
            @driver.find_element(:css =>"input[value='#{close_name}']")
          end
          def check_the_checklist_button
            button_name = @pm_profiles['process_audit']['check_the_checklist']
            @driver.find_element(:link => button_name)
          end
          def see_the_list_of_nci_button
            button_name = @pm_profiles['process_audit']['see_the_list_of_nci']
            @driver.find_element(:link => button_name)
          end
          end #AuditPlanPage
      end #ProcessAudit
    end #  Page
  end # Pm
end  # WebDriver