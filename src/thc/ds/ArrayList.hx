package thc.ds;

import haxe.ds.Option;
import haxe.ds.Vector;

@:generic
class ArrayList<T> extends List<T> {
    var data: Vector<T>;
    var length: Int;

    public function new(capacity: Int = 32) {
        super();
        data = new Vector<T>(capacity);
        length = 0;
    }

    function ensureCapacity(cap: Int) {
        if(cap > data.length) {
            var newData = new Vector<T>(cap);
            Vector.blit(data, 0, newData, 0, length);
            data = newData;
        }
    }
    override function add(item: T): Bool {
        ensureCapacity(length + 1);
        data[length++] = item;
        return true;
    }
    public override inline function unsafeGet(index: Int): T
        return data[index];

    public inline function uncheckedSet(index: Int, value: T): T
        return data[index] = value;
    override function size():Int {
        return length;
    }
}