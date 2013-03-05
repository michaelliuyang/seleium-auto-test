require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module BaseDataSetting
        class BaselineChangeSettingPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
           requirements_manage = @page_profiles['requirements_manage']
           base_data_setting = @page_profiles['base_data_setting']['base_data_setting']
           baseline_change_setting = @page_profiles['base_data_setting']['baseline_change_setting']
           menu_click requirements_manage
           menu_click_for_hide(base_data_setting,baseline_change_setting)
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end

         def add_form_button
           add_form_button_name = @page_profiles['base_data_setting']['add_form_button_name']
           @driver[:link => add_form_button_name]
         end

         def add_form_title
           add_form_button.click
           current_handle = @driver.window_handle
           handles = @driver.window_handles
           switch_alert_window(handles,current_handle)
           add_form_title = top_title
           close_button.click
           switch_window current_handle
           add_form_title
         end

         def close_button
            close_button_name = @page_profiles['base_data_setting']['close_button_name']
            @driver[:xpath => "//input [@value = '#{close_button_name}']" ]
         end
        end#BaselineChangePage
      end#BaseDataSetting
    end#Page
  end#Rm
end#WebDriver