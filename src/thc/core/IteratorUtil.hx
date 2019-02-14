package thc.core;

import haxe.macro.Expr.ImportExpr;
import thc.core.IEquatable;
import haxe.macro.Type.AbstractType;
import haxe.ds.Option;

@:public class IteratorUtil {
    /**
     * Returns the number of elements in the stream.
     * @return Int Number of elements.
     */
    public static function count<I: Iterator<T>, T>(iter: I): Int {
        var count = 0;
        for(item in iter) {
            count++;
        }
        return count;
    }

    /**
     * Returns the first element in the stream
     * @return Null<T> First element, or null
     */
    public static inline function first<T>(iter: Iterator<T>): Option<T> {
        return iter.hasNext() ? Some(iter.next()): None;
    }

    /**
     * Returns the last element in the stream
     * @return Null<T> First element, or null
     */
    public static function last<I: Iterator<T>, T>(iter: I): Option<T> {
        var last: Option<T> = None;
        for(item in iter) {
            last = Some(item);
        }
        return last;
    }

    public static function nth<I: Iterator<T>, T>(iter: I,index: Int): Option<T> {
        var currIndex = 0;
        for(item in iter) {
            if(currIndex++ == index) {
                return Some(item);
            }
        }
        return None;
    }


    public static function skip<I: Iterator<T>, T>(iter: I, n: Int): Iterator<T> {
        for (i in 0...n)
            iter.next();
        
        return iter;
    }

    public static function fold<I: Iterator<T>, T, V>(iter: I,initial: V, func: V -> T -> V): V {
        var acc = initial;
        for(item in iter) {
            acc = func(acc, item);
        }
        return acc;
    }

    public static function all<I: Iterator<T>, T>(iter: I, pred: T -> Bool): Bool {
        for(item in iter) 
            if(!pred(item))
                return false;
        return true;
    }
    public static function any<I: Iterator<T>, T>(iter: I, pred: T -> Bool): Bool {
        for(item in iter) 
            if(pred(item))
                return true;
        return false;
    }
    public static function find<I: Iterator<T>, T>(iter: I, pred: T -> Bool): Null<T> {
        for(item in iter)
            if(pred(item))
                return item;
        return null;
    }

    public static function max<I: Iterator<T>, T>(iter: I): Option<T> {
        if(!iter.hasNext())
            return None;
            
        var largest = iter.next();
        for(item in iter)
            if(Reflect.compare(item, largest) > 0)
                largest = item;
        return Some(largest);
    }

    public static function min<I: Iterator<T>, T>(iter: I): Option<T> {
        if(!iter.hasNext())
            return None;
            
        var smallest = iter.next();
        for(item in iter)
            if(Reflect.compare(item, smallest) < 0)
                smallest = item;
        return Some(smallest);
    }

    public static function sum<I: Iterator<T>, T>(iter: I): Option<T> {
        if(!iter.hasNext())
            return None;
        var total: Dynamic = iter.next();
        for(item in iter)
            total += item;
        return Some(total);
    }
}