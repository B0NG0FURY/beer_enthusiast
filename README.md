# Beer Enthusiast

Beer Enthusiast is a Rails web app that allows the user to keep track of and explore beers, view ratings and comments from different users who have tried the beer, contribute their own ratings, and add new beers to the application. 

## Installation
Fork and clone this repo.

Run 'bundle install'

Run 'rake db:migrate' to start the database and 'rake db:seed' to add some beers and breweries to it.

## Usage
Upon visiting the root page the user can explore all the beers that have been added to the application so far, but in the beginning there won't be any reviews yet so to begin reviewing beers the user will have to sign up.

Click on 'Sign Up' in the top right corner of the header and enter a username and password.

While logged in the user can visit a beers page and can review that beer by clicking "Add Review" undeneath the beer's information. Once reviewed a user cannot add another review for that beer they can only edit their existing review. The user can edit their review by either clicking "Edit" underneath their review on the beers show page or in the user's collection page. If the user for some reason wants to delete their review they need to click the "Edit" button and on that page at the bottom will be a button to delete the review.

If the user has tried a beer that isn't on the application yet and wants to add it they can go to their profile page by logging in or clicking their username on the top right of the header and clicking "Add Beer". 

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT]((https://choosealicense.com/licenses/mit/)
