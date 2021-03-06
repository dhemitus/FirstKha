
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct simple_vert_main_uniforms
{
    float4x4 MVP;
};

struct simple_vert_main_out
{
    float3 fragmentColor [[user(locn0)]];
    float4 gl_Position [[position]];
};

struct simple_vert_main_in
{
    float3 col [[attribute(0)]];
    float3 pos [[attribute(1)]];
};

vertex simple_vert_main_out simple_vert_main(simple_vert_main_in in [[stage_in]], constant simple_vert_main_uniforms& uniforms [[buffer(1)]])
{
    simple_vert_main_out out = {};
    out.gl_Position = uniforms.MVP * float4(in.pos, 1.0);
    out.fragmentColor = in.col;
    out.gl_Position.z = (out.gl_Position.z + out.gl_Position.w) * 0.5;       // Adjust clip-space for Metal
    return out;
}

