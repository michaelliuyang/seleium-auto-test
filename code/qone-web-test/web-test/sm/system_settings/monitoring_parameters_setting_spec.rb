require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemSettings

      describe 'monitoring parameters setting page' do
        describe 'menu and link page check testing' do

          before :all do
            driver = Support::Login.login
            @page_container = WebDriver.create_page_container :sm, driver
            @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
            @monitoring_parameters_setting_page = @page_container.monitoring_parameters_setting_page
            @monitoring_parameters_setting_page.to_this_page
          end

          after :all do
            @page_container.close
          end

          it 'menu page check testing success?' do
            monitoring_parameters_setting_menu_name = @sm_profiles['system_settings']['monitoring_parameters_setting']
            actual_top_title = @monitoring_parameters_setting_page.top_title
            actual_top_title.should == monitoring_parameters_setting_menu_name
          end

          it 'schedule_tab page check testing success?' do
            expect_text = @sm_profiles['system_settings']['schedule_tab_flag_text']
            @monitoring_parameters_setting_page.to_schedule_tab_page
            actual_text = @monitoring_parameters_setting_page.tab_page_flag_text
            actual_text.should == expect_text
          end

          it 'cost_tab page check testing success?' do
            expect_text = @sm_profiles['system_settings']['cost_tab_flag_text']
            @monitoring_parameters_setting_page.to_cost_tab_page
            actual_text = @monitoring_parameters_setting_page.tab_page_flag_text
            actual_text.should == expect_text
          end

          it 'quality_tab page check testing success?' do
            expect_text = @sm_profiles['system_settings']['quality_tab_flag_text']
            @monitoring_parameters_setting_page.to_quality_tab_page
            actual_text = @monitoring_parameters_setting_page.tab_page_flag_text
            actual_text.should == expect_text
          end

          it 'organizationTrack_tab page check testing success?'  do
            expect_text = @sm_profiles['system_settings']['organization_track_tab_flag_text']
            @monitoring_parameters_setting_page.to_organization_track_tab_page
            actual_text = @monitoring_parameters_setting_page.tab_page_flag_text
            actual_text.should == expect_text
          end

          it 'add_organizationTrack page check testing success?' do
            expect_text = @sm_profiles['system_settings']['add_organization_track_rule']
            @monitoring_parameters_setting_page.to_organization_track_tab_add_button_page
            actual_text = @monitoring_parameters_setting_page.organization_track_tab_add_page_title
            actual_text.should == expect_text

          end

        end
      end
    end # SystemSettings
  end # Sm
end # WebTest