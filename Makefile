CPP_FILES = \
  wasm-as-js.cpp \
  binaryen/src/wasm/literal.cpp \
  binaryen/src/wasm/wasm-binary.cpp \
  binaryen/src/wasm/wasm-io.cpp \
  binaryen/src/wasm/wasm-s-parser.cpp \
  binaryen/src/wasm/wasm-type.cpp \
  binaryen/src/wasm/wasm-validator.cpp \
  binaryen/src/wasm/wasm.cpp \
  binaryen/src/asmjs/asm_v_wasm.cpp \
  binaryen/src/asmjs/shared-constants.cpp \
  binaryen/src/ir/ExpressionAnalyzer.cpp \
  binaryen/src/ir/ExpressionManipulator.cpp \
  binaryen/src/ir/LocalGraph.cpp \
  binaryen/src/cfg/Relooper.cpp \
  binaryen/src/support/archive.cpp \
  binaryen/src/support/bits.cpp \
  binaryen/src/support/colors.cpp \
  binaryen/src/support/command-line.cpp \
  binaryen/src/support/file.cpp \
  binaryen/src/support/safe_integer.cpp \
  binaryen/src/support/threads.cpp \
  binaryen/src/passes/CoalesceLocals.cpp \
  binaryen/src/passes/CodeFolding.cpp \
  binaryen/src/passes/CodePushing.cpp \
  binaryen/src/passes/ConstHoisting.cpp \
  binaryen/src/passes/DeadCodeElimination.cpp \
  binaryen/src/passes/DuplicateFunctionElimination.cpp \
  binaryen/src/passes/ExtractFunction.cpp \
  binaryen/src/passes/Flatten.cpp \
  binaryen/src/passes/I64ToI32Lowering.cpp \
  binaryen/src/passes/Inlining.cpp \
  binaryen/src/passes/InstrumentLocals.cpp \
  binaryen/src/passes/InstrumentMemory.cpp \
  binaryen/src/passes/LegalizeJSInterface.cpp \
  binaryen/src/passes/LocalCSE.cpp \
  binaryen/src/passes/LogExecution.cpp \
  binaryen/src/passes/MemoryPacking.cpp \
  binaryen/src/passes/MergeBlocks.cpp \
  binaryen/src/passes/Metrics.cpp \
  binaryen/src/passes/NameList.cpp \
  binaryen/src/passes/OptimizeInstructions.cpp \
  binaryen/src/passes/pass.cpp \
  binaryen/src/passes/PickLoadSigns.cpp \
  binaryen/src/passes/PostEmscripten.cpp \
  binaryen/src/passes/Precompute.cpp \
  binaryen/src/passes/Print.cpp \
  binaryen/src/passes/PrintCallGraph.cpp \
  binaryen/src/passes/RelooperJumpThreading.cpp \
  binaryen/src/passes/RemoveImports.cpp \
  binaryen/src/passes/RemoveMemory.cpp \
  binaryen/src/passes/RemoveUnusedBrs.cpp \
  binaryen/src/passes/RemoveUnusedModuleElements.cpp \
  binaryen/src/passes/RemoveUnusedNames.cpp \
  binaryen/src/passes/ReorderFunctions.cpp \
  binaryen/src/passes/ReorderLocals.cpp \
  binaryen/src/passes/ReReloop.cpp \
  binaryen/src/passes/SafeHeap.cpp \
  binaryen/src/passes/SimplifyLocals.cpp \
  binaryen/src/passes/SSAify.cpp \
  binaryen/src/passes/TrapMode.cpp \
  binaryen/src/passes/Untee.cpp \
  binaryen/src/passes/Vacuum.cpp \
  $(NULL)

OPTIONS = -std=c++11 -O2 -I./binaryen/src/
FLAGS = -s EXPORTED_FUNCTIONS='["_assemble"]' -s DISABLE_EXCEPTION_CATCHING=0

build:
	emcc $(OPTIONS) $(CPP_FILES) -o wasm-as.html $(FLAGS)
