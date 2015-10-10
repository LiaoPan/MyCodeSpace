#author:L.P
#time: 201510101953
#Main:Learning Class

arr = Array.new(10){1}

p arr.instance_of?(Array)
p arr.instance_of?(String)


#Class
class HelloClass
  def initialize(myname = "Ruby")
    @name = myname
  end

  def Name(name)
    o = name
    p "Your name is #{o}"
  end

  def name
    p "name is #{@name}"
  end
end

H = HelloClass.new("LiaoPan")
H.Name("L.P")
H.name

K = HelloClass.new
K.Name("NI")
K.name


#====acessor
#访问对象的内部并进行修改．
class Hello
  def initialize(myname = "Ruby")
    @name = myname
  end
  def name  #acess @name
    @name
  end
  def name=(value)  #modify @name
    @name = value
  end

end

h = Hello.new("Bob")
p h.name
p h.name=("Alice")  #modify @name (class var)
p h.name

puts " "
#-----better method-----
class Hello2
  attr_accessor(name)   #使用此方法来代替上面的两个函数．　(just for name)
  def initialize(myname = "Ruby")
    @name = myname
  end


end

h = Hello.new("Bob")
p h.name
p h.name=("Alice")  #modify @name (class var)
p h.name
