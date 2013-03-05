require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'

module WebDriver
  module Prom
    module Page
      module DataStatistics
        class ProcessUsePage < Common::BasePage

          include Support::MenuAction
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            process_manage = @prom_profiles['process_manage']
            process_use_situation = @prom_profiles['process_data_statistics']['process_use_situation']
            menu_click process_manage
            show_menu_by_js("spa_ud")
            menu_click process_use_situation
          end

          def top_title
            @driver[:css=> 'h2'].text
          end

          def stability_tab_click
            stability_tab.click
            sleep 2
            stability_tab.text.rstrip
          end

          def chang_graph_big_or_small_button_click
            chang_graph_button.click
            width.clear
            width.send_keys 700
            high.clear
            high.send_keys 200
            submit_button.click
          end

          def extend_all_click
            @driver[:css => '#ext-gen13'].click
          end

          def compliance_tab_click
            compliance_tab.click
            sleep 2
            compliance_tab.text.rstrip
          end

          def evaluation_statistics_tab_click
            evaluation_statistics_tab.click
            sleep 2
            evaluation_statistics_tab.text.rstrip
          end

          def assess_tab_click
            assess_tab.click
            sleep 2
            assess_tab.text.rstrip
          end

          private

          def assess_tab
            @driver.find_element(:class =>'pro_menu').find_elements(:tag_name =>'a')[0]
          end

          def stability_tab
            @driver.find_element(:class =>'pro_menu').find_elements(:tag_name =>'a')[1]
          end

          def compliance_tab
            @driver.find_element(:class =>'pro_menu').find_elements(:tag_name =>'a')[2]
          end

          def evaluation_statistics_tab
            @driver.find_element(:class =>'pro_menu').find_elements(:tag_name =>'a')[3]
          end

          def chang_graph_button
            @driver[:css => "a[id='poptrigger'] span.button"]
          end

          def width
            @driver[:css => '#imgWidth']
          end

          def high
            @driver[:css => '#imgHeight']
          end

          def submit_button
            @driver[:css => "div[id='poplayer_content'] input[type='submit']"]
          end

        end#ProcessUsePage
      end#DataStatistics
    end# Page
  end #Prom
end# WebDriver