# Async Ruby

1. Overview of Asynchronous Programming
  a. What does it mean?
  b. Why is this useful?
  c. What are the downsides?
2. How do we accomplish Async/Concurrent Programming in Ruby?
  a. What are threads?
  b. How do we manage multiple threads?
  c. How do we limit the number of threads in use?

In order to practice:
1. Clone this repo and run `bundle install`
2. Open the file `example.env` and put in corresponding api keys from [OMDB API]() and [TVDB API]().
3. Remove "example" from `example.env` (ie file should be named simply `.env`).
4. Run `ruby tools/console.rb` to open an console and execute any code.

Resources:
* [Official Documentation](https://ruby-doc.org/core-2.5.0/Thread.html)
* Helpful Gems for concurrency, each with different applicable contexts:
  * [Parallel](https://github.com/grosser/parallel)
  * [Celluloid](https://github.com/celluloid/celluloid)
  * [Sidekiq](https://github.com/mperham/sidekiq/)
  * [Resque](https://github.com/resque/resque)
  * [Delayed Job](https://github.com/collectiveidea/delayed_job)
        
