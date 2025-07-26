# HashMap

Created as part of the The Odin Project curriculum.

Functionality includes:

#hash(key) takes a key and produces a hash code with it.

#set(key, value) takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten/updated.

#get(key) takes one argument as a key and returns the value that is assigned to this key. If key is not found, return nil.

#has?(key) takes a key as an argument and returns true or false based on whether or not the key is in the hash map.

#remove(key) takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.

#length returns the number of stored keys in the hash map.

#clear removes all entries in the hash map.

#keys returns an array containing all the keys inside the hash map.

#values returns an array containing all the values.

#entries returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]