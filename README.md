# C3PriorityQueue

This is a simple binary heap based priority queue for the [C3 language](https://github.com/c3lang/c3c). As such, it has O(lg n) pushes and pops. It depends on the intrinsic comparability of a type (`<` or `>`). You can configure the `max` property to make it a min-heap (false/default) or max-heap (true) based priority queue (do you want the smallest or largest value each time you pop?).

## Example

```c3
define IntPriorityQueue = PriorityQueue<int>;

fn void myThing() {
    IntPriorityQueue pq;
    pq.push(3);
    pq.push(1);
    pq.push(5);
    pq.pop(); // expect to have 1 returned, or if you configured it as a max heap, then 5
}
```