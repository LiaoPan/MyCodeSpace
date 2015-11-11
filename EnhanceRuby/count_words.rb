#!/usr/bin/ruby
#Author:L.P
#time:201510051623
#Main:
=begin
给定一篇文章wordcount.txt，也可以自选。统计文章中每个单词的词频，例如："To be or not to be" # => {"to"=>2, "be"=>2, "or"=>1, "not"=>1}
编程要求：
（1）设计函数，统一命名为count_words.rb
（2）输出格式
a.结果返回一个hash键值对(key,value)，key指words字符串，value指每个单词出现的词频; 
b.单词根据词频的大小由大到小输出;
c.定冠词不计入其中。
（选做）
说明：在上述题目要求的基础上选做，可加分；不做不扣分。
要求：
（1）考虑在中文词库下统计中文单词的词频。		
=end

 def countWords(f)
 	$frequency = Hash.new(0)
 	f.each_line{|line|
 	#words = line.split
 	#words = line.scan(/\w+/)
 	words = line.scan(/[a-zA-Z]+/)
 	words.each{|word| $frequency[word.downcase]+=1}
 	}
 	return $frequency
 end



#read file 
f = File.open("wordcount.txt",'r')
res = countWords(f)
#handle to definite article(定冠词)
res.delete_if{|key,value| key == "the"}

#print 

res = res.sort_by{|a,b| b}
res.reverse!

res.each do |word,value|
	puts word+"=>"+value.to_s
end

