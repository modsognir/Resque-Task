require 'active_support'
require 'resque'

module Resque
  class Task
    attr_accessor :parent, :args
    attr_accessor :queue, :payload, :exception, :error, :backtrace, :worker
    attr_accessor :run_at, :failed_at, :retried_at
    
    def initialize(options={})
      options['parent'] = options.delete('class')
      options.each do |opt, val|
        self.send("#{opt}=", val)
      end
      if payload
        self.parent = payload['class']
        self.args = payload['args']
      end
    end
    
    def parent
      @parent.constantize
    end

    class << self
      def failed(finish=10000)
        Resque::Failure.all(0, finish).map {|failure| Resque::Task.new(failure) }
      end
      
      def working(finish=10000)
        Resque.working.map {|task| Resque::Task.new(task.job) }
      end
      
      def queued(finish=10000)
        Resque.queues.map {|e| Resque.peek(e, 0, finish) }.flatten.map {|task| Resque::Task.new(task) }
      end
    end
  end
end
