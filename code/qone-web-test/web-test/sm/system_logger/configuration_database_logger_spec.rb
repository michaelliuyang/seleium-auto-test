require_relative '../../load_helper'

module WebTest
  module Sm
    module SystemLogger
      
      describe 'configuration database logger page' do
        before :all do
          driver = Support::Login.login :name=>'ssa',:pwd=>'intec'
          @page_container = WebDriver.create_page_container :sm,driver
          @sm_profiles = Helper::ReadProfiles.apps_res_zh :sm
          @configuration_database_logger_page = @page_container.configuration_database_logger_page
          @configuration_database_logger_page.to_this_page
        end
      
        after :all do
          @page_container.close
        end
        
        it 'configuration_database_logger menu click success?' do
          expect_top_title = @sm_profiles['system_logger']['configuration_database_logger']
          actual_top_title = @configuration_database_logger_page.top_title
          actual_top_title.should ==  expect_top_title
        end
        
      end
    end # SystemLogger
  end # Sm
end # WebTest