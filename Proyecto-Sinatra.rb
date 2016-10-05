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
		redirect '/to-do-list'
	end
end

post '/LogIn' do
	Tarea.create(params[:name])
	redirect '/to-do-list'
end

get '/to-do-list' do
	@ary = Tarea.all
	if @ary.empty?
		redirect '/Bienvenido'
	else
		erb :home
	end
end

post '/to-do-list/nueva-tarea' do
	erb :nuevaTarea
end

post '/nuevaTareaLista' do
	if params[:Cancelar] == "Si"
		redirect '/to-do-list'
	else
		Tarea.create(params[:Tarea])
		redirect '/to-do-list'
	end	
end

post '/Borrar' do
	Tarea.destroy(params[:borr])
	redirect '/to-do-list'
end

post '/Completar' do
	Tarea.update(params[:compl])
	redirect '/to-do-list'
end

post '/to-do-list/editar-tarea' do
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
		redirect '/to-do-list'
	else
		Edit.new(params[:Posicion].to_i , params[:Nuevo])
		redirect '/to-do-list'
	end

end