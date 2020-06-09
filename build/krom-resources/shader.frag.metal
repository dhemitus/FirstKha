
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct shader_frag_main_out
{
    float4 FragColor [[color(0)]];
};

fragment shader_frag_main_out shader_frag_main()
{
    shader_frag_main_out out = {};
    out.FragColor = float4(1.0, 0.0, 0.0, 1.0);
    return out;
}

