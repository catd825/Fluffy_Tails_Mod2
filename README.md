README

User Story

1. User should be able to search for a pet.
2. User should be able to select a pet.
3. User should be able to favorite a pet.
4. User should be able to delete a favorite pet.
5. Pet should be able to be assigned to a location
6. Location should be able to modify pet.
7. Validate breed, pet form fields.


SETUP AND INSTALLATION 

1. This is a Rails application.  Please run:
```
bundle install
```
```
rails db:migrate
```
```
rails db:seed
```

2. This app uses the google api. You will need to either contact us for the key or generate one yourself and place it in the main app directory .env file.



You can view the full demo [here](https://www.youtube.com/watch?v=scLpLe3zIxI&feature=youtu.be) or try out the app on heroku [here](https://fluffy-tail.herokuapp.com/)

1. Create an account or sign in

![SignIn](https://j.gifs.com/4Q7GyJ.gif =100x100)

2. Login send user to their info page, which includes user info and favorite pets.  You can update your user info here.

![UserPage](https://j.gifs.com/715Vw8.gif)

3. Browse all pets on index page

![IndexPage](https://j.gifs.com/NLqWyN.gif)

4. View Individual Pet Info

![ShowPage](https://j.gifs.com/oVqX0A.gif)
