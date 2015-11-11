#author:L.P
#time:201510061912
#Main:
=begin
	在英文词库中，有这样一些有趣的集合()，例如：{"rats", "tars" , "star"}，在这个集合中四个字母
	通过组合的方式分别构成了三个单词。在给定的word.txt词库中找到并输出这样的集合。
编程要求：
（1） 设计函数，统一命名为anagrams.rb
（2） 输出格式
a. 每个集合输出一行；
b. 集合间的单词以空格区分。
（选做）
说明：在上述题目要求的基础上选做，可加分；不做的话不扣分。
要求：
（1）求出整个查询输出过程的执行时间。
=end

#string sort order by dict
#input:string
def strSort(word)
	wordlen = word.length
	arr = []

	for i in 0...wordlen
		arr << word[i]
	end
	arr = arr.sort
	return arr
end

#let sorted string into Hash
#key = sortedString order by dict
#value = string without order
def anagrams(words)
	wordslen = words.length
	hashwords = Hash.new()
	returnhash = Hash.new()
	for i in 0...wordslen
		key = strSort(words[i].chomp)
		if hashwords.has_key?(key)
			returnhash[key] = hashwords[key]+" "+words[i].chomp
			hashwords[key] << " "+words[i].chomp	
		else
			hashwords[key] = words[i].chomp
		end
	end
	return returnhash
end



$ct = Time.now()
words = File.readlines("words.txt")
res = anagrams(words)
puts res.values

#save as file
# File = File.new("results_anagrams.txt","r+")
# if File
# 	File.syswrite(anagrams(words).values)
# else
# 	puts "Unable to open file!"
# end

$et = Time.now()

puts "The program costed #{$et-$ct}s"