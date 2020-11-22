RWTexture2D<float4> OutputTex : register(u0);

cbuffer uniformBuffer : register(b0) {
	float time;
}

float hash12(float2 p)
{
    float3 p3 = frac(float3(p.xyx) * .1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return frac((p3.x + p3.y) * p3.z);
}


[numthreads(8, 8, 1)]
void main(uint3 Gid  : SV_GroupID,          // current group index (dispatched by c++)
          uint3 DTid : SV_DispatchThreadID, // "global" thread id
          uint3 GTid : SV_GroupThreadID,    // current threadId in group / "local" threadId
          uint GI    : SV_GroupIndex)       // "flattened" index of a thread within a group)
{   
    float2 p = float2(DTid.xy + time);
    //float2 p = float2(DTid.xy);
    float output = hash12(p);
    
    //OutputTex[DTid.xy] = float4(output, output, output, 1.0f);
    OutputTex[DTid.xy] = float4(hash12(DTid.xy + time), hash12(DTid.xy + time + (0.1f).xx), hash12(DTid.xy + time + (0.2f).xx), 1.0f);
}
