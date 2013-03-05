require_relative '../../load_helper'

module WebTest
  module Rm
    module BaseDataSetting
      describe 'baseline change setting page' do
        before :all do
          @rm_profiles = Helper::ReadProfiles.apps_res_zh :rm
          @sa_login_name =@rm_profiles['sa_login_name']
          @login_passwd =@rm_profiles['login_passwd']
          @driver = Support::Login.login(:name => @sa_login_name, :pwd => @login_passwd)
          @page_container = WebDriver.create_page_container :rm, @driver
          @baseline_change_setting_page = @page_container.baseline_change_setting_page
          @baseline_change_setting_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'baseline change setting page accessed?'do
          expect = @rm_profiles['base_data_setting']['baseline_change_setting']
          actual = @baseline_change_setting_page.top_title
          actual.should == expect
        end

        it 'add form page accessed?'do
          expect = @rm_profiles['base_data_setting']['add_form_title']
          actual = @baseline_change_setting_page.add_form_title
          actual.should == expect
        end
      end #describe
   end#BaselineMange
  end #Rm
end #Webtest