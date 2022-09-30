## Overview
Welcome to Sweather Weather! This Ruby on Rails API application helps plan road trips. This app will allow users to see the current weather as well as the forecasted weather at the destination.

In this service-oriented architecture, the (theoretical) front-end team will communicate with this back-end application through an API. Sweater Weather exposes the API that satisfies the front-end team’s requirements.

## Table of Contents
* [Overview]
* [Local Setup]
* [Setup Steps]
* [Running the Test Suite]
* [Postman]
* [Endpoints]
  * [Create A New User]
  * [Login As A User]
  * [Roadtrip Weather Forecast]
* [Contributor]
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
 * A successful request returns the origin of the road trip, the destination, the time to travel to the destination, and the forecasted weather at the destination when you arrive 
 * A unsuccessful request will return a 401 status code and body with a description of why the request wasn’t successful.
 * Potential reasons a request would fail: User is unauthorized, must submit a valid API key 

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
## Contributor
 **Bryan Shears** - [GitHub](https://github.com/b-shears) - [LinkedIn](https://github.com/b-shears)
