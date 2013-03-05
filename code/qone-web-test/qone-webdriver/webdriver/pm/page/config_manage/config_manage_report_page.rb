require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'selenium-webdriver'
require 'webdriver/support/component.rb'
require 'webdriver/support/driver_extension_action'


module WebDriver
  module Pm
    module Page
      module ConfigManage
        class ConfigManageReportPage  < Common::BasePage
          
          include Support::MenuAction
          include Support::SwitchAction
          include Support::Component
          include Support::DriverExtensionAction

         def to_this_page
           @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
           config_manage = @pm_profiles['config_manage']['config_manage']
           config_manage_report = @pm_profiles['config_manage']['config_manage_report']
           show_menu_by_js "pm_scmt"
           menu_click config_manage_report
         end

         def top_title
           @driver[:css => '#content h2'].text
         end

         def new_config_manage_report(report_name,report_start_time,report_end_time,date_of_report)
           new_config_report_button.click
           sleep 5
           current_handle = @driver.window_handle
           handles = @driver.window_handles
           switch_alert_window(handles, current_handle)
           add_config_report_text(report_name,report_start_time,report_end_time,date_of_report)
           sleep 5
           summit_button.click
           switch_window current_handle
         end

         def modify_config_manage_report(report_name_for_add,report_name_for_modify)
           data_list.operate(report_name_for_add,2,:edit,6)
           current_handle = @driver.window_handle
           handles = @driver.window_handles
           switch_alert_window(handles, current_handle)
           add_report_name.clear
           add_report_name.send_keys(report_name_for_modify)
           sleep 2
           summit_button.click
           switch_window current_handle
         end
         
         def look_config_manage_report(look_report_name)
           data_list.operate(look_report_name,2,:view,6)
           sleep 3
           current_handle = @driver.window_handle
           handles = @driver.window_handles
           switch_alert_window(handles, current_handle)
           look_report_page_title = top_title
           close_button.click
           switch_window current_handle
           look_report_page_title
         end
         
         def delete_config_manage_report(delete_report_name)
           data_list.operate(delete_report_name,2,:delete,6)
           sleep 3
           alert_ok
         end
         
         def find_report_name_by_name report_name
           data_list.data_exist?(report_name,2)   
         end
         
         
         private
         def data_list
           report_table = @driver.find_element(:id => 'dataListTable_NFSDataList')
           qone_data_list(report_table)
         end
         
         def new_config_report_button
           @driver.find_element(:id => 'yellowButton')
         end
         def add_config_report_text(report_name,report_start_time,report_end_time,date_of_report)
           add_report_name.send_keys(report_name)
           add_report_start_time.input_date(report_start_time)
           add_report_end_time.input_date(report_end_time)
           add_date_of_report.select_today
           a_summary_of_config_manage_task_perform.click
           a_summary_of_config_information.click
           a_summary_of_baseline_information.click 
           a_summary_of_config_change.click
           a_summary_of_baseline_create_situation.click
           a_summary_of_config_audit_situation.click
         end
         def add_report_name
           @driver.find_element(:name => 'reportName') 
         end
         def add_report_start_time
           qone_date(@driver,"id = 'startDate'")
         end
         def add_report_end_time
           qone_date(@driver,"id = 'endDate'")
         end
         def add_date_of_report
           qone_date(@driver,"id = 'reportDate'")
         end
         def a_summary_of_config_manage_task_perform
           @driver.find_element(:id =>'info_2').find_element(:id => 'yellowButton')
         end
         def a_summary_of_config_information
           @driver.find_element(:id =>'info_3').find_element(:id => 'yellowButton')
         end
         def a_summary_of_baseline_information
           @driver.find_element(:id =>'info_4').find_element(:id => 'yellowButton')
         end
         def a_summary_of_config_change
           @driver.find_element(:id =>'info_5').find_element(:id => 'yellowButton')
         end
         def a_summary_of_baseline_create_situation
           @driver.find_element(:id =>'info_6').find_element(:id => 'yellowButton') 
         end
         def a_summary_of_config_audit_situation
           @driver.find_element(:id =>'info_7').find_element(:id => 'yellowButton') 
         end
         def summit_button
           summit_name = @pm_profiles['config_manage']['submit']
           @driver.find_element(:css => "input[value = '#{summit_name}']")
         end
         def close_button
           close_name = @pm_profiles['config_manage']['close']
           @driver.find_element(:css => "input[value = '#{close_name}']")
         end
         

        end # ConfigManageReportPage
      end #ConfigManage
    end #Page
  end #Pm
end #WebDriver
