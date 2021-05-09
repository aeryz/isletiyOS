#include "vga.h"
#include <stddef.h>
#include <stdint.h>

#define MAX_COL 80
#define MAX_ROW 25

#define WHITE_ON_BLACK (0xF << 8)
#define VGA_ADDR 0xb8000
#define BG_COL(X) (X << 12)
#define FG_COL(X) (X << 8)

static uint16_t *const VGA_BUFFER = (uint16_t *)VGA_ADDR;

static int vga_index = 0;

static uint16_t active_color = BG_COL(VGA_BLACK) | FG_COL(VGA_BRIGHT_WHITE);

static void vga_print_char(char character) {
  if (vga_index >= MAX_COL * MAX_ROW) {
    return;
  }
  if ('\n' == character) {
    vga_index = vga_index + MAX_COL - ((vga_index) % MAX_COL);
    return;
  }

  VGA_BUFFER[vga_index++] = active_color | character;
}

void vga_print(const char *string) {
  for (int i = 0;; ++i) {
    if (string[i] == '\0') {
      return;
    }
    vga_print_char(string[i]);
  }
}

void vga_set_color(vga_color_t bg, vga_color_t fg) {
  active_color = BG_COL(bg) | FG_COL(fg);
}
