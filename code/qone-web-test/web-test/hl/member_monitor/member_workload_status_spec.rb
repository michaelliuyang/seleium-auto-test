require_relative '../../load_helper'

module WebTest
  module Hl
    module MemberMonitor
      describe 'member monitor page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @member_workload_status_page = @page_container.member_workload_status_page
          @member_workload_status_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'member workload status page accessed?'do
          expect = @page_profiles['member_monitor']['member_workload_status']
          actual = @member_workload_status_page.top_title
          actual.should == expect
       end
      end #describe
   end#MemberMonitor
  end #Hl
end #Webtest