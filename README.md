# Introduction:
## Learning Goals
* Plan an arrangement of models which utilize balanced, one-to-many, and many-to-numerous connections 
* Practice mixing HTML, CSS, and Rails templates to create an inviting and usable User Interface
* Separate duties between segments of the Rails stack 
* Build a logical user-flow that moves across multiple controllers and models

## Getting Started
1. Create "dinner_dash" repository on github
2. Create rails 5.2.3 dinner_dash project using postgresql databast
3. Configure all the postgresql requirement
4. Add enviorment variable in application.yml format in application.example.yml
5. Work on branches and use pull requests to review and merge code

## Models
1. In User we have Admin and Customer implemented by using STI
2. Item
3. Order
4. Line_Item used as a bridge between Item and user
5. Catagories
6. Item_Category used as bridge between Item and category
7. Cart
8. Cart_Item used as a bridge between Cart and Item

## Relations
1. User and Order many-to-many
2. User and Cart one-to-one
3. Order and Item many-to-many
4. Cart and Item many-to-many
5. Item and Category many-to-many

## Gems
1. Devise for User Authentication
2. Pundit for Authorization
3. Latter Opener for email review
4. Byebug for Debugging
5. Bootstrap for enhancing UI
6. Faker to produce seed data


## Dinner Dash Setup for new machine
1. Use Git clone to clone the repository to the local machine
2. Bundle install
3. Use rake db/setup to create db and seed add into it
4. Start server using rails s
5. Run loaclhost:3000 
6. Sign up as a customer it will generate email to your verified account confirm it and move towards login.
7. View Items and add in cart and place your order and wait for order delivery :)
