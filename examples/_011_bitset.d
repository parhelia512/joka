/// This example shows how to use Joka's bit set.

import joka;

void main() {
    auto bs = BitSet();
    assert(bs.none == true);
    assert(bs.any == false);
    assert(bs.all == false);
    assert(bs.length == 0);

    bs.fill();
    assert(bs.none == false);
    assert(bs.any == true);
    assert(bs.all == true);
    assert(bs.length == 64);

    bs.clear();
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

    bs.clear();
    bs[1] = true;
    bs[5] = true;
    bs[62] = true;
    assert(bs.length == 3);

    Sz[3] expected = [1, 5, 62];
    Sz i = 0;
    foreach (bit; bs.activeBits) {
        assert(bit == expected[i]);
        i += 1;
    }
    assert(i == 3);

    bs.clear();
    Sz testCount = 0;
    foreach (bit; bs.activeBits) testCount += 1;
    assert(testCount == 0);

    GBitSet!ubyte small;
    assert(small.capacity == 8);
    small[7] = true;
    assert(small[7] == true);
    assert(small.length == 1);
    small.flip(7);
    assert(small.none == true);
}
