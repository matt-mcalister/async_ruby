require_relative '../config/environment.rb'

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

  def find_media(term)
    results = {}
    results[:books] = Book.search(term)
    results[:movies] = Movie.search(term)
    results[:tv_series] = Tv.search(term)
    results
  end

  def compare(term)
    Benchmark.bm do |bm|
      bm.report("No Threads:") { find_media(term) }
    end
    puts "done"
  end

binding.pry
puts 'goodbye'
