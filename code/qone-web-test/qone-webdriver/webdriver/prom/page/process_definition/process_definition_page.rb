require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Prom
    module Page
      module ProcessDefinition
        class ProcessDefinitionPage < Common::BasePage

          include Support::MenuAction
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            process_manage = @prom_profiles['process_manage']
            process_definition = @prom_profiles['process_definition']['process_definition']
            menu_click process_manage
            @driver.mouse.move_to @driver[:link=> process_definition]
            process_definition_child_menu = @driver[:id=>'spa_osp'].find_elements(:tag_name=>'a')[1]
            process_definition_child_menu.click
            sleep 2
          end

          def top_title
            @driver[:css=> 'h2'].text.rstrip
          end

        end # ProcessDefinitionPage
      end # ProcessDefinition
    end #  Page
  end # Prom
end #WebDriver