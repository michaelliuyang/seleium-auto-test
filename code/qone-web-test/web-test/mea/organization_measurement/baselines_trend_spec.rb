require_relative '../../load_helper'

module WebTest
  module Mea
    module OrganizationMeasurement
      describe 'baselines report page' do
        before :all do
          @mea_profiles = Helper::ReadProfiles.apps_res_zh :mea
          @mea_data = Helper::ReadProfiles.data :mea
          @epg_login_name = @mea_data['epg_login_name']
          @epg_password = @mea_data['password']
          @driver = Support::Login.login(:name=>@epg_login_name, :pwd=>@epg_password)
          @page_container = WebDriver.create_page_container :mea, @driver
          @baselines_trend_page = @page_container.baselines_trend_page
          @baselines_trend_page.to_this_page
        end

        after :all do
          @page_container.close
        end
      end
    end
  end
end