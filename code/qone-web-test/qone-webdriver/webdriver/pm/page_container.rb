require 'webdriver/common/page_container'

module WebDriver
  module Pm
    class PageContainer <Common::PageContainer
      def project_list_page
        Page::ProjectList::ProjectListPage.new @driver
      end

      def base_information_page
        Page::ProjectInformation::BaseInformationPage.new @driver
      end

      def project_estimate_page
        Page::ProjectInformation::ProjectEstimatePage.new @driver
      end

      def plan_change_page
        Page::ProjectPlan::PlanChangePage.new @driver
      end

      def outsource_plan_page
        Page::ProjectPlan::OutsourcePlanPage.new @driver
      end

      def training_plan_page
        Page::ProjectPlan::TrainingPlanPage.new @driver
      end

      def data_manage_plan_page
        Page::ProjectPlan::DataManagePlanPage.new @driver
      end

      def related_baseline_page
        Page::ProjectPlan::RelatedBaselinePage.new @driver
      end

      def process_definition_page
        Page::ProjectInformation::ProcessDefinitionPage.new @driver
      end

      def problem_manage_page
        Page::RiskProblem::ProblemManagePage.new @driver
      end

      def risk_count_page
        Page::RiskProblem::RiskCountPage.new @driver
      end

      def risk_manage_page
        Page::RiskProblem::RiskManagePage.new @driver
      end

      def project_data_page
        Page::ProjectData::ProjectDataPage.new @driver
      end

      def personal_data_page
        Page::ProjectData::PersonalDataPage.new @driver
      end

      def cost_monitor_page
        Page::CostManage::CostMonitorPage.new @driver
      end

      def changable_cost_manage_page
        Page::CostManage::ChangableCostManagePage.new @driver
      end
      def project_outsource_manage_page
        Page::ProjectOutsourceManage::ProjectOutsourceManagePage.new @driver
      end
      def config_library_information_page
        Page::ConfigManage::ConfigLibraryInformationPage.new @driver
      end
      def config_manage_plan_page
        Page::ConfigManage::ConfigManagePlanPage.new @driver
      end
      def config_manage_report_page
        Page::ConfigManage::ConfigManageReportPage.new @driver
      end
      def task_report_page
        Page::ProjectReport::TaskReportPage.new @driver
      end
      def progress_report_page
           Page::ProjectReport::ProgressReportPage.new @driver
      end
      def measure_report_page
          Page::ProjectReport::MeasureReportPage.new @driver
      end
      def check_report_page
        Page::ProjectReport::CheckReportPage.new @driver
      end
      def process_assess_report_page
        Page::ProjectReport::ProcessAssessReportPage.new @driver
      end
      def project_form_page
         Page::ProjectReport::ProjectFormPage.new @driver
      end
      def member_work_log_page
          Page::ProjectReport::MemberWorkLogPage.new @driver
      end
      def work_product_manage_page
         Page::WorkProduct::WorkProductManagePage.new @driver
      end
      def work_area_browse_page
          Page::WorkProduct::WorkAreaBrowsePage.new @driver
      end
      def review_plan_page
          Page::ProductReview::ReviewPlanPage.new @driver
      end
      def review_report_page
          Page::ProductReview::ReviewReportPage.new @driver
      end
      def review_defect_count_page
          Page::ProductReview::ReviewDefectCountPage.new @driver
      end
      def review_defect_query_page
          Page::ProductReview::ReviewDefectQueryPage.new @driver
      end
      def audit_plan_page
          Page::ProcessAudit::AuditPlanPage.new @driver
      end
      def audit_report_page
          Page::ProcessAudit::AuditReportPage.new @driver
      end
      def nci_count_page
          Page::ProcessAudit::NciCountPage.new @driver
      end
      def nci_query_page
          Page::ProcessAudit::NciQueryPage.new @driver
      end
      def test_plan_page
          Page::Test::TestPlanPage.new @driver
      end
      def test_report_page
          Page::Test::TestReportPage.new @driver
      end
      def bug_count_page
          Page::Test::BugCountPage.new @driver
      end
      def bug_query_page
          Page::Test::BugQueryPage.new @driver
      end
      def project_maintain_page
          Page::ProjectMaintain::ProjectMaintainPage.new @driver
      end
      def personal_estimate_list_page
          Page::ProjectEstimate::PersonalEstimateListPage.new @driver
      end
      def project_estimate_list_page
           Page::ProjectEstimate::ProjectEstimateListPage.new @driver
      end
      def estimate_expert_list_page
           Page::ProjectEstimate::EstimateExpertListPage.new @driver
      end
      def estimate_basic_data_page
            Page::ProjectEstimate::EstimateBasicDataPage.new @driver
      end

    end #PageContaine
  end #Pm
end #WebDriver