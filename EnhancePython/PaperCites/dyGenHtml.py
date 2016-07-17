#coding:utf-8
"""
- 使用bottle来动态生成html
    - https://www.reddit.com/r/learnpython/comments/2sfeg0/using_template_engine_with_python_for_generating/

"""
_author_ = "LiaoPan"
_time_  = "2016.6.17"

from bottle import template
import webbrowser

#一些我们需要展示的文章题目和内容
articles = [("Title #1","Detials #1","http://blog.csdn.net/reallocing1/article/details/51694967"),("Title #2","Detials #2","http://music.163.com"),("Title #3","Detials #3","http://douban.fm")]

#定义想要生成的Html的基本格式
#使用%来插入python代码
template_demo="""
<html>
<head><h1>demo of bottle</h1></head>
<title>Demo</title>
<body>


% for title,detail,link in items:
<h2>{{title.strip()}}</h2>
<p>{{detail}}</p>
<a href={{link}}>Link text</a>
%end


</body
</html>
"""

html = template(template_demo,items=articles)

with open("test.html",'wb') as f:
    f.write(html.encode('utf-8'))


#使用浏览器打开html
webbrowser.open("test.html")
