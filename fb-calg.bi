#pragma once

#include once "crt/long.bi"

#inclib "calg"

extern "C"

#define LIBCALG_H
#define ALGORITHM_COMPARE_INT_H
declare function int_equal(byval location1 as any ptr, byval location2 as any ptr) as long
declare function int_compare(byval location1 as any ptr, byval location2 as any ptr) as long
#define ALGORITHM_COMPARE_POINTER_H
declare function pointer_equal(byval location1 as any ptr, byval location2 as any ptr) as long
declare function pointer_compare(byval location1 as any ptr, byval location2 as any ptr) as long
#define ALGORITHM_COMPARE_STRING_H
declare function string_equal(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_compare(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_nocase_equal(byval string1 as any ptr, byval string2 as any ptr) as long
declare function string_nocase_compare(byval string1 as any ptr, byval string2 as any ptr) as long
#define ALGORITHM_HASH_INT_H
declare function int_hash(byval location as any ptr) as culong
#define ALGORITHM_HASH_POINTER_H
declare function pointer_hash(byval location as any ptr) as culong
#define ALGORITHM_HASH_STRING_H
declare function string_hash(byval string_ as any ptr) as culong
declare function string_nocase_hash(byval string_ as any ptr) as culong
#define ALGORITHM_ARRAYLIST_H
type ArrayListValue as any ptr
type ArrayList as _ArrayList

type _ArrayList
   data_ as ArrayListValue ptr
   length as long
   _alloced as long
end type

type ArrayListEqualFunc as function(byval value1 as ArrayListValue, byval value2 as ArrayListValue) as long
type ArrayListCompareFunc as function(byval value1 as ArrayListValue, byval value2 as ArrayListValue) as long
declare function arraylist_new(byval length as long) as ArrayList ptr
declare sub arraylist_free(byval arraylist as ArrayList ptr)
declare function arraylist_append(byval arraylist as ArrayList ptr, byval data_ as ArrayListValue) as long
declare function arraylist_prepend(byval arraylist as ArrayList ptr, byval data_ as ArrayListValue) as long
declare sub arraylist_remove(byval arraylist as ArrayList ptr, byval index as long)
declare sub arraylist_remove_range(byval arraylist as ArrayList ptr, byval index as long, byval length as long)
declare function arraylist_insert(byval arraylist as ArrayList ptr, byval index as long, byval data_ as ArrayListValue) as long
declare function arraylist_index_of(byval arraylist as ArrayList ptr, byval callback as ArrayListEqualFunc, byval data_ as ArrayListValue) as long
declare sub arraylist_clear(byval arraylist as ArrayList ptr)
declare sub arraylist_sort(byval arraylist as ArrayList ptr, byval compare_func as ArrayListCompareFunc)
#define ALGORITHM_AVLTREE_H

type AVLTree as _AVLTree
type AVLTreeKey as any ptr
type AVLTreeValue as any ptr
const AVL_TREE_NULL = cptr(any ptr, 0)
type AVLTreeNode as _AVLTreeNode

type AVLTreeNodeSide as long
enum
   AVL_TREE_NODE_LEFT = 0
   AVL_TREE_NODE_RIGHT = 1
end enum

type AVLTreeCompareFunc as function(byval value1 as AVLTreeValue, byval value2 as AVLTreeValue) as long
declare function avl_tree_new(byval compare_func as AVLTreeCompareFunc) as AVLTree ptr
declare sub avl_tree_free(byval tree as AVLTree ptr)
declare function avl_tree_insert(byval tree as AVLTree ptr, byval key as AVLTreeKey, byval value as AVLTreeValue) as AVLTreeNode ptr
declare sub avl_tree_remove_node(byval tree as AVLTree ptr, byval node as AVLTreeNode ptr)
declare function avl_tree_remove(byval tree as AVLTree ptr, byval key as AVLTreeKey) as long
declare function avl_tree_lookup_node(byval tree as AVLTree ptr, byval key as AVLTreeKey) as AVLTreeNode ptr
declare function avl_tree_lookup(byval tree as AVLTree ptr, byval key as AVLTreeKey) as AVLTreeValue
declare function avl_tree_root_node(byval tree as AVLTree ptr) as AVLTreeNode ptr
declare function avl_tree_node_key(byval node as AVLTreeNode ptr) as AVLTreeKey
declare function avl_tree_node_value(byval node as AVLTreeNode ptr) as AVLTreeValue
declare function avl_tree_node_child(byval node as AVLTreeNode ptr, byval side as AVLTreeNodeSide) as AVLTreeNode ptr
declare function avl_tree_node_parent(byval node as AVLTreeNode ptr) as AVLTreeNode ptr
declare function avl_tree_subtree_height(byval node as AVLTreeNode ptr) as long
declare function avl_tree_to_array(byval tree as AVLTree ptr) as AVLTreeValue ptr
declare function avl_tree_num_entries(byval tree as AVLTree ptr) as long
#define ALGORITHM_BINARY_HEAP_H

type BinaryHeapType as long
enum
   BINARY_HEAP_TYPE_MIN
   BINARY_HEAP_TYPE_MAX
end enum

type BinaryHeapValue as any ptr
const BINARY_HEAP_NULL = cptr(any ptr, 0)
type BinaryHeapCompareFunc as function(byval value1 as BinaryHeapValue, byval value2 as BinaryHeapValue) as long
type BinaryHeap as _BinaryHeap
declare function binary_heap_new(byval heap_type as BinaryHeapType, byval compare_func as BinaryHeapCompareFunc) as BinaryHeap ptr
declare sub binary_heap_free(byval heap as BinaryHeap ptr)
declare function binary_heap_insert(byval heap as BinaryHeap ptr, byval value as BinaryHeapValue) as long
declare function binary_heap_pop(byval heap as BinaryHeap ptr) as BinaryHeapValue
declare function binary_heap_num_entries(byval heap as BinaryHeap ptr) as long
#define ALGORITHM_BINOMIAL_HEAP_H

type BinomialHeapType as long
enum
   BINOMIAL_HEAP_TYPE_MIN
   BINOMIAL_HEAP_TYPE_MAX
end enum

type BinomialHeapValue as any ptr
const BINOMIAL_HEAP_NULL = cptr(any ptr, 0)
type BinomialHeapCompareFunc as function(byval value1 as BinomialHeapValue, byval value2 as BinomialHeapValue) as long
type BinomialHeap as _BinomialHeap
declare function binomial_heap_new(byval heap_type as BinomialHeapType, byval compare_func as BinomialHeapCompareFunc) as BinomialHeap ptr
declare sub binomial_heap_free(byval heap as BinomialHeap ptr)
declare function binomial_heap_insert(byval heap as BinomialHeap ptr, byval value as BinomialHeapValue) as long
declare function binomial_heap_pop(byval heap as BinomialHeap ptr) as BinomialHeapValue
declare function binomial_heap_num_entries(byval heap as BinomialHeap ptr) as long
#define ALGORITHM_BLOOM_FILTER_H

type BloomFilter as _BloomFilter
type BloomFilterValue as any ptr
type BloomFilterHashFunc as function(byval data_ as BloomFilterValue) as culong

declare function bloom_filter_new(byval table_size as ulong, byval hash_func as BloomFilterHashFunc, byval num_functions as ulong) as BloomFilter ptr
declare sub bloom_filter_free(byval bloomfilter as BloomFilter ptr)
declare sub bloom_filter_insert(byval bloomfilter as BloomFilter ptr, byval value as BloomFilterValue)
declare function bloom_filter_query(byval bloomfilter as BloomFilter ptr, byval value as BloomFilterValue) as long
declare sub bloom_filter_read(byval bloomfilter as BloomFilter ptr, byval array as ubyte ptr)
declare sub bloom_filter_load(byval bloomfilter as BloomFilter ptr, byval array as ubyte ptr)
declare function bloom_filter_union(byval filter1 as BloomFilter ptr, byval filter2 as BloomFilter ptr) as BloomFilter ptr
declare function bloom_filter_intersection(byval filter1 as BloomFilter ptr, byval filter2 as BloomFilter ptr) as BloomFilter ptr
#define ALGORITHM_HASH_TABLE_H

type HashTable as _HashTable
type HashTableIterator as _HashTableIterator
type HashTableEntry as _HashTableEntry
type HashTableKey as any ptr
type HashTableValue as any ptr

type _HashTableIterator
   hash_table as HashTable ptr
   next_entry as HashTableEntry ptr
   next_chain as long
end type

const HASH_TABLE_NULL = cptr(any ptr, 0)
type HashTableHashFunc as function(byval value as HashTableKey) as culong
type HashTableEqualFunc as function(byval value1 as HashTableKey, byval value2 as HashTableKey) as long
type HashTableKeyFreeFunc as sub(byval value as HashTableKey)
type HashTableValueFreeFunc as sub(byval value as HashTableValue)

declare function hash_table_new(byval hash_func as HashTableHashFunc, byval equal_func as HashTableEqualFunc) as HashTable ptr
declare sub hash_table_free(byval hash_table as HashTable ptr)
declare sub hash_table_register_free_functions(byval hash_table as HashTable ptr, byval key_free_func as HashTableKeyFreeFunc, byval value_free_func as HashTableValueFreeFunc)
declare function hash_table_insert(byval hash_table as HashTable ptr, byval key as HashTableKey, byval value as HashTableValue) as long
declare function hash_table_lookup(byval hash_table as HashTable ptr, byval key as HashTableKey) as HashTableValue
declare function hash_table_remove(byval hash_table as HashTable ptr, byval key as HashTableKey) as long
declare function hash_table_num_entries(byval hash_table as HashTable ptr) as long
declare sub hash_table_iterate(byval hash_table as HashTable ptr, byval iter as HashTableIterator ptr)
declare function hash_table_iter_has_more(byval iterator as HashTableIterator ptr) as long
declare function hash_table_iter_next(byval iterator as HashTableIterator ptr) as HashTableValue
#define ALGORITHM_LIST_H

type ListEntry as _ListEntry
type ListIterator as _ListIterator
type ListValue as any ptr

type _ListIterator
   prev_next as ListEntry ptr ptr
   current as ListEntry ptr
end type

const LIST_NULL = cptr(any ptr, 0)
type ListCompareFunc as function(byval value1 as ListValue, byval value2 as ListValue) as long
type ListEqualFunc as function(byval value1 as ListValue, byval value2 as ListValue) as long
declare sub list_free(byval list as ListEntry ptr)
declare function list_prepend(byval list as ListEntry ptr ptr, byval data_ as ListValue) as ListEntry ptr
declare function list_append(byval list as ListEntry ptr ptr, byval data_ as ListValue) as ListEntry ptr
declare function list_prev(byval listentry as ListEntry ptr) as ListEntry ptr
declare function list_next(byval listentry as ListEntry ptr) as ListEntry ptr
declare function list_data(byval listentry as ListEntry ptr) as ListValue
declare function list_nth_entry(byval list as ListEntry ptr, byval n as long) as ListEntry ptr
declare function list_nth_data(byval list as ListEntry ptr, byval n as long) as ListValue
declare function list_length(byval list as ListEntry ptr) as long
declare function list_to_array(byval list as ListEntry ptr) as ListValue ptr
declare function list_remove_entry(byval list as ListEntry ptr ptr, byval entry as ListEntry ptr) as long
declare function list_remove_data(byval list as ListEntry ptr ptr, byval callback as ListEqualFunc, byval data_ as ListValue) as long
declare sub list_sort(byval list as ListEntry ptr ptr, byval compare_func as ListCompareFunc)
declare function list_find_data(byval list as ListEntry ptr, byval callback as ListEqualFunc, byval data_ as ListValue) as ListEntry ptr
declare sub list_iterate(byval list as ListEntry ptr ptr, byval iter as ListIterator ptr)
declare function list_iter_has_more(byval iterator as ListIterator ptr) as long
declare function list_iter_next(byval iterator as ListIterator ptr) as ListValue
declare sub list_iter_remove(byval iterator as ListIterator ptr)
#define ALGORITHM_QUEUE_H
type Queue as _Queue
type QueueValue as any ptr
const QUEUE_NULL = cptr(any ptr, 0)
declare function queue_new() as Queue ptr
declare sub queue_free(byval queue as Queue ptr)
declare function queue_push_head(byval queue as Queue ptr, byval data_ as QueueValue) as long
declare function queue_pop_head(byval queue as Queue ptr) as QueueValue
declare function queue_peek_head(byval queue as Queue ptr) as QueueValue
declare function queue_push_tail(byval queue as Queue ptr, byval data_ as QueueValue) as long
declare function queue_pop_tail(byval queue as Queue ptr) as QueueValue
declare function queue_peek_tail(byval queue as Queue ptr) as QueueValue
declare function queue_is_empty(byval queue as Queue ptr) as long
#define ALGORITHM_SET_H

type Set as _Set
type SetIterator as _SetIterator
type SetEntry as _SetEntry
type SetValue as any ptr

type _SetIterator
   set as Set ptr
   next_entry as SetEntry ptr
   next_chain as long
end type

const SET_NULL = cptr(any ptr, 0)
type SetHashFunc as function(byval value as SetValue) as culong
type SetEqualFunc as function(byval value1 as SetValue, byval value2 as SetValue) as long
type SetFreeFunc as sub(byval value as SetValue)

declare function set_new(byval hash_func as SetHashFunc, byval equal_func as SetEqualFunc) as Set ptr
declare sub set_free(byval set as Set ptr)
declare sub set_register_free_function(byval set as Set ptr, byval free_func as SetFreeFunc)
declare function set_insert(byval set as Set ptr, byval data_ as SetValue) as long
declare function set_remove(byval set as Set ptr, byval data_ as SetValue) as long
declare function set_query(byval set as Set ptr, byval data_ as SetValue) as long
declare function set_num_entries(byval set as Set ptr) as long
declare function set_to_array(byval set as Set ptr) as SetValue ptr
declare function set_union(byval set1 as Set ptr, byval set2 as Set ptr) as Set ptr
declare function set_intersection(byval set1 as Set ptr, byval set2 as Set ptr) as Set ptr
declare sub set_iterate(byval set as Set ptr, byval iter as SetIterator ptr)
declare function set_iter_has_more(byval iterator as SetIterator ptr) as long
declare function set_iter_next(byval iterator as SetIterator ptr) as SetValue
#define ALGORITHM_SLIST_H

type SListEntry as _SListEntry
type SListIterator as _SListIterator
type SListValue as any ptr

type _SListIterator
   prev_next as SListEntry ptr ptr
   current as SListEntry ptr
end type

const SLIST_NULL = cptr(any ptr, 0)
type SListCompareFunc as function(byval value1 as SListValue, byval value2 as SListValue) as long
type SListEqualFunc as function(byval value1 as SListValue, byval value2 as SListValue) as long
declare sub slist_free(byval list as SListEntry ptr)
declare function slist_prepend(byval list as SListEntry ptr ptr, byval data_ as SListValue) as SListEntry ptr
declare function slist_append(byval list as SListEntry ptr ptr, byval data_ as SListValue) as SListEntry ptr
declare function slist_next(byval listentry as SListEntry ptr) as SListEntry ptr
declare function slist_data(byval listentry as SListEntry ptr) as SListValue
declare function slist_nth_entry(byval list as SListEntry ptr, byval n as long) as SListEntry ptr
declare function slist_nth_data(byval list as SListEntry ptr, byval n as long) as SListValue
declare function slist_length(byval list as SListEntry ptr) as long
declare function slist_to_array(byval list as SListEntry ptr) as SListValue ptr
declare function slist_remove_entry(byval list as SListEntry ptr ptr, byval entry as SListEntry ptr) as long
declare function slist_remove_data(byval list as SListEntry ptr ptr, byval callback as SListEqualFunc, byval data_ as SListValue) as long
declare sub slist_sort(byval list as SListEntry ptr ptr, byval compare_func as SListCompareFunc)
declare function slist_find_data(byval list as SListEntry ptr, byval callback as SListEqualFunc, byval data_ as SListValue) as SListEntry ptr
declare sub slist_iterate(byval list as SListEntry ptr ptr, byval iter as SListIterator ptr)
declare function slist_iter_has_more(byval iterator as SListIterator ptr) as long
declare function slist_iter_next(byval iterator as SListIterator ptr) as SListValue
declare sub slist_iter_remove(byval iterator as SListIterator ptr)
#define ALGORITHM_TRIE_H
type Trie as _Trie
type TrieValue as any ptr
const TRIE_NULL = cptr(any ptr, 0)
declare function trie_new() as Trie ptr
declare sub trie_free(byval trie as Trie ptr)
declare function trie_insert(byval trie as Trie ptr, byval key as zstring ptr, byval value as TrieValue) as long
declare function trie_lookup(byval trie as Trie ptr, byval key as zstring ptr) as TrieValue
declare function trie_remove(byval trie as Trie ptr, byval key as zstring ptr) as long
declare function trie_num_entries(byval trie as Trie ptr) as long

end extern
