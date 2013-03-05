require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module ProcessAudit
          class NciCountPage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction


          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            process_audit = @pm_profiles['process_audit']['process_audit']
            nci_count = @pm_profiles['process_audit']['nci_count']
            #menu_click_for_hide(process_audit,nci_count)
            show_menu_by_js "pm_audit"
            menu_click nci_count
          end
          def top_title
            @driver[:css=>'#content h2'].text
          end

            end #NciCountPage
      end #ProcessAudit
    end #  Page
  end # Pm
end  # WebDriver