require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Rm
    module Page
      module ProductList
        class HistoryProductListPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :rm
           requirements_manage = @page_profiles['requirements_manage']
           product_list = @page_profiles['product_list']['product_list']
           history_product_list = @page_profiles['product_list']['history_product_list']
           menu_click requirements_manage
           menu_click_for_hide(product_list, history_product_list)
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end
        end#ProductListPage
      end#DocList
    end#Dm
  end#Page
end#WebDriver