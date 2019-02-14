package thc.ds;

@:generic @:final
class Bag<T> extends Collection<T> {
    var elems: Array<T>;

    public function new() {
        elems = [];
    }

    public override function size(): Int
        return elems.length;

    public override function iterator(): Iterator<T>
        return elems.iterator();
}