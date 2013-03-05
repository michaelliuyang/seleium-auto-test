require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/component'

module WebDriver
  module Wkb
    module Page
      module WorkOrder
        class MyOrderPage < Common::BasePage
          include Support::MenuAction
          include Support::Component

          def top_title
            @driver[:css => '#content h2'].text
          end

          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            work_order = @wkb_profiles['work_order']['work_order']
            my_order = @wkb_profiles['work_order']['my_order']
            menu_click work_bench
            menu_click_for_hide work_order, my_order
          end

          def my_order_table
            my_order_table = @driver.find_element(:id => 'dataListTable_NFSDataList')
            table my_order_table
          end
          def order_title
            my_order_table[1][1].text
          end

        end #MyOrderPage
      end # WorkOrder
    end #Page
  end # Wkb
end #WebDriver