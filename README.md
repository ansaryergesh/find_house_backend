# Find House Backend

You can find frontend of the application [here](https://github.com/ansaryergesh/find_house_frontend)

## Description

This is an API writen on Ruby on Rails for Find House project. Here are the project[requirements](https://www.notion.so/Final-Capstone-Project-Find-Your-House-backend-only-variant-f3581ebfeb3341deafd7617c5b9d934d). Used JSON Web Token Authentication for user controller.

## Models

API contains three models:

- User
- Home
- Favourite

### Install, Run and Build program

```
$ bundle install --without production

$ rake db:setup

$ rails db:migrate

$ rails s -p 3002

```

## Postman

Download Postman from [here](https://www.postman.com/downloads/) and using this application check how the RESTFull API works

## Route Paths

User Route(Authentication)

```
http://localhost:3002/api/v1/users (POST) -> Registration: create new user

http://localhost:3002/api/v1/login (POST) -> Login into the system

http://localhost:3002/api/v1/profile (GET) -> Get user information if it is logged in

```

Home Route

```
http://localhost:3002/api/v1/homes (GET) -> Returns all the homes

http://localhost:3002/api/v1/homes (POST) -> If user logged in, user can post home

```

Favourite Route

```
http://localhost:3002/api/v1/favourites (GET) -> Returns all the favourites if user logged in

http://localhost:3002/api/v1/favourites (POST) -> Add home in favourite list if user logged in

http://localhost:3002/api/v1/favourites/homeId (Delete) -> Delete home from favourite list by its id

```

## Check Testing

```
$ rspec

```

## Built With

- Ruby on Rails API
- JWT Auth Token

## Live Demo

[Live Demo](https://guarded-hamlet-33539.herokuapp.com/api/v1/profile)

## Author:

👤 **Ansar Yergeshov**

- Github: [@ansaryergesh](https://github.com/ansaryergesh)
- Twitter: [@ansaryergesh](https://twitter.com/ansaryergesh)
- Linkedin: [Ansar Yergeshov](https://www.linkedin.com/in/ansaryergesh/)
- Gmail: yergeshovansar@gmail.com

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
