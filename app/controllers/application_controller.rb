require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :'../views/super_hero'
    end

    post '/superheros' do
        @team = Team.new(params[:team])

        params[:team][:members].each {|details| Superhero.new(details)}
        @heros = Superhero.all

        erb :'../views/team'
    end
end
