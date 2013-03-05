require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require 'webdriver/support/table_action'
require 'webdriver/support/component'

module WebDriver
  module Prom
    module Page
      module ProcessAssets
        class ProjectTemplatePage < Common::BasePage
         
          include Support::MenuAction
          include Support::TableAction
          include Support::SwitchAction
          include Support::Component
          
          def to_this_page
            @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
            @data_prom = Helper::ReadProfiles.data :prom
            process_manage = @prom_profiles['process_manage']
            project_template = @prom_profiles['process_assets']['project_template']
            menu_click process_manage
            show_menu_by_js("spa_pd")
            menu_click project_template
          end
          
          def template_name_title template_name
            @driver.find_element(:link=>template_name).click
            sleep 2
            name_handle = @driver.window_handle
            all_handles = @driver.window_handles
            switch_alert_window(all_handles, name_handle)
            name_title = top_title[0..3]
            close_button.click
            switch_window name_handle
            name_title
          end
          
          def set_into_template numbers
            table_temp = table template_table
            num_col = 1
            row = find_target_row table_temp,numbers,num_col
            if row
              img = click_set_template_img(row)
              img.click
            else
              raise "can not find target row"
            end
          end

          def top_title
            @driver[:css=> 'h2'].text
          end
          
          private
          
          def click_set_template_img(row)
            img_title = @prom_profiles['process_assets']['set_template_img']
            table_temp = table template_table
            # table_temp[row][7].find_elements(:tag_name => 'img')
            table_temp[row].find_element(:css => "img[title='#{img_title}']")           
          end
          
          def project_name
            @driver[:css => "tbody tr td a[id='projNameHref']"]
          end
          
          def template_table
            @driver[:css => 'table']
          end
          
          def close_button
            @driver[:css => "div[id='content'] form input.ie6-button"]
          end
          


        end #ProjectTemplatePage
      end #ProcessAssets
    end # Page
  end  # Prom
end #  WebDriver
