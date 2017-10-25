# Q0: Why is this error being thrown?
Because there is no Pokemon model/controller that exists as we haven't created it yet

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *
they are appearing because there are now pokemon in the database - the common factor between all of them is their name which appears and they are pokemon that we seeded into the database.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.
It creates a button that captures the path of the pokemon and submits to the url created by capture_path() and routes to the patch route to eventually initiate the capture method for the pokemon.

# Question 3: What would you name your own Pokemon?
MichelleisAwesomemon (idk tbh)

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?
I passed it the trainers page with the current trainer id which was what the path needed.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

you take the error parameter and then convert that into a sentence in order flash / display over the screen

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
