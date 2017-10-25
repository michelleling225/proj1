class PokemonsController < ApplicationController
# Grab the id of the Pokemon from the parameters and set that Pokemon's trainer to be the current trainer logged in.
# What's great about Devise (the user authentication gem we already have set up) is that it predefines a method to give us the current user logged in - or in this case, current trainer. To grab the current trainer, use current_trainer. You can use this in controllers and views.
# Don't forget to save the changes to the Pokemon!!!
# Redirect to the home page
	def new
		@pokemon = Pokemon.new
	end 

	def create
		@pokemon = Pokemon.create(pokemon_params)
		@pokemon.update(health: 100, level: 1, trainer_id: current_trainer.id)
		
		if @pokemon.save
			redirect_to	trainer_path(id: current_trainer)
		else
			render "new"
			flash[:error] = @pokemon.errors.full_messages.to_sentence
		end 
		# redirect_to "/trainers/" + @pokemon.trainer_id.to_s
		# render current_trainer
	end 


	def capture
		
		@pokemon = params[:id]
		@currentPoke = Pokemon.find(@pokemon)
		@currentPoke.update(trainer_id: current_trainer.id)

		redirect_to root_path
	end 
	def damage

		@pokemon = params[:id]
		@currentPoke = Pokemon.find(@pokemon)
		@currentHealth = @currentPoke.health
		@currentHealth = @currentHealth - 10
		currentTrainer = @currentPoke.trainer_id.to_s
		if @currentHealth <= 0
			@currentPoke.destroy
			# redirect_to "/trainers/" + currentTrainer
			redirect_to trainer_path(current_trainer)
		else 
			@currentPoke.update(health: @currentHealth)
			# redirect_to "/trainers/" + @currentPoke.trainer_id.to_s
			redirect_to trainer_path(current_trainer)
		end 
	end 

	private
	def pokemon_params
		params.require(:pokemon).permit(:name)
	end 

end
