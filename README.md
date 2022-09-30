## Overview
Welcome to Sweather Weather! This Ruby on Rails API application helps plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

In this service-oriented architecture, the (theoretical) front-end team will communicate with this back-end application through an API. Sweater Weather exposes the API that satisfies the front-end team’s requirements.

## Table of Contents

## Local Setup 
This project requires:
 * `Ruby 2.7.4`
 * `Rails 5.2.8.1`

### Setup Steps
* Fork the repository
* Clone the repository
* Install gems and set up your database:
   * `bundle install`
   * `rails db:create`
   * `rails db:migrate`
* Install Figaro
   * `bundle exec figaro install`
* Update the `application.yml` file with `ENV` variables storing API keys for [MapQuest](https://developer.mapquest.com/documentation/geocoding-api/) and [OpenWeather](https://openweathermap.org/api/one-call-api)(pages for obtaining API keys linked)
### Running the Test Suite
##Contributor
 **Bryan Shears** - [GitHub](https://github.com/b-shears) - [LinkedIn](https://github.com/b-shears)
