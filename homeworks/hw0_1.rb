# sum function
def sum(arr)
  total=0
	if arr.kind_of?(Array) && !arr.empty? 
    arr.each { |n| total+=n } ;
  end
  total
end

def max_2_sum(arr)
  total=0
  if arr.kind_of?(Array) && !arr.empty?
    newarr=arr.to_a.clone
    total+=newarr.sort!.pop
    num2=newarr.pop if !newarr.empty?
    total+=num2.nil? ? 0:num2
  end
  total
end

def sum_to_n?(arr,num)
  total=0
  if arr.kind_of?(Array) && !arr.empty?
    arr.to_a.permutation(2).to_a.each { |a,b| total=a+b if a+b==num }
  end
  total==num
end

