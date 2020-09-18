# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
* A gathering has many prayers
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
* A gathering belongs to a host 
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
* A gathering has many users through prayers
* A user has many gatherings through prayers
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
* A gathering has many users through prayers
* A user has many gatherings through prayers
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
* a prayer has title and content
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
* User model validates name and email address to be present
* Gathering model validates the meeting date is in the future and has address
* Prayers cannot be blank.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
* Gatherings are sorted by date/time
* For the prayers, the gatherings are sorted by date/time and if they are in the future
- [x] Include signup (how e.g. Devise)
* User signs up with normal route or omniauth with securerandom password.
- [x] Include login (how e.g. Devise)
* User logs in using sessions controller
- [x] Include logout (how e.g. Devise)
* Sessions controller destroy route.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
* Signup/login through facebook
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
* Includes gatherings/:gathering_id/prayers index and show page
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
* Includes gatherings/:gathering_id/prayers/new route
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
* Includes validation errors in form
Confirm:
- [x] The application is pretty DRY
* Pretty dry
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
* Used helper method in prayers helper and application helper method for logged_in? and current user
- [x] Views use partials if appropriate
* Used partials for new and edit gatherings and prayers