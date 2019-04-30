# Kaseya

The Kaseya Ruby library provides convenient access to the Kaseya [BMS](https://www.kaseya.com/products/bms/) and [VSA](https://www.kaseya.com/products/vsa/) API's. The library is structured such that it can be used to manage multiple Kaseya tenants.

*Note: Not all API endpoints are implemented and more continue to be added as time permits.*

## Documentation

API documentation:
- BMS: https://bms.kaseya.com/api
- VSA: http://help.kaseya.com/webhelp/EN/restapi/9040000/index.asp

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kaseya'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kaseya

## Usage

To manage a BMS tenant, create a client by providing the required authentication parameters:

```ruby
bms = Kaseya::BMS.authenticate("bms.kaseya.com", "username", "password", "Company Name")

# get all accounts in the CRM
bms.accounts.all()
```

API methods are organized in the client based on the record type. For example, methods for creating/modifying/deleting contacts can be accessed through the `contacts` namespace:

```ruby
# get all contacts
bms.contacts.all()

# add a contact
bms.contacts.new(
    account_id: 2528,
    location_id: 3169,
    first_name: "Jane",
    last_name: "Doe",
    default_email_type_id: 1,
    default_email_address: "foo@example.com",
    default_phone_type_id: 1,
    default_phone_number: "5551234567")
```

### Parameters

In order to support an idiomatic Ruby experience, symbol parameters will be converted from snake-case to camel-case before being submitted to the API.

```ruby
bms.locations.new(
    account_id: 1,
    location_name: "California Office",
    addresses: [{
        address_1: "One Infinite Loop",
        city: "Cupertino",
        state: "CA",
        zip_code: "95014"
    }])
```

is equivalent to:

```ruby
bms.locations.new(
    "AccountId" => 1,
    "LocationName" => "California Office",
    "Addresses" => [{
        "Address1" => "One Infinite Loop",
        "City" => "Cupertino",
        "State" => "CA",
        "ZipCode" => "95014"
    }])
```

### Filtering, Sorting, Paging

Both the BMS and VSA API's use Odata expressions to specify filtering, sorting, and paging parameters. Where supported, these parameters can be passed as options using `skip`, `top`, `orderby`, and `filter` and the library will prepend the `$` before adding them to the query.

To query the second page of accounts where each page has 50 results:

```ruby
bms.accounts(top: 50, skip: 50)
```

Consult the documentation for details on which filtering expressions are supported and which properties support sorting.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Run all tests:

    bundle exec rake spec

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/huntresslabs/kaseya-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Kaseya project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/huntresslabs/kaseya-ruby/blob/master/CODE_OF_CONDUCT.md).
