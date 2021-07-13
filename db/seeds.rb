# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = []

250.times do
    begin
        users << User.create!(username:Faker::Internet.unique.username)
    rescue => e 
    end
end

p = Poll.create_poll(users.sample,"Movie Poll") 

    q = Question.create_question(p,"Which of these female characters with motorcycles looks coolest?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"William H. Macy and Marisa Tomei in Wild Hogs (2007)")
        choices << AnswerChoice.create_answer_choice(q,"Anne Hathaway in Ο σκοτεινός ιππότης: Η επιστροφή (2012)")
        choices << AnswerChoice.create_answer_choice(q,"Uma Thurman in Kill Bill Volume 1 (2003)")
        choices << AnswerChoice.create_answer_choice(q,"Rebecca Ferguson in Επικίνδυνη αποστολή: Η πτώση (2018)")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Best Art Films (1920-50s)")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Θωρηκτόν Ποτέμκιν (1925)")
        choices << AnswerChoice.create_answer_choice(q,"Η αυγή (1927)")
        choices << AnswerChoice.create_answer_choice(q,"Το Πάθος της Ζαν ντ' Αρκ (1928)")
        choices << AnswerChoice.create_answer_choice(q,"Ο Άνθρωπος με την Κινηματογραφική Μηχανή (1929)")
        choices << AnswerChoice.create_answer_choice(q,"Hrysi epohi (1930)")
        choices << AnswerChoice.create_answer_choice(q,"Le sang d'un poète (1932)")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Which of these films featuring a fictional film(s) is your favorite?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Κάποτε στο Χόλλυγουντ (2019)")
        choices << AnswerChoice.create_answer_choice(q,"ΑΚ εναντίον ΑΚ (2020)")
        choices << AnswerChoice.create_answer_choice(q,"Τροπική Καταιγίδα (2008)")
        choices << AnswerChoice.create_answer_choice(q,"Επιδρομή στο Χόλιγουντ (2001)")
        choices << AnswerChoice.create_answer_choice(q,"Ξέφρενες νύχτες (1997)")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

#<------p2

p = Poll.create_poll(users.sample,"Video Game Poll") 

    q = Question.create_question(p,"How would you want to horse around with your horse pal?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Play on the beach")
        choices << AnswerChoice.create_answer_choice(q,"Ride into battle")
        choices << AnswerChoice.create_answer_choice(q,"Go shopping")
        choices << AnswerChoice.create_answer_choice(q,"Eat snacks")
        choices << AnswerChoice.create_answer_choice(q,"Take a nap")
        choices << AnswerChoice.create_answer_choice(q,"Go fishing")
        choices << AnswerChoice.create_answer_choice(q,"Play dress-up")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end
    
    q = Question.create_question(p,"Which of these cat versions do you think would make you laugh the hardest?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Cat Bully")
        choices << AnswerChoice.create_answer_choice(q,"Cat Koopa Troopa")
        choices << AnswerChoice.create_answer_choice(q,"Cat Piranha Plant")
        choices << AnswerChoice.create_answer_choice(q,"Cat Goomba")
        choices << AnswerChoice.create_answer_choice(q,"Cat Conkdor")
        choices << AnswerChoice.create_answer_choice(q,"Cat Bullet Bill")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

#<------p3

p = Poll.create_poll(users.sample,"I'm Sorry, But You Have To Choose Between These 15 Comfort Foods And It's Really Hard") 

    q = Question.create_question(p,"Chicken noodle soup or tomato soup?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Chicken noodle soup")
        choices << AnswerChoice.create_answer_choice(q,"Tomato soup")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Mac 'n' cheese or spaghetti and meatballs?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Mac 'n' cheese")
        choices << AnswerChoice.create_answer_choice(q,"Spaghetti and meatballs")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Chicken and dumplings or pot roast?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Chicken and dumplings")
        choices << AnswerChoice.create_answer_choice(q,"Pot roast")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Ramen or udon?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Ramen")
        choices << AnswerChoice.create_answer_choice(q,"Udon")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Fried chicken or meatloaf?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Fried chicken")
        choices << AnswerChoice.create_answer_choice(q,"Meatloaf")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Steamed dumplings or toasted ravioli?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Steamed dumplings")
        choices << AnswerChoice.create_answer_choice(q,"Toasted ravioli")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Grilled cheese or pizza?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Grilled cheese")
        choices << AnswerChoice.create_answer_choice(q,"Pizza")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

#<------p4

p = Poll.create_poll(users.sample,"Where Do You Stand On These Controversial \"Harry Potter\" Opinions?") 

    q = Question.create_question(p,"Which is the better couple?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Charry (Cho and Harry)")
        choices << AnswerChoice.create_answer_choice(q,"Hinny (Ginny and Harry)")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Which professor do you prefer?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Professor Lupin")
        choices << AnswerChoice.create_answer_choice(q,"Professor Snape")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Who's your favorite twin?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Fred")
        choices << AnswerChoice.create_answer_choice(q,"George")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Which sweet sounds tastier?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Butter beer")
        choices << AnswerChoice.create_answer_choice(q,"Chocolate frogs")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Which sidekick reigns supreme?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Dobby")
        choices << AnswerChoice.create_answer_choice(q,"Hagrid")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end

    q = Question.create_question(p,"Which spell is superior?")

        choices = []
        choices << AnswerChoice.create_answer_choice(q,"Expelliarmus")
        choices << AnswerChoice.create_answer_choice(q,"Wingardium Leviosa")

        users.each do |user|
            begin
            Response.create_response(user,choices.sample) if rand(100)> 18
            rescue => e 
            end
        end




