class DirectorsController < ApplicationController
  
  def index
    @list_of_directors = Director.all
    render({ :template =>  "directors_template/index.html.erb"})
  end

  def eldest
    @oldest = Director.where.not({ :dob => nil }).order({ :dob => :asc }).at(0)
    render({ :template => "directors_template/eldest.html.erb"})
  end

  def youngest
    @youngest = Director.order({ :dob => :desc }).at(0)
    render({ :template => "directors_template/youngest.html.erb"})
  end

  def director_details
    director_id = params.fetch("id")
    @the_director = Director.where({ :id => director_id}).at(0)

    render({ :template => "directors_template/director_details.html.erb"})
  end
end
