require_relative '../../load_helper'

module WebTest
  module Pm
    module CostManage
      class CostMonitorSpec
         describe 'cost manage page' do

           before :all do
              driver = Support::Login.login
             @page_container = WebDriver.create_page_container :pm,driver
              @pm_profiles = Helper::ReadProfiles.apps_res_zh :pm
             @project_list_page = @page_container.project_list_page
              @cost_monitor_page = @page_container.cost_monitor_page

              @project_list_page.to_this_page
              @project_name = @pm_profiles['project_list']['project_name']
              @project_list_page.enter_project @project_name
              @cost_monitor_page.to_this_page
           end

           after :all do
              @page_container.close
           end

           it 'page and link test' do
             text =@pm_profiles['cost_manage']['cost_data_list']
             expect_text = "#{text} [#{@project_name}]"
             actual = @cost_monitor_page.top_title
             actual.should == expect_text
           end

           it 'print page button test' do

             actual = @cost_monitor_page.print_page_test
             puts actual
           end

         end

      end #CostMonitorSpec
    end #CostManage
  end # Pm
end # WebTest

