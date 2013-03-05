require 'webdriver/common/page_container'

module WebDriver
  module Wkb
    class PageContainer < Common::PageContainer
      
      def my_todo_page
        Page::MyTodo::MyTodoPage.new @driver
      end

      def work_calendar_page
        Page::WorkCalendar::WorkCalendarPage.new @driver
      end

      def create_order_page
        Page::WorkOrder::CreateOrderPage.new @driver
      end

      def create_form_page                     #meng
        Page::CreateForm::CreateFormPage.new @driver
      end

      def my_meeting_page
        Page::MyMeeting::MyMeetingPage.new @driver
      end

      def message_notice_page
        Page::MessageNotice::MessageNoticePage.new @driver
      end

      def message_send_page
        Page::SystemMessage::MessageSendPage.new @driver
      end

      def system_notice_page
        Page::SystemMessage::SystemNoticePage.new @driver
      end

      def my_order_page
        Page::WorkOrder::MyOrderPage.new @driver
      end

      def task_list_page
        Page::MyTask::TaskListPage.new @driver
      end

      def submit_task_report_page
        Page::MyTask::SubmitTaskReportPage.new @driver
      end

      def approve_task_report_page
        Page::MyTask::ApproveTaskReportPage.new @driver
      end

      def personal_task_data_page
        Page::MyTask::PersonalTaskDataPage.new @driver
      end

      def problem_track_page
        Page::MyTask::ProblemTrackPage.new @driver
      end

      def my_review_page
        Page::MyTask::MyReviewPage.new @driver
      end

      def my_audit_page
        Page::MyTask::MyAuditPage.new @driver
      end

      def nci_track_page
        Page::MyTask::NciTrackPage.new @driver
      end

      def bug_track_page
        Page::MyTask::BugTrackPage.new @driver
      end

      def task_comment_page
        Page::MyTask::TaskCommentPage.new @driver
      end

      def risk_track_page
        Page::MyTask::RiskTrackPage.new @driver
      end

      def my_view_page
        Page::MyView::MyViewPage.new @driver
      end

      #def work_calendar_page
      #  Page::WorkCalendar::WorkCalendarPage.new @driver
      #end

      def meeting_problem_track_page
        Page::MyMeeting::MeetingProblemTrackPage.new @driver
      end

    end #PageContainer
  end #Wkb
end #WebDriver