# Async Ruby

1. Overview of Asynchronous Programming
    a. What does it mean?
    b. Why is this useful?
    c. What are the downsides?
2. Threads
    a. Introduce the Thread class
    b. Show simple example with sleep and puts statements
    c. Move into real example with searching 3 different apis.
3. Movie.search_with_threads
    a. run through current method
    b. EITHER code along or pair through solution.
4. ThreadPool overview
    a. what could be a problem with having a variable number of threads?
    c. Solution: threadpool.

Resources:
* [Official Documentation](https://ruby-doc.org/core-2.5.0/Thread.html)
* Helpful Gems for concurrency, each with different applicable contexts:
  * [Parallel](https://github.com/grosser/parallel)
  * [Celluloid](https://github.com/celluloid/celluloid)
  * [Sidekiq](https://github.com/mperham/sidekiq/)
  * [Resque](https://github.com/resque/resque)
  * [Delayed Job](https://github.com/collectiveidea/delayed_job)
        
