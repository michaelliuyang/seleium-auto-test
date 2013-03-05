require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemSettings

      describe 'news setting page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :sm, driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @news_setting_page = @page_container.news_setting_page
          @news_setting_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        describe 'menu and link page check testing' do

          it 'news setting menu click success?' do
            expect_top_title =@sm_profiles['system_settings']['news_setting_top_title']
            actual_top_title = @news_setting_page.top_title
            actual_top_title.should == expect_top_title
          end

          it 'message tab page check testing success' do
            expect = @sm_profiles['system_settings']['com_number']
            actual =  @news_setting_page.message_tab_page?
            actual.should == expect
          end

          it 'mail_tab_page check testing success?' do
            expect = true
            actual = @news_setting_page.mail_tab_page?
            actual.should == expect
          end

          it 'send test mail page check testing success?' do
            expect = true
            actual = @news_setting_page.send_test_email_button?
            actual.should == expect
          end

          it 'template set tab page check testing success?' do
            expect_text = @sm_profiles['system_settings']['new_project_create_notice']
            actual = @news_setting_page.template_tab_page?
            actual.should == expect_text
          end

          it 'edit template link page check testing success?' do
            expect = @sm_profiles['system_settings']['edit_email_template']
          actual = @news_setting_page.edit_template_link?
          actual.should == expect
          end

        end

      end
    end # SystemSettings
  end # Sm
end # WebTest