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

# Define a method hello(name) that takes a string representing a name and returns the string "Hello, "
# # concatenated with the name
# def name(nombre)
#   "Hello, "+nombre
#   end
#   # Define a method starts_with_consonant?(s) that takes a string and returns true
#   # if it starts with a consonant and false otherwise.
#   # (For our purposes, a consonant is any letter other than A, E, I, O, U.)
#   # NOTE: be sure it works for both upper and lower case and for nonletters!
#   # @param [string] s
#   def starts_with_consonant?(s)
#     (/^[^aeiou].*$/i =~ s.to_s.downcase).eql? 0
#     end
#     #Define a method binary_multiple_of_4?(s) that takes a string and returns true if
#     # the string represents a binary number that is a multiple of 4.
#     # NOTE: be sure it returns false if the string is not a valid binary number!
#     def binary_multiple_of_4?(s)
#       total=0
#         if /^[01]+$/ =~ s.to_s
#             len=s.to_s.length
#                 s.to_s.chars.each { |c| total+=((Integer(c)*2)**(len-=1))*Integer(c)}
#                   end
#                     total%4==0
#                     end
#
#                     #Define a class BookInStock which represents a book with an isbn number, isbn, and price of the book
#                     # as a floating-point number, price, as attributes. The constructor should accept the
#                     # ISBN number (a string) as the first argument and price as second argument,
#                     # and should raise ArgumentError (one of Ruby's built-in exception types)
#                     # if the ISBN number is the empty string or if the price is less than or equal to zero.
#                     # Include the proper getters and setters for these attributes.
#                     # Include a method price_as_string that returns the price of the book with a leading dollar
#                     # sign and trailing zeros, that is, a price of 20 should display as "$20.00" and a price of 33.8
#                     # should display as "$33.80".
#                     class BookInStock
#                       attr_accessor :isbn
#                         attr_accessor :price
#                           def initialize(isbn,price)
#                               raise ArgumentError if isbn.to_s.empty? or price <= 0
#                                   @isbn=isbn
#                                       @price=price
#                                         end
#                                           def price_as_string
#                                               p=Integer(@price*100).to_s.split(/\d\d$/).at(0)
#                                                   Integer(@price*100).to_s.match(/(\d\d)$/)
#                                                       "$#{p}.#{$1}"
#                                                         end
#                                                         end
#
#
#                                                         #puts BookInStock.new('df',32)     .price_as_string
#                                                         #puts binary_multiple_of_4?('1001110000')       ==true
#                                                         #puts starts_with_consonant?('manolo') == true
#                                                         #puts starts_with_consonant?('Manolo') == true
#                                                         #puts name("nacho") == "Hello, nacho"
#                                                         #puts starts_with_consonant?('anolo') == false
#                                                         #puts starts_with_consonant?('1manolo') == true
#                                                         #puts starts_with_consonant?('?manolo') == true
#                                                         #puts starts_with_consonant?('m') == true
#                                                         #puts starts_with_consonant?('') == false
#
#
#
#
#
#
