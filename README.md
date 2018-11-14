# Jungle

A mini e-commerce application built with Rails 4.2 integrating stripe for payment processing. The project includes a user mailer, Sass for styling and PostgreSQL for the database.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Sass-Rails 5.x
* jQuery
* BootStrap

## Screenshots

![The home page of Jungle](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/home_page.png "Jungle's home page")

![An item's detailed description](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/item_page.png "A detailed item description")

![An item's review section](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/reviews.png "An items review section")

![The cart page](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/cart.png "Jungle's cart")

![Stripe's payment module](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/stripe.png "Stripes payment widget")

![The completed orders page](https://raw.githubusercontent.com/MaxHalleran/jungle-rails/master/public/screenshots/processed_order.png "A completed order")
