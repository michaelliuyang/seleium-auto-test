require 'webdriver/common/base_page'
require 'webdriver/support/menu_action'
require 'webdriver/support/switch_action'
require  'webdriver/support/driver_extension_action'

module WebDriver
  module Hl
    module Page
      module ProjectMonitor
        class ProjectMonitorPage < Common::BasePage
         include Support::MenuAction
         include Support::SwitchAction
         def to_this_page
           @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
           high_level_view = @page_profiles['high_level_view']
           project_monitor = @page_profiles['project_monitor']['project_monitor']
           menu_click high_level_view
           menu_click project_monitor
         end

         def top_title
           top_title = @driver[:css=>'#content h2'].text
         end

          def table_view_button
            table_view_button_name =  @page_profiles['project_monitor']['table_view']
            @driver[:link => table_view_button_name]
          end

          def total_link
            total_link = @page_profiles['project_monitor']['total']
            @driver[:link => total_link]
          end

          def progress_link
            progress_link = @page_profiles['project_monitor']['progress']
            @driver[:link => progress_link]
          end

          def cost_link
            cost_link = @page_profiles['project_monitor']['cost']
            @driver[:link => cost_link]
          end

          def quality_link
            quality_link = @page_profiles['project_monitor']['quality']
            @driver[:link => quality_link]
          end

          def workload_link
            workload_link = @page_profiles['project_monitor']['workload']
            @driver[:link => workload_link]
          end

          def total_monitor_title
            total_link.click
            total_monitor_title = top_title
          end

          def progress_monitor_title
            progress_link.click
            progress_monitor_title = top_title
          end

          def cost_monitor_title
            cost_link.click
            cost_monitor_title = top_title
          end

          def quality_monitor_title
            quality_link.click
            quality_monitor_title = top_title
          end

          def workload_monitor_title
            workload_link.click
            workload_monitor_title = top_title
          end

          def quality_statistics_graph_title
            quality_statistics_graph_button.click
            sleep 3
            handles = @driver.window_handles
            current_handle = @driver.window_handle
            switch_alert_window handles,current_handle
            quality_statistics_graph_title = @driver[:css => 'h2'].text
            @driver.close
            switch_window current_handle
            quality_statistics_graph_title
          end

          def quality_statistics_graph_button
            quality_link.click
            sleep 3
            quality_statistics_graph = @page_profiles['project_monitor']['quality_statistics_graph']
            @driver[:link => quality_statistics_graph]
          end
        end#ProjectMonitorPage
      end#ProjectMonitor
    end#Page
  end#Hl
end#WebDriver