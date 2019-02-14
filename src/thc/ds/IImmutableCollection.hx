package thc.ds;

interface IImmutableCollection<T> {

    /**
     * Returns the number of elements in the collection.
     * @return Int Number of elements.
     */
    function size(): Int;
    /**
     * Returns true when the collection has no elements.
     * @return Bool True when collection is empty
     */
    function isEmpty(): Bool;

    function iterator(): Iterator<T>;
}