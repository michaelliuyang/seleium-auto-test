require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Sm
    module Page
      module SystemLogger
        class OtherLoggerPage  < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          
          def to_this_page
            sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            sm_menu_name = sm_profiles['system_manage']
            system_logger_menu_name = sm_profiles['system_logger']['system_logger']
            this_menu_name = sm_profiles['system_logger']['other_logger']
            menu_click sm_menu_name
            menu_click_for_hide system_logger_menu_name,this_menu_name
          end
          
          def top_title
            title_h2.text
          end

          def project_operate_log_button_click
            project_operate_log_download_button.click
          end

          def enum_data_operate_log_button_click
            enum_data_operate_log_download_button.click
          end

           def project_monitor_parameter_log_button_click
             project_monitor_parameter_log_button.click
           end

          def service_set_log_button_click
            service_set_log_button.click
          end

          def message_set_log_button_click
            message_set_log_button.click
          end

          def organization_set_log_button_click
            organization_set_log_button.click
          end

          def general_user_log_button_click
            general_user_log_button.click
          end

          def download_alert_pop_up?
            flag = false
              unless  alert==nil
                flag =true
                alert_cancel
              end
            flag
          end
          
          private 
          
          def title_h2
            @driver[:css=>'h2']
          end

          def project_operate_log_download_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=projinfo']"]
          end

          def enum_data_operate_log_download_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=enumdate']"]
          end

          def project_monitor_parameter_log_button
           @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=threshhold']"]
          end

          def service_set_log_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=serviceSet']"]
          end

          def message_set_log_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=messageSet']"]
          end

          def organization_set_log_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=organizationSet']"]
          end

          def general_user_log_button
            @driver[:xpath=>"//a[@href='operationLogDownloadAction.do?type=generalUser']"]
          end

        end # OtherLoggerPage
      end # SystemLogger
    end # Page
  end # Sm
end # WebDriver


