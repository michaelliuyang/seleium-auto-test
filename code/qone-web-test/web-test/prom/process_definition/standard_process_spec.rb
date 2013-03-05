require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessDefinition

      describe 'standard process page' do

        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :prom, driver
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @standard_process_page = @page_container.standard_process_page
          @standard_process_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success?' do
          #given
          standard_process_top_title = @prom_profiles['process_definition']['standard_process_top_title']
          #when
          actual_top_title = @standard_process_page.top_title
          #then
          actual_top_title.should == standard_process_top_title
        end

      end
    end #ProcessDefinition
  end #Prom
end #WebTest