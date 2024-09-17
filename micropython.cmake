# This top-level micropython.cmake is responsible for listing
# the individual modules we want to include.
# Para smartconfig
add_library(usermod_smartconfig INTERFACE)
target_sources(usermod_smartconfig INTERFACE
    # Archivos del smartconfig
)
target_include_directories(usermod_smartconfig INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/smartconfig
)

# Create an INTERFACE library for our C module.
add_library(usermod_s3lcd INTERFACE)

# Add our source files to the lib
target_sources(usermod_s3lcd INTERFACE
    ${CMAKE_CURRENT_LIST_DIR}/s3lcd.c
    ${CMAKE_CURRENT_LIST_DIR}/s3lcd_i80_bus.c
    ${CMAKE_CURRENT_LIST_DIR}/s3lcd_spi_bus.c
    ${CMAKE_CURRENT_LIST_DIR}/mpfile.c
    ${CMAKE_CURRENT_LIST_DIR}/jpg/tjpgd565.c
    ${CMAKE_CURRENT_LIST_DIR}/png/pngle.c
    ${CMAKE_CURRENT_LIST_DIR}/png/miniz.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/adler32.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/crc32.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/deflate.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/pngenc.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/trees.c
    ${CMAKE_CURRENT_LIST_DIR}/pngenc/zutil.c
)

# Add the current directory as an include directory.
target_include_directories(usermod_s3lcd INTERFACE
    ${IDF_PATH}/components/esp_lcd/include/
    ${CMAKE_CURRENT_LIST_DIR}
)

# Vincular ambos módulos
target_link_libraries(usermod INTERFACE usermod_smartconfig usermod_s3lcd)
