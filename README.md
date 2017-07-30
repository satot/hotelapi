# README

## Summary
This is a sample repository which returns a list of hotels with cheapest price among suppliers.

## API Info

### Endpoint
This api provides a single endpoint as follows assuming `GET` request.

https://hotelapi-k.herokuapp.com/v1/search

### Request params

| param | required | description | sample value |
| --- | --- | --- | --- |
| checkin | required | Specify date of check in in format of "YYYYMMDD" | 20170701 |
| checkout | required | Specify date of check out in format of "YYYYMMDD" | 20170704 |
| destination | required | Specify one destination with a name of city | Singapore |
| guests | required | Specify number of guests | 2 |
| suppliers | optional | Specify names of suppliers with comma separated format. If not specified, all available suppliers are queried | supplier1,supplier2 |

### Response

api returns a list of hotels avaliable against condition. Each hotel has following parameters

| param | description | sample value |
| --- | --- | --- |
| id |  Name of a hotel | abc |
| price | Price under conditions in SGD | 200.0 |
| supplier | Name of the supplier which provide the hotel with the price | supplier1 |

### Note

The result of api can be cached for at most 5 minutes. 
