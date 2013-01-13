Resque-task
===========
[![Gem Version](https://badge.fury.io/rb/resque-task.png)](http://badge.fury.io/rb/resque-task)

This is a gem designed to work with Resque (tested with >= 1.13.0) to facilitate easier enumeration.

Examples
--------

    class SomeClass
      def self.perform(name)
        raise
      end
    end
    
    Resque.enqueue(SomeClass, "Jared Fraser")
    
    Resque::Task.failed.each do |task|
      puts "Class: #{task.parent.to_s}"
      puts "Arguments: #{task.args.inspect}"
      puts "Failed at: #{task.failed_at}"
      puts "Status: #{task.status.inspect}"
    end
    
    => Class: SomeClass
    => Arguments: ["Jared Fraser"]
    => Failed at: 2011/05/26 08:45:59
    => Status: :failed


Todo
----
* TESTS
* A better name.