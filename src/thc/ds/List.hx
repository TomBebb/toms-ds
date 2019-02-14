package thc.ds;

import haxe.ds.Option;
@:generic
class List<T> extends Collection<T> implements IImmutableList<T> {
    public function unsafeGet(index: Int): T
        return null;
    
    public function new() {

    }

    public function get(index: Int): Option<T> {
        return if(index < 0 || index > size())
            None;
        else
            Some(unsafeGet(index));
    }

    public function set(index: Int, value: T): T {
        return cast null;
    }
    public function indexOf(value: T): Int {
        for(i in 0...size())
            if(unsafeGet(i) == value)
                return i;
        return -1;
    }
    public override function iterator(): ListIterator<T> {
        return new ListIterator(this);
    }
}

@:generic
class ListIterator<T> {
    var index: Int;
    var list: List<T>;
    public inline function new(list: List<T>) {
        this.index = 0;
        this.list = list;
    }

    public inline function hasNext(): Bool
        return index < list.size();
    
    public inline function next(): T
        return list.unsafeGet(index++);
}