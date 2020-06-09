
#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct postprocess_frag_main_uniforms
{
};
struct postprocess_frag_main_out
{
    float4 FragColor [[color(0)]];
};

struct postprocess_frag_main_in
{
    float4 color [[user(locn0)]];
    float2 texCoord [[user(locn1)]];
};

fragment postprocess_frag_main_out postprocess_frag_main(postprocess_frag_main_in in [[stage_in]], texture2d<float> tex [[texture(0)]], sampler texSmplr [[sampler(0)]])
{
    postprocess_frag_main_out out = {};
    float4 texcolor = tex.sample(texSmplr, in.texCoord) * in.color;
    float3 _32 = texcolor.xyz * in.color.w;
    texcolor = float4(_32.x, _32.y, _32.z, texcolor.w);
    texcolor = float4(texcolor.zyx.x, texcolor.zyx.y, texcolor.zyx.z, texcolor.w);
    out.FragColor = texcolor;
    return out;
}

