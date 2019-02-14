using thc.core.IteratorUtil; 
import thc.ds.*;

class Main {
    static function main() {
        var arr = new ArrayList<String>(3);
        trace(arr.size());
        arr.add("Tom");
        arr.add("Bill");
        arr.add("Jack");
        var list:IImmutableList<String> = cast arr; 
        trace(list);
        trace(list.iterator().count());
        trace(list.iterator().skip(1).count());
        trace(list.iterator().last());
    }
}