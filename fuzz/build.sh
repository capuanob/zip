cd $SRC/zip

mkdir -p build
cmake -S . -B build \
        -DCMAKE_C_COMPILER_WORKS=1 \
        -DZIP_BUILD_FUZZ=ON \
        -DCMAKE_C_COMPILER="$CC" \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_EXE_LINKER_FLAGS="$LIB_FUZZING_ENGINE" \
    && cmake --build build --target install

# Prepare corpora
zip -q $OUT/read_entry_fuzzer_seed_corpus.zip fuzz/corpus/*
cp $OUT/read_entry_fuzzer_seed_corpus.zip $OUT/create_zip_fuzzer_seed_corpus.zip
