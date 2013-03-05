require_relative '../../load_helper'

module WebTest
  module Prom
    module ProcessDefinition

      describe 'process definition page' do

        before :all do
          driver = Support::Login.login
          @page_container = WebDriver.create_page_container :prom,driver
          @prom_profiles = Helper::ReadProfiles.apps_res_zh :prom
          @process_definition_page = @page_container.process_definition_page
          @process_definition_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success?' do
          #given
          process_definition_top_title = @prom_profiles['process_definition']['process_definition_top_title']
          #when
          actual_top_title = @process_definition_page.top_title
          #then
          actual_top_title.should == process_definition_top_title
        end

      end
    end #ProcessDefinition
  end #Prom
end #WebTest