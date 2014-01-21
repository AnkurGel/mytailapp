#Tail App#
--------------

##Description##

This is a very simplistic demo employing **Faye**, a _pub-sub_ messaging system.   
**Tail App** performs the same operation as `tail -f foofile` does - It follows the tail by checking addition of content in a file and synchronously updating it in browser.   

##Installation##

* From the application's root directory:
  * Run `bundle install`    
  * Run `rackup faye.ru -s thin -E production `    
  * Run `rails server`   
  * Run `rake tail_follow`

* Open your application at `http://localhost:3000`   
* Start appending and saving your `foofile` in the application's root directory and watch it Tail!


