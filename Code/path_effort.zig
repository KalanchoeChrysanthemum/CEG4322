const std = @import("std");
const math = std.math;

pub fn main() void {
    // Variables
    const input_capacitance: f32 = 6.0;
    const output_capacitance: f32 = 60.0;
    const gate_efforts = [_]f32{ 1.0, 5.0 / 3.0, 1.0 };
    const branches = [_]f32{ 4.0, 1.0, 1.0 };
    const num_stages: f32 = 3.0;
    const parasitic_capacitance: i32 = 5;

    // Logical effort, branching effort, electrical effort
    const G, const B, const H = compute_path_efforts(input_capacitance, output_capacitance, &gate_efforts, &branches);
    std.debug.print("G = {d:.2}\nB = {d:.2}\nH = {d:.2}\n", .{ G, B, H });

    // Path effort
    const F: f32 = G * B * H;

    // Best number of stages
    const N: f32 = math.log(f32, 4, F);

    // Best stage effort
    const F_circumflex: f32 = math.pow(f32, F, 1.0 / num_stages);

    const D: f32 = (num_stages * F_circumflex) + parasitic_capacitance;

    std.debug.print("F = {d:.2}\nN = {d:.2}\n~F = {d:.2}\nP = {}\nD = {d:.2}\n", .{ F, N, F_circumflex, parasitic_capacitance, D });

    compute_gate_size(F_circumflex, &gate_efforts, &branches, output_capacitance);
}

fn compute_gate_size(F_circumflex: f32, gate_efforts: []const f32, branches: []const f32, output_cap: f32) void {
    var current_cap: f32 = output_cap;
    var index = gate_efforts.len - 1;

    current_cap = ((gate_efforts[index] * current_cap) / F_circumflex);
    std.debug.print("Stage {} size is: {d:.2}\n", .{ index, current_cap });
    if (index == 0) {
        return; // Break early to avoid usize overflow
    }
    index -= 1;

    while (index >= 0) : (index -= 1) {
        current_cap = ((gate_efforts[index + 1] * branches[index] * current_cap) / F_circumflex);
        std.debug.print("Stage {} size is: {d:.2}\n", .{ index, current_cap });

        if (index == 0) {
            break; // Break early to avoid usize overflow
        }
    }
}

fn compute_path_efforts(input_cap: f32, output_cap: f32, gate_efforts: []const f32, branches: []const f32) [3]f32 {
    // Path logical effort
    var G: f32 = 1.0;
    for (gate_efforts) |gate| {
        G *= gate;
    }

    // Path branching effort
    var B: f32 = 1.0;
    for (branches) |branch| {
        B *= branch;
    }

    // Path electrical effort
    const H: f32 = output_cap / input_cap;

    return .{ G, B, H };
}
