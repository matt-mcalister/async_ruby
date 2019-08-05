class App

  def self.find_media(term)
    results = {}
    results[:books] = Book.search(term)
    results[:movies] = Movie.search(term)
    results[:tv_series] = Tv.search(term)
    results
  end

  def self.compare(term)
    Benchmark.bm do |bm|
      bm.report("No Threads:") { self.find_media(term) }
    end
    puts "done"
  end

end
