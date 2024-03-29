## Overview
Welcome to Sweater Weather! This is a RESTful API, built in Ruby on Rails, that helps users plan road trips. This app will allow users to see the forecasted weather at the destination at the time of arrival.

In this service-oriented architecture application, the (theoretical) front-end team will communicate with this back-end application by making API calls. Sweater Weather exposes data in a JSON format, allowing users to create a new account (generating a unique API key), log-in, as well as show the travel time and forecasted weather at the destination. 

## Table of Contents
* [Overview](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#overview)
* [Local Setup](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#local-setup)
* [Setup Steps](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#setup-steps)
* [Running the Test Suite](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#running-the-test-suite)
* [Postman](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#postman)
* [Endpoints](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#endpoints)
  * [Create A New User](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#create-a-new-user)
  * [Login As A User](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#login-as-a-user)
  * [Roadtrip Weather Forecast](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#road-trip-weather-forecast)
* [Author](https://github.com/b-shears/Sweater-Weather/blob/main/README.md#author)
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

```
open_weather_api_key: <your_open_weather_api_key>
mapquest_api_key: <your_mapquest_api_key>
```
### Running the Test Suite
* Delete spec/fixtures/vcr_cassettes, then run bundle exec rspec

### Postman 
In your Terminal, run `rails s`
In Postman, set appropriate HTTP verb, append endpoint URI to `http://localhost:3000/`, and select `SEND`.
NOTE: For `post` requests, send a `JSON` payload in the body of the request in Postman. Under the address bar, click on `Body`, select `raw`, and from the dropdown that says Text, select `JSON`.

## Endpoints 
#### Create A New User  
* POST `/api/v1/users`
  *  A successful request creates a user in your database, and generates a unique api key associated with that user, with a 201 status code. The response should NOT include the password in any form
  *  An unsuccessful request returns a 422 status code and body with a description of why the request wasn’t successful. Potential reasons a request would fail: passwords don’t match, email has already been taken, missing a field, etc.
  * Example Request: (Create a new user)
  ```
  {
    "email": "turing56@turing.com",
    "password": "abc",
    "password_confirmation": "abc"
  }
  ```
  * Example Response:
  ``` 
  {
    "data": {
        "id": "4",
        "type": "user",
        "attributes": {
            "email": "turing56@turing.com",
            "api_key": "ca5446922105a6d91a851d22d79b6637"
        }
      }
   }
  ```
 #### Login As A User 
 * POST `/api/v1/sessions`
   *  A successful request returns the user’s api key.
   *  An unsuccessful request returns a 401 status code and body with a description of why the request wasn’t successful.
   *  Potential reasons a request would fail: credentials are bad, etc.
   
   * Example Request: (Log-in as an existing user)
    ```
    {
      "email": "turing56@turing.com",
      "password": "abc",
      "password_confirmation": "abc"
    }
    ```
    
   * Example Response: (returns existing users API key)
    
    ```
    {
      "data": {
          "id": "4",
          "type": "session",
          "attributes": {
              "email": "turing56@turing.com",
              "api_key": "ca5446922105a6d91a851d22d79b6637"
          }
       }
    }
    ```
 #### Road Trip Weather Forecast
 * POST `api/v1/roadtrip` 
   *  A successful request returns the origin of the road trip, the destination, the time to travel to the destination, and the  forecasted weather at the destination when you arrive 
   *  A unsuccessful request will return a 401 status code and body with a description of why the request wasn’t successful.
   *  Potential reasons a request would fail: User is unauthorized, must submit a valid API key 

 * Example Request: 
  ```
  {
    "origin": "Denver,CO",
    "destination": "Pueblo,CO",
    "api_key": "ca5446922105a6d91a851d22d79b6637"
  }
  ```
  
 * Example Response: 
 
 ``` 
 {
    "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "id": null,
            "origin": "Denver,CO",
            "destination": "Pueblo,CO",
            "travel_time": "1 hours, 45 minutes",
            "weather_at_destination": {
                "temperature": 85.14,
                "conditions": "clear sky"
            }
        }
    }
}
``` 
## Author
 **Bryan Shears** - [GitHub](https://github.com/b-shears) - [LinkedIn](https://github.com/b-shears)
