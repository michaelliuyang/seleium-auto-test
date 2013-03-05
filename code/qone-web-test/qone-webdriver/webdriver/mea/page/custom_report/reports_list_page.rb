require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Mea
    module Page
      module CustomReport
        class ProjectListPage < Common::BasePage
         
          include Support::MenuAction
          include Support::SwitchAction

          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            measure_analysis = @mea_profiles['measure_analysis']
            reports_list = @mea_profiles['custom_report']['reports_list']
            menu_click measure_analysis
            show_menu_by_js 'mt_rp'
            menu_click reports_list
          end
          
          def reports_list_top_title
            switch_to_iframe
            switch_to_left_frame
            reports_list_top_title = top_title
            switch_out_frame
            reports_list_top_title
          end
          
          def switch_to_iframe
            switch_to_frame iframe
          end
          
          def switch_to_left_frame
            switch_to_frame left_frame
          end
          
          def iframe
            @driver[:id => 'reportBodyFrame']
          end
          
          def left_frame
            @driver[:id => 'report_left']
          end

          def top_title
            @driver[:css=> '#content h2'].text
          end


        end #ReportsListPage
      end #CustomReport
    end #Page
  end #Ma
end #WebDriver