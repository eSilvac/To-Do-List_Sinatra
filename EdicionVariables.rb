require 'make_todo'
tareas = Tarea.all

class Edit
	attr_accessor :posi, :nuevo, :arr, :temp, :cont

	def initialize(pos,ne)
		@arr = Tarea.all
		@temp = @arr
		@posi = pos + 1 
		@nuevo = ne
		@cont = pos
		borrar
		crearNuevo
		crear
	end

	def borrar
		while @cont < @arr.length
			arreglo = @arr[@cont]
			if arreglo["done"] != true
				id = arreglo["id"]
				Tarea.destroy(id)
			end
			@cont+=1
		end
	end

	def crearNuevo
		Tarea.create(@nuevo)
	end

	def crear
		while @posi + 1 <= @temp.length
			arreglo = @temp[posi]
			if arreglo["done"] != true
				nombre = arreglo["title"]
				Tarea.create(nombre)
			end
			@posi+=1
		end
	end

end
