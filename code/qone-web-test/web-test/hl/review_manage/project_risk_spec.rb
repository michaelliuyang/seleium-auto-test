require_relative '../../load_helper'

module WebTest
  module Hl
    module ReviewManage
      describe 'project risk page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @project_risk_page = @page_container.project_risk_page
          @project_risk_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'form list page accessed?'do
          expect = @page_profiles['review_manage']['risk_list']
          actual = @project_risk_page.top_title
          actual.should == expect
       end
      end #describe
   end#ProjectRisk
  end #Hl
end #Webtest