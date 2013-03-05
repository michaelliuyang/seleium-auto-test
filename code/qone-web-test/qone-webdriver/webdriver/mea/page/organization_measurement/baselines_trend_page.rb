require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Mea
    module Page
      module OrganizationMeasurement
        class BaselinesTrendPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction
          
          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            @mea_data = Helper::ReadProfiles.data :mea
            measure_analysis = @mea_profiles['measure_analysis']
            baselines_trend = @mea_profiles['organization_measure']['baselines_evolution_trend']
            menu_click measure_analysis
            sleep 1
            show_menu_by_js 'mt_pcb'
            sleep 1
            menu_click baselines_trend
          end
          
        end
      end
    end
  end
end