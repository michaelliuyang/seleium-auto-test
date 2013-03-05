require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Mea
    module Page
      module MeasurementSet
        class MeasureIndexPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            measure_analysis = @mea_profiles['measure_analysis']
            measure_index = @mea_profiles['measure_setup']['measure_index']
            menu_click measure_analysis
            show_menu_by_js 'mt_em'
            menu_click measure_index
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          private
          
          def select_index_system
            span_arr = @driver.all(:css => "table.noHoverTable tbody tr td table tbody tr td form div span.dojoTreeNodeLabel span.dojoTreeNodeLabelTitle")
          end

          def treelike_form
            @driver[:css => 'indexTreeView']
          end

          def add_sub_index_button
            sub_button = @driver.find_element(:css => 'table.noHoverTable tbody tr td table tbody tr td')
            sub_button.find_elements(:tag_name => 'input')[0]
          end
          
          

        end #MeasurementSetPage
      end #MeasurementSet
    end #Page
  end #Ma
end #WebDriver