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


 

Installations
-------------

```
git clone https://github.com/mjenrungrot/cryptoTrader
cd cryptoTrader
bundle install
rails server
```

Issues
------

 

References
----------

- <https://www.coindesk.com/api/>
- <https://ruby-doc.org/stdlib-2.4.2/libdoc/net/http/rdoc/Net/HTTP.html>
 

Contributors
------------

Teerapat Jenrungrot

 
