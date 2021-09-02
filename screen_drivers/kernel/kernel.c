#include "../drivers/screen.h"

void main() {
    clear_screen();
    kprint_at("X", 1, 6);
    kprint_at("This text spans multiple lines", 75, 10);
}
