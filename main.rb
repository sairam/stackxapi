$LOAD_PATH << "." ; require 'lib/stackxapi' ;
tag = 'ember.js'
filter_id = '!gIk1Vz8RK9Rw1iiTBW9Ki.jbjzwekR0(fdh'
max_page_count = 100
t = StackExchange::Questions::Questions.new({tagged: tag, page_size: max_page_count, filter: filter_id, since: 3.months })
t = StackExchange::Questions::Unanswered.new({tagged: tag, page_size: max_page_count, filter: filter_id, since: 3.months })
t = StackExchange::Questions::NoAnswers.new({tagged: tag, page_size: max_page_count, filter: filter_id, since: 3.months })
count = 0
questions = []
begin
  result = t.next
  questions |= result.items
  count += result.items.size
  print "."
end while result.has_more?

puts "count = #{count} of questions for tag #{tag}"

file = open("log/#{tag}-questions.yaml",'w+')
file.write questions.to_yaml
file.close

t = StackExchange::Tags::Info.new({tags: tag})
resp = t.request
puts "Total no of questions over the years asked is #{resp.items[0]['count']}"

=begin
data = un_results[-1].items[-1]
# Last unanswered question
DateTime.strptime(data['creation_date'].to_s,'%s')
=end

# binding.pry