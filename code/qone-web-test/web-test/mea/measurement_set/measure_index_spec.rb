require_relative '../../load_helper'

module WebTest
  module Mea
    module MeasurementSet

      describe 'measurement index page ' do

        before :all do
         driver = Support::Login.login
          @page_container = WebDriver.create_page_container :mea, driver
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @measure_index_page = @page_container.measurement_index_page
          @measure_index_page.to_this_page
        end

        after :all do
          @page_container.close
        end

        it 'menu click success ?' do
          #given
          measure_index_top_title = @mea_profiles['measure_setup']['measure_index_top_title']
          #when
          actual_top_title = @measure_index_page.top_title
          #then
          actual_top_title.should == measure_index_top_title
        end

      end #describe
      
    end#MeasurementSet
  end#Mea
end#WebTest