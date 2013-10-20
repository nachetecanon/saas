module FunWithStrings
  # A palindrome is a word or phrase that reads the same forwards as backwards, ignoring case,
  # punctuation, and nonword characters. (A "nonword character" is defined for our purposes
  # as "a character that Ruby regular expressions would treat as a nonword character".)
  # You will write a method palindrome? that returns true if and only if its receiver is a palindrome.
  def palindrome?
    s_with_only_chars=self.gsub(/[\W]/,'')
    s_with_only_chars.upcase.reverse==s_with_only_chars.upcase
  end
  # Define a function count_words that, given an input string, return a hash
  # whose keys are words in the string and whose values are the number of times each word appears:
  def count_words
    # prepare string with only words
    array_with_only_chars=self.split.map { |w| w.gsub(/[\W]/,'').downcase }
    mapa = Hash.new
    array_with_only_chars.select { |a| !a.to_s.empty?}.each do |w|
      value=mapa[w]?mapa[w]:0
      mapa[w]=value+1
    end
    mapa
  end
  # An anagram group is a group of words such that any one can be converted into any other just
  # by rearranging the letters. For example, "rats", "tars" and "star" are an anagram group.
  # Given a space separated list of words in a single string, write a method that groups them
  # into anagram groups and returns the array of groups. Case doesn't matter in classifying string as
  # anagrams (but case should be preserved in the output), and the order of the anagrams in the groups doesn't matter.
  def anagram_groups
    array_with_only_chars=self.split.map { |w| w.gsub(/[\W]/,'').downcase }
    mapa = Hash.new
    array_with_only_chars.select { |a| !a.to_s.empty?}.each do |w|
      key=''
      w.to_s.downcase.chars.sort.each { |s| key+=s}
      value=mapa[key]?w:Array.new << w
      mapa[key] =(mapa[key].to_a << value).flatten
    end
    total=Array.new(mapa.keys.length)
    index=0
    mapa.each_pair do |k,v|
      total[index]=Array.new
      total[index]<< v
      total[index].flatten!
      index+=1
    end
    total
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end


#puts 'scream cars for four scar creams'.anagram_groups.inspect
#puts ''.anagram_groups.inspect
[%w(cars scar), %w(four), %w(for), %w(creams scream)].each do |group|
  'scream cars for four scar creams'.anagram_groups.each do |e|
    puts "anagram #{e} -> #{group}"

  end
end


