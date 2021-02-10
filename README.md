# README

Hi! I'm Mateo and in this project you can find my simple approach to solve the given exercise.

For this project I'm using `ruby 2.6.6` and `rails 6.0.3`.
Be sure you have your environment set up for those technologies.

After download the repository you need to setup your database. You can do it following this steps:

    rails | rake db:create

    rails | rake db:migrate

Running just those two commands, your database will be ready.

Also we need to load some data into our database, for the sake purpose of the exercise.
To do this you need to run the following commands:

    rake init:load_data
    rake disbursement:generate

> I assumed the disbursements were already created on the DB, due there is a job running every Monday to generate them.

The API endpoint to obtain the disbursements is

    http://localhost:3000/disbursements?week=&year=

You need no specify the week of the year (from 1 to 52/53) and the year ( yyyy).  Also you can get the disbursement for a specify merchant adding to the params `merchant_id`. If `merchant_id` is blank, it will bring all the disbursements for that date.
