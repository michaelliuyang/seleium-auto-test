require_relative '../../load_helper'

module WebTest
  module Hl
    module MemberMonitor
      describe 'work log page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @work_log_page = @page_container.work_log_page
          @work_log_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'left tree title right?'do
          expect = @page_profiles['member_monitor']['left_tree_title']
          actual = @work_log_page.left_tree_title
          actual.should == expect
       end

       it 'completed log search title right?'do
          expect = @page_profiles['member_monitor']['completed_log_search_title']
          actual = @work_log_page.completed_log_search_title
          actual.should == expect
       end

       it 'not completed log search title right?'do
          expect = @page_profiles['member_monitor']['not_completed_log_search_title']
          actual = @work_log_page.not_completed_log_search_title
          actual.should == expect
       end
      end #describe
   end#MemberMonitor
  end #Hl
end #Webtest