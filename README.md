# Rails Currency Graphs

Displays a chart, using chartkick + highcharts, for three different currencies:

* Bitcoin
* Ethereum
* Nasdaq Composite Index

We use some apis to each type of currency:

* Bitcoin

Using quandl.com api using quandl gem to consume it

* Ethereum

Using cryptocompare.com api and httparty gem to consume it

* Nasdaq

Using quandl.com api using quandl gem to consume it

# Usage

To run the project

```sh
$ bundle install
$ rails s
```

To run the tests

```sh
$ rake spec
```
