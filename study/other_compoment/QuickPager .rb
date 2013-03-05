#encoding: utf-8
require 'selenium-webdriver'
driver=Selenium::WebDriver.for :ie
driver.manage.timeouts.implicit_wait=5
url='http://localhost:8080/pm'
driver.get url
#login
driver[:id=>'loginUserName'].send_keys 'lypm'
driver[:id=>'currentPassword'].send_keys'intec'
driver[:css=>'input.loginBtn'].click


driver.get'http://localhost:8080/pm/ListAllProblemsAction.do?page=1&actions=firstIn&projectId=1' #跳转到问题管理页面

=begin

driver.find_element(:class=>'page-next').click #点击下一页按钮
=end

=begin
elements=driver.find_element(:id=>'NFSDataList_pagination').find_elements(:css=>'div')  #找到分页组件的翻页和页按钮
elements.each do
  |i|
  if i.attribute('class')=='page-hover'
    puts '当前显示的页是'+ i.text
  end
end
=end
=begin
puts driver.find_element(:id=>'NFSDataList_recordCount').text   #显示问题总数
=end
driver.find_element(:id=>'NFSDataList_page').clear
driver.find_element(:id=>'NFSDataList_page').send_keys '4'
driver.find_element(:class=>'refresh').click
puts '当前显示的页是'+driver.find_element(:class=>'page-hover').text
totalpage=driver.find_element(:id=>'NFSDataList_recordPagest').text #总页数

driver.quit