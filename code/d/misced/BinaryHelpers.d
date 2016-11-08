module misced.BinaryHelpers;

Type maskForBits(Type)(size_t bits) {
	return (bits == 0) ? cast(Type)0 : (cast(Type)1 << bits) - cast(Type)1;
}

// counts how many bits are set in the number
// not optimized version
uint countBits(Type)(Type value) {
	uint count = 0;

    foreach( i; 0..Type.sizeof*8 ) {
        if( (value & (cast(Type)1 << i)) != 0 ) {
            count++;
        }
    }

    return count;
}

unittest {
	assert(countBits(0) == 0);
	assert(countBits(1) == 1);
	assert(countBits(2) == 1);
	assert(countBits(3) == 2);
	assert(countBits(4) == 1);
	assert(countBits(5) == 2);
	assert(countBits(6) == 2);
	assert(countBits(7) == 3);
}

// determines how many bits are required to represent this number
uint numberOfBits(Type)(Type value) {
	for( int i = Type.sizeof*8-1; i >= 0; i-- ) {
		if( (value & (cast(Type)1 << i)) != 0 ) {
			return i+1;
		}
	}

	return 0;
}

bool isPowerOfTwo(Type)(Type value) {
	return countBits(value) == 1;
}