package thc.core;

import haxe.ds.Option;

@:public class OptionUtil {
    @:generic
    static inline function isNone<T>(opt: Option<T>): Bool
        return opt == None;

    @:generic
    static inline function isSome<T>(opt: Option<T>): Bool
        return opt != None;

    @:generic
    static function filter<T>(opt: Option<T>, pred: T -> Bool): Option<T> {
        return switch(opt) {
            case Some(v) if(pred(v)): opt;
            default: None;
        };
    }
    @:generic
    static function map<T, R>(opt: Option<T>, func: T -> R): Option<R> {
        return switch(opt) {
            case Some(v): Some(func(v));
            case None: None;
        };
    }
    @:generic
    static function and<T>(opt: Option<T>, other: Option<T>): Option<T> {
        return switch(opt) {
            case Some(_): other;
            case None: None;
        };
    }
    @:generic
    static function or<T>(opt: Option<T>, other: Option<T>): Option<T> {
        return isSome(opt) ? opt : other;
    }

    @:generic
    static function equals<T>(opt: Option<T>, other: Option<T>, ?areEqual: T -> T -> Bool): Bool {
        return switch(opt) {
            case Some(optV):
                switch(other) {
                    case Some(otherV) if(areEqual == null): areEqual(optV, otherV);
                    case Some(otherV): optV == otherV;
                    case None: false;
                }
            case None: other == None;
        }
    }
}