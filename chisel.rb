require 'pry'

class Chisel

  def parse(doc)
    doc.gsub!(/((^#)+( )(.*))+$/) {|w| "<h1>#{w.chomp.slice(2,w.length)}</h1>"}
    doc.gsub!(/((^##)+( )(.*))+$/) {|w| "<h2>#{w.chomp.slice(3,w.length)}</h2>"}
    doc.gsub!(/((^###)+( )(.*))+$/) {|w| "<h3>#{w.chomp.slice(4,w.length)}</h3>"}
    doc.gsub!(/((^####)+( )(.*))+$/) {|w| "<h4>#{w.chomp.slice(5,w.length)}</h4>"}
    doc.gsub!(/^(")+(.)+$/) {|w| "<p>#{w.chomp}</p>"}
    doc.gsub!(/^(\w)+(.)+$/) {|w| "<p>#{w.chomp}</p>"}
    doc.gsub!(/[*]+[\w]+[*]/) {|w| "<em>#{w.slice(1, (w.length-2))}</em>"}
    doc.gsub!(/[*]{2}+(.)+[*]{2}/) {|w| "<strong>#{w.slice(2, (w.length-4))}</strong>"}
    doc.gsub!(/&/){|w| '&amp;'}
  end

end


document = '# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in **Food & Wine** this place has been packed every night."

A regular sentence.

4 score and seven years ago starts with a numeral/

## Chapter 2: The Beginning

### Chapter 3: The Beginning

#### Chapter 4: The Beginning'

parser = Chisel.new

output = parser.parse(document)

puts output
