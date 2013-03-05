require_relative '../../load_helper'

module WebTest
  module Hl
    module MemberMonitor
      describe 'member task situation page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @member_task_situation_page = @page_container.member_task_situation_page
          @member_task_situation_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'member task situation page accessed?'do
          expect = @page_profiles['member_monitor']['member_task_situation']
          actual = @member_task_situation_page.top_title
          actual.should == expect
       end
      end #describe
   end#MemberMonitor
  end #Hl
end #Webtest