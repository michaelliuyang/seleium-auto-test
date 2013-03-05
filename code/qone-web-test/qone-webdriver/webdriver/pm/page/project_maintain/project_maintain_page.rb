require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
module WebDriver
  module Pm
    module Page
      module ProjectMaintain
        class ProjectMaintainPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            project_management = @pm_profiles['project_management']
            project_maintain = @pm_profiles['project_maintain']['project_maintain']
            menu_click project_management
            menu_click project_maintain
          end
          def project_approving_test
              # project_maintain_link.click
               project_approving_button.click
               sleep 2
               first_handle =@driver.window_handle
               handles = @driver.window_handles
               switch_alert_window handles, first_handle
               title = top_title
               close_button.click
               switch_window first_handle
               title
          end
          def expend_all_test
              expend_all_button.click
          end
          def all_away_test
              all_away_button.click
          end
          def project_name_link_test
               project_name_link.click
               sleep 1
               first_handle =@driver.window_handle
               handles = @driver.window_handles
               switch_alert_window handles, first_handle
               title = top_title
               close_button.click
               switch_window first_handle
               title
          end







          private

          def project_approving_button
               project_approving_name = @pm_profiles['project_maintain']['project_approving']
               @driver[:link => project_approving_name]
          end
          def expend_all_button
               expend_all_name = @pm_profiles['project_maintain']['expand_all']
               @driver[:link => expend_all_name]
          end
          def all_away_button
              all_away_name = @pm_profiles['project_maintain']['all_away']
              @driver[:link => all_away_name]
          end
          def project_name_link
              project_name=@pm_profiles['project_maintain']['project_name']
               @driver[:link => project_name]
          end
          def project_maintain_link
               project_maintain_name=@pm_profiles['project_maintain']['project_maintain']
               @driver[:link => project_maintain_name]
          end
          def close_button
               close_name=@pm_profiles['project_maintain']['close']
                @driver[:xpath => "//input[@value = '#{close_name}']"]
          end



        end #ProjectMaintainPage
      end #ProjectMaintain
    end #Page
  end # Pm
end #WebDriver