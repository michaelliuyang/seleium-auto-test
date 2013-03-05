require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemOutsourceSettings

      describe 'system outsource settings page' do
        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :sm,driver
          @page_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @data_profiles = Helper::ReadProfiles.data :sm
          @system_outsource_settings_page = @page_container.system_outsource_settings_page
          @system_outsource_settings_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'accessed?' do
          expect_top_title = @page_profiles['system_outsource_settings']['system_outsource_settings_top_title']
          actual_top_title = @system_outsource_settings_page.top_title
          actual_top_title.should ==  expect_top_title
        end

        it 'add system_outsource success' do
          outsource_name = @data_profiles['outsource']['name_for_add']
          @system_outsource_settings_page.add_outsource_function outsource_name
          actual = @system_outsource_settings_page.outsource_name_exist? outsource_name
          expect = true
          actual.should == expect
        end

        it 'modify system outsource function test' do
          old_name = @data_profiles['outsource']['name_for_add']
          new_name = @data_profiles['outsource']['name_for_modify']
          @system_outsource_settings_page.modify_outsource_function old_name,new_name
          actual = @system_outsource_settings_page.outsource_name_exist? new_name
          expect = true
          actual.should == expect
        end

        it 'del system outsource function test' do
          name = @data_profiles['outsource']['name_for_modify']
          @system_outsource_settings_page.del_outsource_function name
          actual = @system_outsource_settings_page.outsource_name_exist? name
          expect = false
          actual.should == expect
        end

      end
     end # SystemOutsourceSettings
  end # Sm
end # WebTest