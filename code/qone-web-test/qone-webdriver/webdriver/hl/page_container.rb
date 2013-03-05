require 'webdriver/common/page_container'

module WebDriver
  module Hl
    class PageContainer < Common::PageContainer
      
      def project_monitor_page
        Page::ProjectMonitor::ProjectMonitorPage.new @driver
      end

      def member_workload_status_page
        Page::MemberMonitor::MemberWorkloadStatusPage.new @driver
      end

      def member_workload_statistics_page
        Page::MemberMonitor::MemberWorkloadStatisticsPage.new @driver
      end

      def member_task_situation_page
        Page::MemberMonitor::MemberTaskSituationPage.new @driver
      end

      def data_statistics_page
        Page::MemberMonitor::DataStatisticsPage.new @driver
      end

      def work_log_page
        Page::MemberMonitor::WorkLogPage.new @driver
      end

      def project_plan_change_page
        Page::ReviewManage::ProjectPlanChangePage.new @driver
      end

      def project_report_page
        Page::ReviewManage::ProjectReportPage.new @driver
      end

      def department_report_page
        Page::ReviewManage::DepartmentReportPage.new @driver
      end

      def form_list_page
        Page::ReviewManage::FormListPage.new @driver
      end

      def project_problem_page
        Page::ReviewManage::ProjectProblemPage.new @driver
      end

      def project_risk_page
        Page::ReviewManage::ProjectRiskPage.new @driver
      end
      
    end # PageContainer
  end # Hl
end # WebDriver