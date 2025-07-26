# Acme Basket (Ruby)

A proof-of-concept shopping basket system built for **Acme Widget Co**, supporting flexible delivery rules and promotional offers. Designed for clarity, extensibility, and testability.

---

##  Features

- Add products by code (`R01`, `G01`, etc.)
- Calculate accurate totals including:
  - **Tiered delivery charges**
  - **Buy-one-get-one-half-off** promotions
- Extensible offer system using **Strategy Pattern**
- Lightweight and testable — no frameworks required
- Built with clean, modular Ruby and RSpec tests

---

##  Product Catalog

| Product        | Code | Price   |
|----------------|------|---------|
| Red Widget     | R01  | $32.95  |
| Green Widget   | G01  | $24.95  |
| Blue Widget    | B01  | $7.95   |

---

##  Delivery Charges

| Basket Total      | Delivery Fee |
|-------------------|--------------|
| `< $50`           | $4.95        |
| `$50 – $89.99`    | $2.95        |
| `≥ $90`           | Free         |

---

##  Promotions

Current offer:

> **Buy one Red Widget (R01), get the second at half price.**

Applies to each **pair** of `R01` items.

---

##  Setup Instructions

1. **Clone the repository:**

```bash
git clone https://github.com/arvinddagar/acme-basket.git
cd acme-basket
```

2. **Install dependencies:**

```bash
bundle install
```

>  Ensure you are using **Ruby 3.2.2 ** 

---

##  Running the Application

You can run an example basket scenario using:

```bash
ruby main.rb
```

###  Example Output:

```
Total: $77.33
```

You can modify the products added in `main.rb` to try different combinations:

```ruby
%w[R01 R01 G01].each { |code| basket.add(code) }
```

---

##  Running Tests

This project uses **RSpec** for unit testing.

To run all tests:

```bash
bundle exec rspec
```

###  Example Output:

```
Basket
  returns correct total for R01, R01
  returns correct total for B01, G01
  returns correct total for B01, B01, R01, R01, R01

Finished in 0.02 seconds
3 examples, 0 failures
```

---

##  Design Highlights

-  **Separation of Concerns**  
  Products, pricing rules, delivery logic, and offers are modular and independent.

-  **Extensible Offer System**  
  Easily add new promotions by implementing a new offer class under `lib/offers/`.

-  **Accurate Floating-Point Math**  
  Discounts and totals avoid premature rounding; rounding is applied only once at the end.

-  **Test Coverage**  
  Core use cases and pricing scenarios are covered in RSpec with meaningful example cases.

---

##  Project Structure

```
acme_basket/
├── lib/                # Main app code
│   ├── basket.rb
│   ├── product.rb
│   ├── delivery_rules.rb
│   └── offers/
│       └── buy_one_get_half.rb
├── spec/               # RSpec test suite
│   ├── basket_spec.rb
│   └── offers/
│       └── buy_one_get_half_spec.rb
├── main.rb             # Example runner
├── Gemfile             # Dependencies
├── README.md
```

---

##  Assumptions

- The product catalog is static and passed in on initialization.
- Offers are applied independently (no stacking).
- Final price is rounded to 2 decimal places after all calculations.

---

##  Developer Notes

To test new baskets:

- Modify product codes in `main.rb`
- Or write custom test cases in `spec/basket_spec.rb`

To add new promotions:

- Create a new class under `lib/offers/`
- Implement the `apply(items)` method
- Pass the new offer into the `Basket` initializer

---
