#Before run this spec file,please ensure there is a user having authority for doc manage menu and its children menu.
#require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Dm
    module Page
      module DocStatisticsReport
        class DocStatisticsReportPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :dm
           doc_manage = @page_profiles['doc_manage']
           doc_statistics_report = @page_profiles['doc_statistics_report']
           menu_click doc_manage
           menu_click doc_statistics_report
         end


        end#DocStatisticReportPage
      end#DocStatisticReport
    end#Dm
  end#Page
end#WebDriver