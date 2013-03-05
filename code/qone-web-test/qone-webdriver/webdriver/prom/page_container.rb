require 'webdriver/common/page_container'

module WebDriver
  module Prom
    class PageContainer < Common::PageContainer

      def standard_process_page
        Page::ProcessDefinition::StandardProcessPage.new @driver
      end

      def process_definition_page
        Page::ProcessDefinition::ProcessDefinitionPage.new @driver
      end

      def process_revised_page
        Page::ProcessDefinition::ProcessRevisedPage.new @driver
      end

      def release_process_page
        Page::ProcessDefinition::ReleaseProcessPage.new @driver
      end

      def checklist_manage_page
        Page::ProcessAssets::ChecklistManagePage.new @driver
      end

      def process_document_page
        Page::ProcessAssets::ProcessDocumentPage.new @driver
      end

      def project_assets_page
        Page::ProcessAssets::ProjectAssetsPage.new @driver
      end

      def project_template_page
        Page::ProcessAssets::ProjectTemplatePage.new @driver
      end

      def risk_library_page
        Page::ProcessAssets::RiskLibraryPage.new @driver
      end

      def working_environment_page
        Page::ProcessAssets::WorkingEnvironmentPage.new @driver
      end

      def survival_cycle_page
        Page::ProcessAssets::SurvivalCyclePage.new @driver
      end

      def form_custom_page
        Page::FormCustom::FormCustomPage.new @driver
      end

      def form_timing_page
        Page::FormCustom::FormTimingPage.new @driver
      end

      def forms_template_page
        Page::FormCustom::FormsTemplatePage.new @driver
      end

      def process_use_page
        Page::DataStatistics::ProcessUsePage.new @driver
      end

      def process_performance_page
        Page::DataStatistics::ProcessPerformancePage.new @driver
      end

      def progress_report_page
        Page::TempletSettings::ProgressReportPage.new @driver
      end

      def department_report_page
        Page::TempletSettings::DepartmentReportPage.new @driver
      end

      def repository_template_page
        Page::TempletSettings::RepositoryTemplatePage.new @driver
      end

      def evaluation_table_page
        Page::EvaluationTable::EvaluationTablePage.new @driver
      end
      
      def reports_permission_page
        Page::ReportsPermission::ReportsPermissionPage.new @driver
      end

    end #PageContainer
  end #prom
end #WebDriver