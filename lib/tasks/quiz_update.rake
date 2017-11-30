require "open-uri"
require "json"
require "yaml"

CLIENT_ID = ENV['GH_BASIC_CLIENT_ID']
CLIENT_SECRET = ENV['GH_BASIC_SECRET_ID']

namespace :quiz_update do
 desc "Updating & Creating New Quiz and relative questions"
 task :update_all => :environment do

  Question.destroy_all
  QuizSession.destroy_all
  Quiz.destroy_all

  url= "https://api.github.com/repos/pyveslg/MFE/contents/quizzes?client_id=#{CLIENT_ID}&client_secret=#{CLIENT_SECRET}"


  fetch_ymls= open(url).read
  ymls = JSON.parse(fetch_ymls)
  ymls.each_with_index do |yml, i|
    quizz_url = ymls[i]['download_url']
    quizz_content = open(quizz_url).read
    quizz = YAML.load(quizz_content)

    quiz = Quiz.create!
    quiz.quizz_slug = quizz["quizz_slug"]
    quiz.quizz_name = quizz["quizz_name"]
    quiz.path = quizz["path"]
    quiz.played= false
    quiz.save
    puts "quiz “#{quizz['quizz_name']}” has been created!"

    quizz["questions"].each do |question|
      question["quiz_id"] = quiz.id
      new_question = Question.create!(question)
    end
    puts "#{quizz['questions'].size} questions have been created in the database!"


  end

  end

end
