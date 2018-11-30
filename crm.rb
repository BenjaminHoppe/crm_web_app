require_relative 'contact'
require 'sinatra'

get '/home' do
  erb :index
end

get '/contacts' do
  @contact = Contact.all
  erb :contacts
end

get '/about' do
  erb :about
end


get '/contacts/:id' do
  @contact = Contact.find_by({id: params[:id].to_i})
  erb :show_contact
  if @contact
   erb :show_contact
 else
   raise Sinatra::NotFound
 end
end


after do
  ActiveRecord::Base.connection.close
end
