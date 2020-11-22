cbuffer vars : register(b0)
{
	float2 uResolution;
	float uTime;
};

Texture2D Tex0 : register(t0);
SamplerState uSampler0 : register(s0);

float4 main(float4 fragCoord : SV_POSITION) : SV_TARGET
{
    float2 uv = fragCoord.xy/uResolution;
    //return float4(0.5f + 0.5f*cos(uTime+uv.yxy), 1.0f);
    //return Tex0.Sample(uSampler0, uv);
    //return float4(uv, 0.0f, 1.0f);
    
    float4 outout = Tex0.Sample(uSampler0, uv);;
    
    return outout ;
}
