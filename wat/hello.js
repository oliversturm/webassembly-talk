import { readFile } from "node:fs/promises";

readFile("hello.wasm").then((buffer) =>
  WebAssembly.instantiate(buffer)
    .then((module) => {
      const { getValue } = module.instance.exports;
      console.log(getValue());
    })
    .catch((err) => {
      console.error("Error loading WebAssembly module:", err);
    }),
);
