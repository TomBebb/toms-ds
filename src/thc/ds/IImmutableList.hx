package thc.ds;

import haxe.ds.Option;

/**
 * An ordered, immutable list
 */
interface IImmutableList<T> extends IImmutableCollection<T> {
    /**
     * Return the element at index given
     * @param index Index of element
     * @return Option<T> Element
     */
    public function get(index: Int): Option<T>;
    /**
     * Return the element at the index given
     * @param index Index of element
     * @return Option<T> Element
     */
    public function unsafeGet(index: Int): T;

    /**
     * Returns the index of the value, or -1
     * @param value Value to find
     * @return Int Index
     */
    public function indexOf(value: T): Int;
}