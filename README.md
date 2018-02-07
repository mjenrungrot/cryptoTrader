Crypto Trader
=============

 

Summary
-------

*CryptoTrader* is a simple Rails application that allows users to trade Bitcoin
in simulation using the real-time prices. The purpose of *CryptoTrader* is to allow people
who do not yet have experiences in cryptocurrency or are afraid of trading in cryptocurrency
be exposed to trading Bitcoin, which is essentially the majority proportion of cryptocurrency
in the current market.

*CryptoTrader* application obtains a price of Bitcoin minutely from a Coindesk's API (https://www.coindesk.com/).
To use *CryptoTrader*, users need to signup using an ID and password. Once signed up, each user 
will have 1,000,000 USD, and a user can exchange his/her own USD with Bitcoin (BTC) and vice versa. 
Users' portfolio and order history are kept in the database and will be shown to the users once
they login to the application.


Targeted users
--------------

-   Users who do not have experiences in trading cryptocurrency.


MVP description
---------------

The MVP of *CryptoTrader* is an application that is able to do the followings:

-   Track and display the real-time prices of Bitcoin (BTC) vs USD using Coindesk's API.
-   Allow users to login to the system.
-   Show user's portfolio and order history from the database.
-   Allow users to trade Bitcoin with USD and vice versa.

Functionality
-------------

*CryptoTrader* is an application that allows users to exchange Bitcoin (BTC) with US Dollars (USD). The application has these following core functionalities:
- __Signup/Login__ - Users are able to signup with email and password and use these credentials to login to the application. Each registered user starts with 1,000,000 USD. 
- __Order history__ - Users are able to look at their own history of executed orders. 
- __Portfolio__ - Users are able to look at the USD and BTC allocations they currently have.
- __Trader__ - Users are able to trade between USD and BTC using a simple HTTP POST request. The trader also has a validator that validates if the order is valid (e.g. checking if users have enough USD or BTC).

Installations
-------------

```
git clone https://github.com/mjenrungrot/cryptoTrader
cd cryptoTrader
gem install bundler
bundle install
rake db:migrate
rails server
```

Issues
------
The view of the Portfolio page has an issue of being not able to show correctly if the database of orders is empty, e.g. having not yet started trading. The issue is based on the fact that the view of Portfolio page iterates over the attributes of the first entry of the Order database to show the head of the table. 
 

References
----------

- Rails Tutorial <https://www.railstutorial.org/book>
- Coindesk API <https://www.coindesk.com/api/>
- Net library for Ruby <https://ruby-doc.org/stdlib-2.4.2/libdoc/net/http/rdoc/Net/HTTP.html>
 

Contributors
------------

Teerapat Jenrungrot

 
