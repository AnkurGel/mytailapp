From the application's root directory:
Run `bundle install`
Run `rackup faye.ru -s thin -E production `
Run `rails server`
Run `rake tail_follow`

Open your application at `http://localhost:3000`
Start appending and saving your `foofile` in the application's root directory and watch it Tail!


