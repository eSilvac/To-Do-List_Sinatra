require 'make_todo'
tareas = Tarea.all

class Edit
	attr_accessor :posi, :nuevo, :arr, :temp, :cont

	def initialize(pos,ne)
		@arr = Tarea.all
		@posi = pos + 1 
		@cont = pos 
		@nuevo = ne
		todo
		
	end

	def todo
		@arr.shift
		i = 1
		@arr.each do |actual|
			if @cont == i
				Tarea.destroy(actual["id"])
				Tarea.create(@nuevo)
			else
				if actual["done"] != true
					id = actual["id"] 
					nombre = actual["title"]
					Tarea.destroy(id)
					Tarea.create(nombre)
				end
			end
			i+=1
		end
	end
end
