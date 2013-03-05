require_relative '../../load_helper'

module WebTest
  module Hl
    module ProjectMonitor
      describe 'project monitor page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @project_monitor_page = @page_container.project_monitor_page
          @project_monitor_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'total page accessed?'do
          expect = @page_profiles['project_monitor']['total_monitor']
          actual = @project_monitor_page.total_monitor_title
          actual.should == expect
       end

       it 'progress page accessed?'do
          expect = @page_profiles['project_monitor']['progress_monitor']
          actual = @project_monitor_page.progress_monitor_title
          actual.should == expect
       end

       it 'cost page accessed?'do
          expect = @page_profiles['project_monitor']['cost_monitor']
          actual = @project_monitor_page.cost_monitor_title
          actual.should == expect
       end

       it 'quality page accessed?'do
          expect = @page_profiles['project_monitor']['quality_monitor']
          actual = @project_monitor_page.quality_monitor_title
          actual.should == expect
       end

       it 'workload page accessed?'do
          expect = @page_profiles['project_monitor']['workload_monitor']
          actual = @project_monitor_page.workload_monitor_title
          actual.should == expect
       end

        it'quality monitor page quality statistics graph page accessed?'do
          expect = @page_profiles['project_monitor']['quality_statistics_graph_title']
          actual = @project_monitor_page.quality_statistics_graph_title
          puts expect
          puts actual
          actual.should == expect
        end
      end #describe
   end#Project
  end #Rm
end #Webtest