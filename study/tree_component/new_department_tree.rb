#encoding: utf-8
require "selenium-webdriver"
dr = Selenium::WebDriver.for :ie
dr.get 'http://localhost:8080'
dr.manage.timeouts.implicit_wait= 5
dr.find_element(:name => "userLoginId").send_keys "chpm"
dr.find_element(:name => "currentPassword").send_keys "intec"
dr.find_element(:class =>"loginBtn").submit                      #以上是登陆
dr.get "http://localhost:8080/pm/hl/ProjMonitorAction.do?method=getAllMonitor_tree&uuid=NqZsP2xGzY6BZYqSoCRDmIlvxULdUJkb"      #进入高层视图
dr.find_element(:xpath=>"//img[@src ='/pm/skins/common/image/edit.gif']").click       #点项目名称处的新树组件
#=begin
ch = dr.window_handle
hh =dr.window_handles
hh.each do |h|                                         #进入人员树句柄
  unless h==ch
    dr.switch_to.window(h)
  end
end
#=end
dr.find_element(:xpath=>"//img[@class='x-tree-elbow-end-plus']").click
dr.find_element(:id=>'NFS_tree_node_s_1_cb').click
dr.find_element(:id=>'NFS_tree_node_1_s_cb').click
dr.find_element(:xpath=>"//input[@type ='button' and @value ='确定']").click    #点确定
dr.switch_to.window(ch)
dr.find_element(:xpath =>"//input[@class ='ie6-button' and @value ='查询']").submit

=begin
dr.find_element(:id=>'img_2')
js =<<JS
 q = document.getElementById('img_2');
 q.ClassName = 'searchopen';
JS
dr.execute_script js
=end