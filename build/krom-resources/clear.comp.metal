
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

constant uint3 gl_WorkGroupSize [[maybe_unused]] = uint3(16u, 16u, 1u);

struct clear_comp_main_uniforms
{
    float4 color;
};

kernel void clear_comp_main(constant clear_comp_main_uniforms& uniforms [[buffer(1)]], texture2d<float, access::write> dest [[texture(0)]], uint3 gl_GlobalInvocationID [[thread_position_in_grid]])
{
    int2 pos = int2(gl_GlobalInvocationID.xy);
    dest.write(uniforms.color, uint2(pos));
}

