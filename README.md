# Flight Booker

Building one-way flight booker for practicing nested forms.

live at: https://xajx.alwaysdata.net/flight-booker

## how to run locally:

requirements: rails, bundler gem, sqlite3 or postgresql depending on the branch

1. clone the repo:
    ```sh
      git clone git@github.com:XAJX179/flight-booker.git
    ```

1. install gems using bundler:
    ```sh
      bundle install
    ```

1. create,migrate and seed database:
    ```sh
      rails db:create
      rails db:migrate
      rails db:seed:replant
    ```

1. start server:
    ```sh
      rails server
    ```

1. go to https://localhost:3000/
