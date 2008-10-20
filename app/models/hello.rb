class Hello
  include DataMapper::Resource
  
  property :id, Serial
  property :name, String

  def say_hello
	  "Hello, my id is #{id}. My name is #{name}. I'm here to say 'Hello!'"
	end
end
