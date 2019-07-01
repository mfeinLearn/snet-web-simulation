========================== NOTES: (find) ==========================
========================== NOTES: (find) - end ==========================






        ========================== NOTES: (find) ==========================
-------------
find - if no record is found nil is returned
find_by - If no record is found, returns nil.
find_by_id - nil
-------------
The difference is what they return when a record is found, or when it's not found. Consider the following examples:

>> User.create name: 'THE USER' # creates a user with id = 1
>> User.find(1) # returns the user
>> User.find_by_id(1) # returns the user
>> User.where(id: 1).first # returns the user
-------------
As you can see, an existing user can be fetched using any of the 3 methods. The big difference with using where is you can chain commands (of course, without calling first first.)

Let's have a look at when you try to find a record that isn't existing

>> User.find(2) # raises an exception
>> User.find_by_id(2) # nil
>> User.where(id: 2).first # nil

UPDATE

Rails 4 uses the following syntax for find_by
>> User.find_by(id: 1)  # returns nil if there's no user with an id of 1
>> User.find_by!(id: 1) # raises ActiveRecord::RecordNotFound when no record is found

      ========================== NOTES: (find) - end ==========================
