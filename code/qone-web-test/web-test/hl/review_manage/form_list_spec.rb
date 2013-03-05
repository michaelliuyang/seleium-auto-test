require_relative '../../load_helper'

module WebTest
  module Hl
    module ReviewManage
      describe 'form list page' do
        before :all do
          @page_profiles = Helper::ReadProfiles.apps_res_zh :hl
          @dm_login_name =@page_profiles['dm_login_name']
          @login_passwd =@page_profiles['login_passwd']
          @driver = Support::Login.login(:name => @dm_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :hl,@driver
          @form_list_page = @page_container.form_list_page
          @form_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

       it 'form list page accessed?'do
          expect = @page_profiles['review_manage']['form_list']
          actual = @form_list_page.top_title
          actual.should == expect
       end
      end #describe
   end#FormList
  end #Hl
end #Webtest