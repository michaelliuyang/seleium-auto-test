require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Wkb
    module Page
      module MyView
        class MyViewPage < Common::BasePage
          include Support::MenuAction
          def to_this_page
            @wkb_profiles = Helper::ReadProfiles.apps_res_zh :wkb
            work_bench = @wkb_profiles['work_bench']
            my_view = @wkb_profiles['my_view']['my_view']
            menu_click work_bench
            menu_click my_view
          end

          def add_component
            config_component_button.click
            @driver[:xpath=>"//td/a/img"].click
            component_name = @driver[:css=>'.addTable p'].text
            back_to_my_view = @wkb_profiles['my_view']['back_to_my_view']
            @driver[:link=>back_to_my_view].click
            return component_name
          end

          def config_component_button
            @driver[:xpath=>"//div[4]/a/img"]
          end

          def component_number(component_name)
            component_num = 0
            @driver.find_elements(:css => 'li h3').select do |component|
              component_num = component_num + 1 if component.text == component_name
            end
            component_num
          end

          def first_component_name
            @driver[:css => 'li h3'].text
          end

          def remove_component
            @driver[:css => 'li .remove'].click
            alert = @driver.switch_to.alert
            alert.accept
          end

        end # MyViewPage

       end # MyView
      end # Page
    end # Wkb
 end # WebDriver
