require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module ReviewManage
        class DepartmentReportPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           review_manage = @page_profiles['review_manage']['review_manage']
           department_report = @page_profiles['review_manage']['department_report']
           menu_click high_level_view
           #menu_click_for_hide review_manage,project_report
           show_menu_by_js("hl_eg")
           menu_click department_report
           sleep 2
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end

         def department_report_setting
           department_report_setting = @page_profiles['review_manage']['department_report_setting']
           @driver[:link => department_report_setting]
         end

         def sub_department_report
           sub_department_report = @page_profiles['review_manage']['sub_department_report']
           @driver[:link => sub_department_report]
         end

         def self_department_progress_report
           self_department_progress_report = @page_profiles['review_manage']['self_department_progress_report']
           @driver[:link => self_department_progress_report]
         end

         def department_report_setting_title
           department_report_setting.click
           handles = @driver.window_handles
           current_handle = @driver.window_handle
           switch_alert_window handles,current_handle
           department_report_setting_title = top_title
           close_button.click
           switch_window current_handle
           department_report_setting_title
         end

         def close_button
           close_button_name = @page_profiles['review_manage']['close_button_name']
           @driver[:xpath => "//input [@value = '#{close_button_name}']"]
         end
        end#DepartmentReportPage
      end#ReviewManage
    end#Page
  end#Hl
end#WebDriver