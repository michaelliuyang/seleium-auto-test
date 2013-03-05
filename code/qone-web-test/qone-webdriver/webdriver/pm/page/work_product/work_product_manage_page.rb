require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component.rb'
require 'webdriver/support/switch_action.rb'
require 'webdriver/support/driver_extension_action'

module WebDriver
  module Pm
    module Page
      module WorkProduct
          class WorkProductManagePage < Common::BasePage
          include Support::Component
          include Support::MenuAction
          include Support::SwitchAction
          include Support::DriverExtensionAction
          def to_this_page
            @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
            work_product_manage = @pm_profiles['work_product']['work_product_manage']
            show_menu_by_js "pm_workproduct"
            menu_click work_product_manage
          end

          def top_title
            @driver[:css=>'#content h2'].text
          end
          def add_floder_test
             mouse_right_click(root_node)
             add_floder.click
          end
          
          private
          def root_node
            @driver.find_element(:class=>'x-tree-node-anchor').find_element(:id=>'extdd-3')
          end
          def add_floder
            @driver.find_element(:id=>'ext-gen597')
          end
          end #WorkProductManagePage
      end #WorkProduct
    end #  Page
  end # Pm
end  # WebDriver