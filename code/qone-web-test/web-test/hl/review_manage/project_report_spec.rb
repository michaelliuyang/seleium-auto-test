require_relative '../../load_helper'

module WebTest
  module Hl
    module ReviewManage
      describe 'project report page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @project_report_page = @page_container.project_report_page
          @project_report_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'project plan change page accessed?'do
          expect = @page_profiles['review_manage']['project_report_list']
          actual = @project_report_page.top_title
          actual.should == expect
       end
      end #describe
   end#ReviewManage
  end #Hl
end #Webtest