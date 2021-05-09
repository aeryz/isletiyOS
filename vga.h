#ifndef VGA_H_
#define VGA_H_

typedef enum {
  VGA_BLACK,
  VGA_BLUE,
  VGA_GREEN,
  VGA_CYAN,
  VGA_RED,
  VGA_MAGENTA,
  VGA_BROWN,
  VGA_WHITE,
  VGA_GRAY,
  VGA_LIGHT_BLUE,
  VGA_LIGHT_GREEN,
  VGA_LIGHT_CYAN,
  VGA_LIGHT_RED,
  VGA_LIGHT_MAGENTA,
  VGA_YELLOW,
  VGA_BRIGHT_WHITE
} vga_color_t;

void vga_print(const char *);

void vga_set_color(vga_color_t bg, vga_color_t fg);

#endif
