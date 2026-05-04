/// This example shows how to use Joka's bit set.

import joka;

void main() {
    auto bs = BitSet();
    assert(bs.none == true);
    assert(bs.any == false);
    assert(bs.all == false);
    assert(bs.length == 0);

    bs.set();
    assert(bs.none == false);
    assert(bs.any == true);
    assert(bs.all == true);
    assert(bs.length == 64);

    bs.reset();
    assert(bs.none == true);
    assert(bs.any == false);
    assert(bs.all == false);
    assert(bs.length == 0);

    bs[0] = true;
    assert(bs[0] == true);
    assert(bs.length == 1);

    bs[3] = true;
    assert(bs[3] == true);
    assert(bs.length == 2);

    bs[0] = false;
    assert(bs[0] == false);
    assert(bs.length == 1);

    bs.flip(3);
    assert(bs[3] == false);
    assert(bs.none == true);
    bs.flip(7);
    assert(bs[7] == true);
    assert(bs.length == 1);

    bs.reset();
    bs[1] = true;
    bs[5] = true;
    bs[62] = true;
    assert(bs.length == 3);

    Sz[3] expected = [1, 5, 62];
    Sz i = 0;
    foreach (bit; bs.setBits) {
        assert(bit == expected[i]);
        i += 1;
    }
    assert(i == 3);

    bs.reset();
    Sz testCount = 0;
    foreach (bit; bs.setBits) testCount += 1;
    assert(testCount == 0);
}
