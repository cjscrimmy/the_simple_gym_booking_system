require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/lesson')
also_reload( '../models/*' )

get "/lessons" do #index
    @lessons = Lesson.all()
    erb(:"lessons/index")
end

#methods for adding a new lesson
get "/lessons/new" do #new
    erb(:"lessons/new")
end

post "/lessons" do #create
    @lesson = Lesson.new( params )
    @lesson.save()
    redirect to "/lessons"
end
#####

get "/lessons/:id" do #show
    @lesson = Lesson.find_by_id(params['id'].to_i)
    erb(:"lessons/show")
end