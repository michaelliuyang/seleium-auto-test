require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Pm
    module Page
      module ProjectEstimate
          class PersonalEstimateListPage < Common::BasePage
             include Support::MenuAction
             
               def to_this_page
                 @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
                 project_management = @pm_profiles['project_management']
                 project_estimate = @pm_profiles['project_estimate']['project_estimate']
                 personal_estimate_list = @pm_profiles['project_estimate']['personal_estimate_list']
                 menu_click project_management
                 show_menu_by_js "pm_es"
                 menu_click personal_estimate_list
                 #menu_click_for_hide project_estimate,personal_estimate_list
               end
               def top_title
                 @driver[:css=>'#content h2'].text
               end

            end #PersonalEstimateListPage
      end #ProjectEstimate
    end #  Page
  end # Pm
end  # WebDriver