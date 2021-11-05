# MSAIP  

User manual for installing and starting the application

## Installing project

### Prerequisites:

- Installed [GIT CLI](https://git-scm.com/)
- Installed [Composer](https://getcomposer.org/download/)  
- Installed [NodeJS](https://nodejs.org/en/download/)  
- Installed [MySQL](https://www.apachefriends.org/index.html)

---

We are going to clone repo with command

```bash
git clone https://github.com/GaGiiiii/msaip/
```

We then open two terminals, and then in 1st type:

```bash
cd msaip
cd msaip-back
composer i
```

In the 2nd terminal we type:

```bash
cd msaip
cd msaip-front
npm i
```

With the commands above we have installed all the dependencies located in the composer.json and package.json files

---

## Starting project

### Database config

Before we start our application we will need to create local DBs with names 'msaip' and "msaip_test"  
Then in "msaip" we can import data from SQL file that is located inside 'msaip-back' directory called 'msaip.sql'  
We don't need to insert data into testing DB. Parameters for DB connection can be changed inside ".env" file located in "msaip-back" directory

### Starting backend

We are going to start backend from "msaip-back" directory with command:

```bash
php artisan serve
```

### Starting frontend

We are going to start frontend from "msaip-front" directory with command:

```bash
npm start
```
Application is listening for any changes in code and after every chnage app will restart automatically.

Backend works on [localhost:8000](http://localhost:8000/)   
Frontend works on [localhost:3000](http://localhost:3000/)  

## Starting Tests

For tests to execute we need to enter next command inside our 'msaip-back' directory:

```bash
php artisan test
```

## Documentation

### Below is the ER Model

![EER](./msaip-back/ER.png)

### Relation Model:  

---  
User(**id**, username, email, email_verified_at, password, remember_token, created_at, updated_at)  
Manufacturer(**id**, name, created_at, updated_at)  
M_Model(**id**, *manufacturer_id*, name, created_at, updated_at)  
Type(**id**, ***m_model_id, make_id***, created_at, updated_at)  
Make(**id**, name, created_at, updated_at)  
Saved_Car(**id**, ***user_id, type_id***, created_at, updated_at)

---

## API Documentation  

---

### Auth

--- 

#### Register

```http
POST /api/register
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `username` | `string` | **Required** Users username. |
| `email` | `string` | **Required** Users email. |
| `password` | `string \| min 4 chars` | **Required** Users password. |
| `password_confirmation` | `string` | **Required** Users confirmed password. |

#### Login

```http
POST /api/login
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `email` | `string` | **Required** Users email. |
| `password` | `string \| min 4 chars` | **Required** Users password. |

#### Logout

```http
POST /api/logout
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `token` | `string` | **Required** Users token. |

---

### Manufacturers

---

#### Get all manufacturers

```http
GET /api/manufacturers
```

---

### Models

---

#### Get all models

```http
GET /api/models
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `manufacturer` | `integer` | **Optional** ID of manufacturer to which model belongs to. |

### Types

---

#### Get all types

```http
GET /api/types
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `model` | `integer` | **Optional** ID of model to which type belongs to. |

### Saved cars

---

#### Get all saved cars

```http
GET /api/saved-cars
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `user` | `integer` | **Optional** ID of user to which car belongs to. |
| `type` | `integer` | **Optional** ID of type to which car belongs to. |


#### Add new saved car

```http
POST /api/saved-cars
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `type_id` | `integer` | **Required** ID of type to which saved car belongs to. |
| `token` | `string` | **Required** Users token. |

#### Delete saved car

```http
DELETE /api/saved-cars/${id}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `id` | `integer` | **Required** ID of saved car intended to delete. |
| `token` | `string` | **Required** Users token. |

---

## Responses

API returns a JSON response in the following format:

```javascript
{
  "message": string,
  "data": data,
  "errors?": array,
  "token?": string,
}
```
The `message` - attribute contains a message commonly used to indicate errors or, in the case of deleting a resource, success that the resource was properly deleted.

The `data` - attribute contains requested resource/s or processed resource. Eg. if we requsted to get all posts the data attr will look like this `"posts": array of posts`.  

The `errors` - attribute is optional and it contains error messages.

The `token` - attribute is optional and it will be returned when user logins or registers.

## Status Codes

API returns the following status codes:

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |





