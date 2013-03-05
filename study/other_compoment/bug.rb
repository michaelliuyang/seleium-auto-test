#encoding: utf-8
require "selenium-webdriver"
dr = Selenium::WebDriver.for :ie
dr.get 'http://localhost:8080'
dr.find_element(:name => "userLoginId").send_keys "chpm"
dr.find_element(:name => "currentPassword").send_keys "intec"
dr.find_element(:class =>"loginBtn").submit
dr.get 'http://localhost:8080/pm/BugListAction.do?method=getDisposalBugs'

=begin
dr.find_element(:id=>'bugProcessTask_c')
js= <<JS
 q = document.getElementById('bugProcessTask_c');
 q.checked = 'checked';
JS
dr.execute_script js                                                  #以上是通过JS来实现要把复选框选上
=end


=begin
dr.find_element(:link=>'我的Bug视图').click                       #这个是切换到我的BUG视图TAB

dr.find_element(:css=>"#img_2").click
dr.find_element(:css=>'img.datePicker').click                    #BUG视图TAB页面中日期控件选择其中的一个日期
dr.find_element(:link=>'14').click
=end


high_search = dr.find_element(:id=>'img_2')              #这一段是实现了如果高级查询面板是闭合的那么就展开它
if  high_search.attribute('class') == 'searchfold'
     high_search.click
end

 dr.find_element(:css=>'span.searchRight').find_elements(:tag_name=>'input').each do |x|
    if x.attribute('value')=='验证'&& x.attribute('checked')==nil
      x.click                            #这段是确保把BUG跟踪页面最上边的验证复选条件选中
    end
  end


dr.find_element(:css=>'#testReportId_showImg').click             #多选组件选项的选择
dr.find_element(:css=>'#testReportId_option').find_elements(:tag_name=>'input').each do  |x|
  if x.attribute('checked')==nil         #把没打勾的都打上
     puts x.click
  end
end

dr.find_element(:class=>'multiple-select-searchButtonDiv').find_elements(:tag_name=>'input').each do |y|
  if y.attribute('value')=='确定'                             #多选组件中的按钮的选择，如确定
    y.click
  end
end


js =<<JS
 q = document.getElementById('asvanceSearch')
   q.style.display='block'
JS
 dr.execute_script js             #这一段目的是把高级查询面板展开


