require_relative '../../load_helper'

module WebTest
  module Hl
    module MemberMonitor
      describe 'member workload statistics page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @member_workload_statistics_page = @page_container.member_workload_statistics_page
          @member_workload_statistics_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'member workload statistics page accessed?'do
          expect = @page_profiles['member_monitor']['member_workload_statistics']
          actual = @member_workload_statistics_page.top_title
          actual.should == expect
       end
      end #describe
   end#MemberMonitor
  end #Hl
end #Webtest