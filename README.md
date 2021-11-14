# Tech Challenge

## Install reqs
For install the requirements please run `$ bundle`

## Starting up
For start the project please run `$ padrino start`

### Example Request
```
$ curl --location --request POST 'http://localhost:3000/user/info' \
--header 'Content-Type: application/json' \
--data-raw '{
    "first_name": "Jane",
    "last_name": "Doe",
    "drivers_license_number": "00002011"
}'
```
### Example success response
```
{
    "data": {
        "first_name": "Jane",
        "last_name": "Doe",
        "drivers_license_number": "00002011",
        "number_of_incidents": 1,
        "number_of_vehicles": 1
    },
    "message": null,
    "success": true
}
```
### Example error response

```
{
    "data": null,
    "error": "drivers_license_number is missing",
    "success": false
}
```

## Tests
For run tests please run `rspec`
