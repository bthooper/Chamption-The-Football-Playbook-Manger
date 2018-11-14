# Specifications for the Rails Assessment

Specs:  
- [x] Using Ruby on Rails for the project _This should be apparent._  
- [x] Include at least one has\_many relationship (x has\_many y e.g. User has\_many Recipes) _There are a few examples, but one is that a playbook has many plays. Also a user has many plays through their playoboks._  
- [x] Include at least one belongs\_to relationship (x belongs\_to y e.g. Post belongs\_to User) _A profile belongs to a user._  
- [x] Include at least one has\_many through relationship (x has\_many y through z e.g. Recipe has\_many Items through Ingredients)  _A user has many opponets through games, has many plays through playbooks._  
- [x] The "through" part of the has\_many through includes at least one user submittable attribute (attribute\_name e.g. ingredients.quantity)  _This is done in the games model, where the game has a date and a location, and an opponent. The games table serves as a join table for opponents and users._  
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) _There are a number of validations, but users has the most - validating the signup conent, has a name of a minimal length, email is present and unique, and formated correctly._   
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes   URL: /users/most_recipes)  _In the game model I have two scopes, to show only upcoming games and to sort them by date._  
- [x] Include signup (how e.g. Devise) _I did!_  
- [x] Include login (how e.g. Devise)  _I did!_   
- [x] Include logout (how e.g. Devise)  _Roger!_  
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) _I used omniauth to allow login via Facebook._    
- [x] Include nested resource show or index (URL e.g. users/2/recipes)  _I used nested resources for playbooks, games, plays, and oponents, all under user._  
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)  _See above_
- [x] Include form display of validation errors (form URL e.g. /recipes/new)  _Roger_

Confirm:  
- [X] The application is pretty DRY  
- [x] Limited logic in controllers  
- [x] Views use helper methods if appropriate  
- [X] Views use partials if appropriate 

