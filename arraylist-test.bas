#include once "fb-calg.bi"

sub show( al as ArrayList ptr )
  for i as integer = 0 to al->length - 1
    ? *cast( long ptr, al->data_[ i ] )
  next
end sub

dim as long v1 = 1, v2 = 2, v3 = 3, v4 = 4

var al = arraylist_new( 0 )

arraylist_append( al, @v1 )
arraylist_append( al, @v2 )
arraylist_append( al, @v3 )

? "Values inserted so far:"
show( al )

? "Prepending a value to the start of the list..."
arraylist_prepend( al, @v4 )

show( al )

? "Removing a value..."
arraylist_remove( al, 2 )

show( al )

? "Freeing pointer..."
arraylist_free( al )

? "Done!"

sleep()

