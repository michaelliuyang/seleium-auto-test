require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Prom
    module Page
      module ProcessDefinition
        class StandardProcessPage < Common::BasePage

          include Support::MenuAction

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            process_manage = @prom_profiles['process_manage']
            process_defined = @prom_profiles['process_definition']['process_definition']
            standard_process = @prom_profiles['process_definition']['standard_process']
            menu_click process_manage
            show_menu_by_js 'spa_osp'
            menu_click standard_process
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

        end # StandardProcessPage
      end # ProcessDefinition
    end #  Page
  end # Prom
end #WebDriver