class ActorsController < ApplicationController
  def index
    @list_of_actors = Actor.all
    render({ :template => "actors_template/index.html.erb"})
  end

  def actor_details
    actor_id = params.fetch("id")
    @the_actor = Actor.where({ :id => actor_id}).at(0)
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
    @list_of_characters = Character.where(:actor_id => actor_id)
    render({ :template => "actors_template/actor_details.html.erb"})
  end
end
