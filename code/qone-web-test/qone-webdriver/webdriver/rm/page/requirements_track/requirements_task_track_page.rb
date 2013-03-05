require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module RequirementsTrack
        class RequirementsTaskTrackPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
           requirements_manage = @page_profiles['requirements_manage']
           requirements_track = @page_profiles['requirements_track']['requirements_track']
           requirements_task_track = @page_profiles['requirements_track']['requirements_task_track']
           menu_click requirements_manage
           menu_click_for_hide(requirements_track, requirements_task_track)
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#RequirementsTaskTrackPage
      end#RequirementsTrack
    end#Page
  end#Rm
end#WebDriver