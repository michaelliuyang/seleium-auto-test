require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module BaseDataSetting
        class AttributeSettingPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
           requirements_manage = @page_profiles['requirements_manage']
           base_data_setting = @page_profiles['base_data_setting']['base_data_setting']
           attribute_setting = @page_profiles['base_data_setting']['attribute_setting']
           menu_click requirements_manage
           menu_click_for_hide(base_data_setting,attribute_setting)
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#HistoryBaselineListPage
      end#BaselineManage
    end#Page
  end#Rm
end#WebDriver