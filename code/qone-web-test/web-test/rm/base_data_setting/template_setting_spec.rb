require_relative '../../load_helper'

module WebTest
  module Rm
    module BaseDataSetting
      describe 'template setting page' do
        before :all do
          @rm_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @sa_login_name =@rm_profiles['sa_login_name']
          @login_passwd =@rm_profiles['login_passwd']
          @driver = Support::Login.login(:name => @sa_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @template_setting_page = @page_container.template_setting_page
          @template_setting_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'template setting page accessed?'do
          expect = @rm_profiles['base_data_setting']['template_setting_title']
          actual = @template_setting_page.top_title
          actual.should == expect
        end
      end #describe
   end#BaseDataSetting
  end #Rm
end #Webtest