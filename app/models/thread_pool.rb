class ThreadPool
  def initialize(size)
    @size = size # number of threads allowed
    @jobs = Queue.new
    @pool = Array.new(@size) do |i|
      Thread.new do
        Thread.current[:id] = i
        catch(:exit) do #until :exit is thrown
          loop do #continuously take jobs and execute them
            job = @jobs.pop
            job.call
          end
        end
      end
    end
  end

  # add a job to queue
  def schedule(&block)
    @jobs << block
  end

  # run threads and perform jobs from queue
  def run!
    @size.times do
      schedule { throw :exit }
    end
    @pool.map(&:join)
  end
end