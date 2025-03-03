const std = @import("std");

// Very simple program made to simplify
// the work when naming large portions of wires,
// especially in the construction of the ROM/RAM
pub fn main() void {
    var index: i32 = 0;
    const range: u16 = 16;
    const increment: u8 = 1;

    while (index < range) : (index += increment) {
        std.debug.print("A<{}> ", .{index});
    }
    std.debug.print("\n", .{});
}
