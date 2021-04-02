creating migration

bins/rails generate migration add_discount_cents_to products (discount is column) 

bin/rake db:migrate - runs latest migratuion

bin/rake db:rollback - goes back one migration. Run twice to go back two migrations

Migration history
Error message for pending migrations