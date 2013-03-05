require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Prom
    module Page
      module FormCustom
        class FormsTemplatePage < Common::BasePage
          include Support::MenuAction

          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            process_manage = @prom_profiles['process_manage']
            forms_template = @prom_profiles['form_process_custom']['forms_template_for']
            menu_click process_manage
            show_menu_by_js 'spa_cf'
            menu_click forms_template
          end

          def top_title
            @driver.find_element(:id=> 'ext-gen23').text
          end
          
# because ext component element didn't write new modify delete function code



        end#FormsTemplatePage
      end#FormCustom
    end# Page
  end #Prom
end# WebDriver