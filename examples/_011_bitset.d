/// This example shows how to use Joka's bit set.

import joka;

void main() {
    auto bs = BitSet();
    assert(bs.none == true);
    assert(bs.any == false);
    assert(bs.all == false);
    assert(bs.count == 0);

    bs.set();
    assert(bs.none == false);
    assert(bs.any == true);
    assert(bs.all == true);
    assert(bs.count == 1);

    bs.reset();
    assert(bs.none == true);
    assert(bs.any == false);
    assert(bs.all == false);
    assert(bs.count == 0);

    bs[0] = true;
    assert(bs[0] == true);
    assert(bs.count == 1);
    bs[3] = true;
    assert(bs[3] == true);
    assert(bs.count == 2);

    bs.flip(3);
    assert(bs[3] == false);
    bs.flip(7);
    assert(bs[7] == true);

    bs.reset();
    bs[1] = true;
    bs[5] = true;
    bs[62] = true;
    assert(bs.count == 3);
}
