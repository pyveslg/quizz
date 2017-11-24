require "open-uri"
require "json"
require "yaml"

CLIENT_ID = ENV['GH_BASIC_CLIENT_ID']
CLIENT_SECRET = ENV['GH_BASIC_SECRET_ID']

url= "https://api.github.com/repos/pyveslg/MFE/contents/quizzes?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"

fetch_ymls= open(url).read
ymls = JSON.parse(fetch_ymls)
quizz_url = ymls[0]['download_url']

quizz_content = open(quizz_url).read
quizz = YAML.load(quizz_content)

quiz = Quiz.create!
quiz.quizz_slug = quizz["quizz_slug"]
quiz.quizz_name = quizz["quizz_name"]
quiz.path = quizz["path"]
quiz.save

quizz["questions"].each do |question|
  question["quiz_id"] = quiz.id
  new_question = Question.create!(question)
end

puts "Finished!"
