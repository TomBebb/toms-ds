package thc.ds;

@:generic class Collection<T> implements IImmutableCollection<T> {
    /**
     * Returns the number of elements in the collection.
     * @return Int Number of elements.
     */
    public function size(): Int
        return -1;

    /**
     * Add the item to the collection
     * @param item Item to add
     * @return Bool True if item added
     */
    public function add(item: T): Bool
        return false;
    
    public function addAll(items: Iterable<T>): Bool {
        for(item in items) {
            if(!add(item))
                return false;
        }
        return true;
    }

    /**
     * Add the item to the collection
     * @param item Item to add
     * @return Bool True if item added
     */
    public inline function remove(item: T): Bool
        return false;


    public function removeAll(items: Iterable<T>): Bool {
        for(item in items) {
            if(!remove(item))
                return false;
        }
        return true;
    }

    public function isEmpty(): Bool
        return size() == 0;

    public function iterator(): Iterator<T>
        return null;
    
    public function toString(): String {
        var str = new StringBuf();
        var isFirst = true;
        for(item in this) {
            if(!isFirst) str.add(", ");
            str.add(item);
            isFirst = false;
        }
        return str.toString();
    }
}