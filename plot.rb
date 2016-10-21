require 'pry'
require 'yaml'
# chart = Gchart.new( :type => 'line',
#                     :title => "example title",
#                     :theme => :keynote,
#                     :data => [[17, 17, 11, 8, 2],[10, 20, 15, 5, 7],[2, 3, 7, 9, 12]],
#                     :line_colors => 'e0440e,e62ae5,287eec',
#                     :legend => ['courbe 1','courbe 2','courbe 3'],
#                     :axis_with_labels => ['x', 'y'],
#                     :axis_range => [[0,100,20], [0,20,5]],
#                     :filename => "tmp/chart.png")
#
#                     chart.file



# def plot(x,y)
#   Gchart.line(  :size => '200x300',
#                 :title => "example title",
#                 :bg => 'efefef',
#                 :legend => ['first data set label', 'second data set label'],
#                 :data => [10, 30, 120, 45, 72]
#       )
# end
def find_accepted_answer(answers)
  t = answers.select{|a| a['is_accepted'] == true }
  t.size > 0 ? t[0]['creation_date'] : Time.now.to_i
end
def find_first_answered(answers)
  return Time.now.to_i if answers.nil? || answers.size == 0
  return answers[0]['creation_date'] if answers.size == 1
  answers.min{|a| a['creation_date']}['creation_date']
end


tag = 'ember.js'
current_time = Time.now.to_i
questions = YAML::load_file("log/#{tag}-questions.yaml")

time_taken_for_answer = Hash.new(0)
data = []
questions.each do |question|
  question['answers'] ||= []
  first_answer_time_in_sec = find_first_answered(question['answers']) - question['creation_date']
  accepted_answer_in_sec = find_accepted_answer(question['answers']) - question['creation_date']
  no_of_answers = question['answers'].size
  answers_time_taken = question['answers'].map{|x| x['creation_date']}
  # [3.months, 1.months, 2.weeks, 1.week].each do |tocheck_time|
  # current_time - question['creation_date'] <  tocheck_time

  if accepted_answer_in_sec
    key = (accepted_answer_in_sec*1.0/60/60/24).floor
  else
    key = 3*31
  end
  next if key <= 2
  data << key
  time_taken_for_answer[key]+=1
end
puts (data.join(','))
puts (time_taken_for_answer.keys.join(','))
puts (time_taken_for_answer.values.join(','))
binding.pry

