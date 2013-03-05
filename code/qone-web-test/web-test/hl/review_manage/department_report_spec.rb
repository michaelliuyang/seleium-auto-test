require_relative '../../load_helper'

module WebTest
  module Hl
    module ReviewManage
      describe 'department report page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @department_report_page = @page_container.department_report_page
          @department_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'department report page accessed?'do
          expect = @page_profiles['review_manage']['department_report']
          actual = @department_report_page.top_title
          actual.should == expect
       end

        it 'department report setting page accessed?'do
          expect = @page_profiles['review_manage']['department_report_setting']
          actual = @department_report_page.department_report_setting_title[0..5]
          actual.should == expect
        end
      end #describe
   end#ReviewManage
  end #Hl
end #Webtest