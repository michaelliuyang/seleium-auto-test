require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/component.rb'

module WebDriver
  module Pm
    module Page
      module ProjectPlan
        class RelatedBaselinePage < Common::BasePage
           include Support::MenuAction
           include Support::SwitchAction
           include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_plan = @pm_profiles['project_plan']['project_plan']
            related_baseline = @pm_profiles['project_plan']['related_baseline']
            menu_click_for_hide project_plan,related_baseline
          end




        end#RelatedBaselinePage
      end#PojectPlan
    end #page
  end  #Pm

end #webdriver

