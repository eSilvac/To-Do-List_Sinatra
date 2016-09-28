require 'sinatra'
require "make_todo"
load 'EdicionVariables.rb'



get '/' do
	redirect '/Bienvenido'
end

get '/Bienvenido' do
	@tareas = Tarea.all
	if @tareas.empty?
		erb :welcome
	else
		redirect '/home'
	end
end

post '/LogIn' do
	Tarea.create(params[:name])
	redirect '/home'
end

get '/home' do
	@ary = Tarea.all
	if @ary.empty?
		redirect '/Bienvenido'
	else
		erb :home
	end
end

post '/NuevaTarea' do
	erb :nuevaTarea
end

post '/nuevaTareaLista' do
	if params[:Cancelar] == "Si"
		redirect '/home'
	else
		Tarea.create(params[:Tarea])
		redirect '/home'
	end	
end

post '/Borrar' do
	Tarea.destroy(params[:borr])
	redirect '/home'
end

post '/Completar' do
	Tarea.update(params[:compl])
	redirect '/home'
end

post '/EditarTarea' do
	@ary = Tarea.all
	@pos = params[:posi]
	erb :editar
end

post '/CambioUser' do
	arr = Tarea.all
	i=0
	while i<arr.length
		nombre = arr[i]
		Tarea.destroy(nombre["id"])
		i+=1
	end

	redirect '/Bienvenido'
end


post '/Cambio' do
	if params[:Cancelar] == "Si"
		redirect '/home'
	else
		Edit.new(params[:Posicion].to_i , params[:Nuevo])
		redirect '/home'
	end

end