require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'

module WebDriver
  module Mea
    module Page
      module DataCenter
        class DataCenterPage < Common::BasePage
          include Support::MenuAction
          include Support::SwitchAction

          def to_this_page
            @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
            measure_analysis = @mea_profiles['measure_analysis']
            data_center = @mea_profiles['data_center']['data_center']
            menu_click measure_analysis
            menu_click data_center
          end

          def top_title
            @driver[:css=> 'h2'].text
          end
          
          def new_view
            new_view_button.click
            new_view_top_title = top_title
          end
          
          private
          
          def new_view_button
            @driver[:css => '#myaddViewbutton_f']
          end
          
          def close_button
            
          end
          

        end #DataCenterPage
      end #DataCenter
    end #Page
  end #Ma
end #WebDriver