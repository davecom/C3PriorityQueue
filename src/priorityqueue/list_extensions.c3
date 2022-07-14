//  list_extensions.c3
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
module std::array::list<Type>;

// From C3 Documentation
// http://www.c3-lang.org/macros/
// macro void @swap(&a, &b) {
//     $typeof(a) temp = a;
//     a = b;
//     b = temp;
// }

// Make it easier to swap variables
fn void List.swap(List *list, usize i, usize j) {
    //@swap(this[i], this[j]);
    Type temp = list.get(i);
    list.entries[i] = list.get(j);
    list.entries[j] = temp;
}