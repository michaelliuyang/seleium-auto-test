require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module ReviewManage
        class ProjectProblemPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           review_manage = @page_profiles['review_manage']['review_manage']
           project_problem = @page_profiles['review_manage']['project_problem']
           menu_click high_level_view
           #menu_click_for_hide review_manage,form_list
           show_menu_by_js("hl_eg")
           menu_click project_problem
           sleep 2
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#FormListPage
      end#ReviewManage
    end#Page
  end#Hl
end#WebDriver