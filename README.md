# Gameball Python SDK
The Gameball Python SDK provides convenient access to the Gameball API from applications written in the Python language.

## Documentation

Please refer to the  [Gameball API docs](https://docs.gameball.co).

## Installation

You don't need this source code unless you want to modify the SDK. If you just
want to use the SDK, just run:

```sh
pip install --upgrade stripe
```

Install from source with:

```sh
python setup.py install
```

### Requirements

-   Python 2.7+ or Python 3.4+ (PyPy supported)

## Usage

The SDK needs to be configured with your account's API & Transaction keys available in your [Gameball Dashboard](https://help.gameball.co/en/articles/3467114-get-your-account-integration-details-api-key-and-transaction-key)

```python
import stripe
stripe.api_key = "sk_test_..."
```

### Example

#### Sending an Event

```python
import stripe
stripe.api_key = "sk_test_..."

# list customers
customers = stripe.Customer.list()

# print the first customer's email
print(customers.data[0].email)

# retrieve specific Customer
customer = stripe.Customer.retrieve("cus_123456789")

# print that customer's email
print(customer.email)
```

### Handling exceptions

Unsuccessful requests raise exceptions. The raised exception will reflect the sort of error that occurred with appropriate message and error code . Please refer to the  [Gameball API docs](https://docs.gameball.co).

## Contribution
The master branch of this repository contains the latest stable release of the SDK.

## Contact
For usage questions\suggestions drop us an email at support[ at ]gameball.co. Please report any bugs as issues.