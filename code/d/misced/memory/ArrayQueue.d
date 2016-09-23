module misced.memory.ArrayQueue;

import std.algorithm.mutation : remove;

void enqueue(Type)(ref Type[] arr, Type element) {
	arr ~= element;
}

unittest {
	int[] arr;
	enqueue(arr, 5);

	assert(arr.length == 1);
	assert(arr[0] == 5);	
}

Type dequeue(Type)(ref Type[] arr) {
	Type result = arr[0];
	arr = arr.remove(0);
	return result;
}

unittest {
	int[] arr;
	arr ~= 5;

	int dequeueResult = arr.dequeue();
	assert(arr.length == 0);
	assert(dequeueResult == 5);
}
