FlexWork

Phase Three Project for Flatiron School's Software Engineering Bootcamp Program. This application allows a user to

create an Employer or Contractor account
create and take Tasks
accept Tasks, complete Tasks, close Tasks


Requirements

Ruby

Installation

Clone this repository into your developer environment, then install the required Ruby Gems using the following command:

bundle install
In order to populate the database with information, you'll need to first run the migration files, then seed the database using the following commands:

rails db:migrate
rails db:seed

Usage

This application uses Rails to run a local server. Type the following in your terminal:

rails s
With the server running, open up your favorite web browser and navigate to the following URL:

http://localhost:3000/
Sign up for an account on the Join page, and you're all set to create, view, or accept Tasks

Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

License

This Ruby on Rails project is available as open source under the terms of the MIT License.
