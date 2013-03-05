require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Mea
    module Page
      module CustomReport
        class ReportPermissionPage < Common::BasePage 
          #ss limit of power
          include Support::MenuAction
          include Support::SwitchAction

          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            measure_analysis = @mea_profiles['measure_analysis']
            reports_permission_types = @mea_profiles['custom_report']['reports_permission_types']
            menu_click measure_analysis
            show_menu_by_js 'mt_rp'
            menu_click reports_permission_types
          end

          def top_title
            @driver[:css=> 'h2'].text
          end


        end #ReportsPermissionPage
      end #CustomReport
    end #Page
  end #Ma
end #WebDriver