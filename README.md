# Async Ruby

0. Hello me am matt
    a. Used to be a tcf, now a dev at V+V
    b. We're going to go over something that I think is fun
    c. Don't assume that all of the patterns you see here today are in anyway _the_ way to solve a problem. The overall goal for today is to introduce you to the topic of concurrent ruby code. In fact, you'll see some patterns that are definitely not ideal, which I may point out, patterns that I created to create a problem worth solving with Threads.
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

    * Official Documentation [https://ruby-doc.org/core-2.5.0/Thread.html]
    * Helpful Gems for concurrency, each with different applicable contexts:
        * Parallel [https://github.com/grosser/parallel]
        * Celluloid [https://github.com/celluloid/celluloid]
        * Sidekiq [https://github.com/mperham/sidekiq/]
        * Resque [https://github.com/resque/resque]
        * Delayed Job [https://github.com/collectiveidea/delayed_job]
        
