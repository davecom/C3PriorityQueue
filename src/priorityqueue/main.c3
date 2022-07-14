//  main.c3
//  A priority queue using a classic binary heap for C3.
//
//  Copyright (c) 2022 David Kopec
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
module priorityqueue::test;
import std::array::list;
import priorityqueue;

extern fn int printf(char* format, ...);

define IntList = List<int>;
define IntPriorityQueue = PriorityQueue<int>;

fn void expect(int expected, int actual, int *failures) {
    if (expected != actual) {
        printf("Expected %d, got %d\n", expected, actual);
        *failures += 1;
    }
}

fn void basicTest() {
    int failures = 0;
    IntPriorityQueue pq;
    pq.push(1);
    expect(1, pq.peek(), &failures);
    expect(1, (int)pq.len(), &failures);
    pq.push(5);
    expect(1, pq.peek(), &failures);
    expect(2, (int)pq.len(), &failures);
    pq.push(3);
    expect(1, pq.peek(), &failures);
    expect(3, (int)pq.len(), &failures);
    pq.push(6);
    expect(1, pq.peek(), &failures);
    expect(4,(int)pq.len(), &failures);
    pq.push(4);
    expect(1, pq.peek(), &failures);
    expect(5, (int)pq.len(), &failures);
    expect(1, pq.pop(), &failures);
    expect(4, (int)pq.len(), &failures);
    expect(3, pq.pop(), &failures);
    expect(3, (int)pq.len(), &failures);
    expect(4, pq.pop(), &failures);
    expect(2, (int)pq.len(), &failures);
    expect(5, pq.pop(), &failures);
    expect(1, (int)pq.len(), &failures);
    expect(6, pq.pop(), &failures);
    expect(0, (int)pq.len(), &failures);
    pq.free();
    printf("Basic test ran with %d failures.\n", failures);
}

fn void basicTest2() {
    int failures = 0;
    IntPriorityQueue pq;
    pq.max = true;
    for (int i = 0; i < 100; i++) {
        pq.push(i);
        expect(i + 1, (int)pq.len(), &failures);
    }
    for (int i = 99; i >= 0; i--) {
        expect(i, pq.pop(), &failures);
        expect(i, (int)pq.len(), &failures);
    }
    pq.free();
    printf("Basic test 2 ran with %d failures.\n", failures);
}

fn void main() {
    basicTest();
    basicTest2();
}