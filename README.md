# Vocabi

## Prerequisites

- Ruby 2.6.2
- rbenv
- Bundler

## Setup

1. Install PostgreSQL.

   ```console
   $ brew install postgresql
   ```

2. Install gems.

   ```console
   $ bundle install
   ```

3. Setup database.

   ```console
   $ bin/rails db:setup
   ```

4. Precompile assets.

   ```console
   $ bin/rails assets:precompile
   ```
