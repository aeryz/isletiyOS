#include <stddef.h>
#include <stdint.h>

#define MAX_COL 80
#define MAX_ROW 25

#define WHITE_ON_BLACK (0xF << 8)
#define VGA_ADDR 0xb8000

static uint16_t *const VGA_BUFFER = (uint16_t *)VGA_ADDR;

static int vga_index = 0;

static void vga_print_char(char character) {
  if (vga_index >= MAX_COL * MAX_ROW) {
    return;
  }
  if ('\n' == character) {
    vga_index = vga_index + MAX_COL - ((vga_index) % MAX_COL);
    return;
  }

    VGA_BUFFER[vga_index++] = WHITE_ON_BLACK | character;
}

void vga_print(const char *string) {
  for (int i = 0;; ++i) {
    if (string[i] == '\0') {
      return;
    }
    vga_print_char(string[i]);
  }
}
