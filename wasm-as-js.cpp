#include "support/colors.h"
#include "support/command-line.h"
#include "support/file.h"
#include "wasm-binary.h"
#include "wasm-s-parser.h"

#include "tools/tool-utils.h"

using namespace cashew;
using namespace wasm;

extern "C" bool assemble(const char* wast, const uint8_t** output, size_t* outputLength);

bool assemble(const char* wast, const uint8_t** output, size_t* outputLength)
{
  Options options("wasm-as", "Assemble a .wast (WebAssembly text format) into a .wasm (WebAssembly binary format)");

  Module wasm;

  try {
    if (options.debug) std::cerr << "s-parsing..." << std::endl;
    SExpressionParser parser(const_cast<char*>(wast));
    Element& root = *parser.root;
    if (options.debug) std::cerr << "w-parsing..." << std::endl;
    SExpressionWasmBuilder builder(wasm, *root[0]);
  } catch (ParseException& p) {
    p.dump(std::cerr);
    Fatal() << "error in parsing input";
    return false;
  }

  BufferWithRandomAccess buffer(options.debug);
  WasmBinaryWriter writer(&wasm, buffer, options.debug);
  writer.write();

  uint8_t* result = new uint8_t[buffer.size()];
  ::memcpy(result, &(*buffer.begin()), buffer.size());
  *output = result;
  *outputLength = buffer.size();
  return  true;
}

