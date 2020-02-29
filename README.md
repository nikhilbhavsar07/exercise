# README

Exercise the API app with user sign up/login/view& edit

1) POST /signup
Host: localhost:3000
Content-Type: application/json
Cache-Control: no-cache

{"user":{"name": "NIK", "email":"NIkhilbhavsar123@gmail.com", "password":"nikhil123", "password_confirmation":"nikhil", "city": "Pune" }}

2) Login
POST /login
Host: localhost:3000
Content-Type: application/json
Cache-Control: no-cache
data: {"email":"nikhilbhavsar07@gmail.com","password":"abcdefgh"}

response: 
headers: 'token':"random token from server" 
body:{
    "message": "Successfully logged in",
    "data": {
        "id": 2,
        "name": "Nikhil",
        "email": "nikhilbhavsar07@gmail.com",
         ...}
}

3) Update User details:
PUT /users/update
Host: localhost:3000
Content-Type: application/json
token: "....token...."
email: nikhilbhavsar07@gmail.com
{"user":{"name": "NiK", "email": "nikhilbhavsar123@gmail.com", "city": "Mumbai", "password": "nikhil123" }}



