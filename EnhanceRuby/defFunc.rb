#author:L.P
#time:201510101856
#main:
=begin
学习基本的方法
=end

#ex01
5.times do |i|
  print "#{i}循环"
end


#ex02
#实例方法
p "10,20,30".split(",")  #divided as array
p [1,2,3,4,6].index(6)  #index

#ex03 sleep
puts "it will be sleep 1s"
sleep(1)
puts "sleep over!"

#ex03
#main:function block
num = 2
def myloop
  while true
    yield
  end
end

myloop do
  puts "num is #{num}"
  break if num > 100
  num *= 2
end

#ex04 keywords parameter
def area(x:0,y:0,z:0)
  xyz = z*y*x
end

#p area(2,3,4)  #here,it would be happened an error.
p area(x:2, z:4, y:3)

#ex04.1
#main:hash as parameters
h = {x:2,y:3,z:4}
p area(h)

#ex05
#main: arr as parameter
def area2(x,y)
  x*y
end

arr = [2,3]
p area2(*arr)

#ex06
#main:hash literal as parameters
def foo(agr)
  agr
end

p foo({"a"=>1,"b"=>2})
p foo("a"=>1,"b"=>2)
h1 = {"a"=>1,"b"=>2}
p foo(h1)


#ex07
#simple code
str = "simple code coding"
p str

str1 = "Simple Coding";p str1

