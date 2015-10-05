#!/usr/bin/ruby
#author:L.P
#time:201510051057
#Main:
=begin
	1、回文
给定词典文档word.txt，找出词典中是回文的单词并输出。回文词是指字母顺序颠倒但同样是单词的词，例如：level。
编程要求：
（1）设计函数，统一命名为palindromes.rb
（2）输出格式
执行结果根据字符串长度由大到小输出。
例如：现有回文集合{non, dad, madam, mom, level, redivider}，则输出顺序为{redivider, madam, level, non, dad, mom}
（选做）
说明：在上述题目要求的基础上选做，可加分；不做不扣分。
要求：
（1）求出整个查询输出过程的执行时间。
（2）考虑如何查询并输出中文词库的回文词汇或句子。	
=end
#require 'date'

#Program begin time
$programBeginTime = Time.now
#$programBeginTime = DateTime.now
#puts $programBeginTime
#read word.txt and return arr
$wordfile = IO.readlines("/home/reallocing/Git/MyCodeSpace/EnhanceRuby/words2.txt")
#puts $wordfile[0]


#def palindrome function
def palindromes(filesarr)
	#blank arr filled with palindromes
	palindromesarr = []
	wordfilelen =  filesarr.length()
	# puts filesarr[0].chomp
	# puts filesarr[0].chomp.reverse
	# puts filesarr[0].chomp == filesarr[0].chomp.reverse  #BUG:find palindromes but return false due to "\n"
	
	for i in 0...wordfilelen
		arreach = filesarr[i].chomp
		if arreach==arreach.reverse
			palindromesarr << arreach
		end
	end
	return palindromesarr
end

palind = palindromes($wordfile)
puts palind.sort_by{|u| u.length}.reverse   #sort algorithm one
puts "Palindromes number is #{palind.length}"

#puts palind.sort{ |x,y| y.length <=> x.length}   #sort algorithm two

#Program end time
$programEndTime = Time.now
#$programEndTime = DateTime.now
#puts $programEndTime
#the program costed time
puts "The Program Runtime:",($programEndTime-$programBeginTime)
