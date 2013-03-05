require_relative '../../load_helper'

module WebTest
  module Mea
    module CustomReport

      describe 'measurement index page ' do

        before :all do
         driver = Support::Login.login
          @page_container = WebDriver.create_page_container :mea, driver
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @reports_list_page = @page_container.project_list_page
          @reports_list_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          reports_list_title = @mea_profiles['custom_report']['reports_list_top_title']
          #when
          actual_top_title = @reports_list_page.reports_list_top_title

          #then
          actual_top_title.should == reports_list_title
        end

      end #describe
      
    end#CustomReport
  end#Mea
end#WebTest