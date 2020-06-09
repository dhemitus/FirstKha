
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct simple_frag_main_out
{
    float4 fragColor [[color(0)]];
};

struct simple_frag_main_in
{
    float3 fragmentColor [[user(locn0)]];
};

fragment simple_frag_main_out simple_frag_main(simple_frag_main_in in [[stage_in]])
{
    simple_frag_main_out out = {};
    out.fragColor = float4(in.fragmentColor, 1.0);
    return out;
}

