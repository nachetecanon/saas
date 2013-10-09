# sum function
def sum(arr)
  total=0
	if arr.kind_of?(Array) && !arr.empty? 
    arr.each { |n| total+=n } ;
  end
  total
end

puts sum(nil)
puts sum([1,2,3])
puts sum([])
