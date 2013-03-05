require 'webdriver/common/page_container'

module WebDriver
  module Mea
    class PageContainer <Common::PageContainer

      def measurement_index_page
        Page::MeasurementSet::MeasureIndexPage.new @driver
      end

      def measure_target_page
        Page::MeasurementSet::MeasureTargetPage.new @driver
      end
      
      def project_list_page
        Page::ProjectMeasure::ProjectListPage.new @driver
      end
      
      def baselines_report_page
        Page::OrganizationMeasurement::BaselinesReportPage.new @driver
      end
      
      def baselines_trend_page
        Page::OrganizationMeasurement::BaselinesTrendPage.new @driver
      end
      
      def data_center_page
        Page::DataCenter::DataCenterPage.new @driver
      end
      
      def report_permission_page
        Page::CustomReport::ReportPermissionPage.new @driver
      end

    end#PageContainer
  end#Mea
end#WebDriver