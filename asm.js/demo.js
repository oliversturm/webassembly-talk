function asmModule(stdlib, foreign, heap) {
  "use asm";

  var imul = stdlib.Math.imul;
  var HEAP32 = new stdlib.Int32Array(heap);

  function calculateMagicNumber(x, y) {
    x = x | 0;
    y = y | 0;
    var result = 0;
    result = ((imul(x, 1664525) | 0) + 1013904223) | 0;
    result = (result + y) | 0;
    HEAP32[0] = result;
    return (result >>> 0) / 4294967296;
  }

  return { calculateMagicNumber: calculateMagicNumber };
}

var heap = new ArrayBuffer(65536);
var module = asmModule(window, null, heap);
console.log(module.calculateMagicNumber(42, 17));
