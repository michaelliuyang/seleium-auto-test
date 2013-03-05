require 'webdriver/common/page_container'

module WebDriver
  module Rm
    class PageContainer < Common::PageContainer
      
      def product_list_page
        Page::ProductList::ProductListPage.new @driver
      end

      def history_product_list_page
        Page::ProductList::HistoryProductListPage.new @driver
      end

      def baseline_list_page
        Page::BaselineManage::BaselineListPage.new @driver
      end

      def history_baseline_list_page
        Page::BaselineManage::HistoryBaselineListPage.new @driver
      end

      def requirements_track_matrix_page
        Page::RequirementsTrack::RequirementsTrackMatrixPage.new @driver
      end

      def requirements_task_track_page
        Page::RequirementsTrack::RequirementsTaskTrackPage.new @driver
      end

      def stage_track_work_product_page
        Page::RequirementsTrack::StageTrackWorkProductPage.new @driver
      end

      def template_setting_page
        Page::BaseDataSetting::TemplateSettingPage.new @driver
      end

      def user_group_manage_page
        Page::BaseDataSetting::UserGroupManagePage.new @driver
      end

      def attribute_setting_page
        Page::BaseDataSetting::AttributeSettingPage.new @driver
      end

      def baseline_change_setting_page
        Page::BaseDataSetting::BaselineChangeSettingPage.new @driver
      end
      
    end # PageContainer
  end # Rm
end # WebDriver