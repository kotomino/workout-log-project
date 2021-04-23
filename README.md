# PR Jounral Sinatra App

PR Journal is a Sinatra web app that allows users to track their workout goals and personal records in one place. The app helps users visualize their fitness milestones, making their progress more tangible. Logging your achievements is the key to mindful and deliberate success.

Find the app hosted on Heroku here: https://pr-journal.herokuapp.com/


### Preview

![Screen Shot 2021-04-23 at 11 28 05 AM](https://user-images.githubusercontent.com/73256077/115894263-105ad480-a427-11eb-9243-c5ee6a149af0.png)

## Installation

 1. Clone the project's GitHub Repository into your desired directory.
 ```
 $ git clone git@github.com:kotomino/workout-log-project.git
 ```
2. Run bundle install inside the project directory.
``` 
$ bundle install
```
3. Create and migrate the databse using rake.
```
$ rake db:create
$ rake db:migrate
```

## Usage
1. Run shotgun in terminal inside the project folder.
```
$ shotgun
```
2. Navigate to your browser and enter shotgun's localhost server (default: localhost:9393).

3. Signup and create a user account.

