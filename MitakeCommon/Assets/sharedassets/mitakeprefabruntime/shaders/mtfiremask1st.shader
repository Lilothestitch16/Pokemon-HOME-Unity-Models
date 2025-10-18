Shader "MT/FireMask1st" {
	Properties {
		_Mask0Tex ("Mask Texture1", 2D) = "white" {}
		_Mask1Tex ("Mask Texture2", 2D) = "black" {}
		[Header(Material Value_______________________)] [KeywordEnum(ADD, MULTIPLY)] MASK_CALC_MODE ("Mask Blend Mode", Float) = 0
		_DiscardValue ("Cut off threshould", Range(0, 1)) = 0.5
		[Space] [Header(UV Control_______________________)] [KeywordEnum(ZERO, ONE, TWO)] MASK_FIRST_UV ("Mask0 UV Index", Float) = 0
		_Mask0UVTranslateU ("BlendTex1 UV Translate(U)", Float) = 0
		_Mask0UVTranslateV ("BlendTex1 UV Translate(V)", Float) = 0
		_Mask0UVScaleU ("BlendTex1 UV Scale(U)", Float) = 1
		_Mask0UVScaleV ("BlendTex1 UV Scale(V)", Float) = 1
		[KeywordEnum(ZERO, ONE, TWO)] MASK_SECOND_UV ("Mask1 UV Index", Float) = 0
		_Mask1UVTranslateU ("BlendTex2 UV Translate(U)", Float) = 0
		_Mask1UVTranslateV ("BlendTex2 UV Translate(V)", Float) = 0
		_Mask1UVScaleU ("BlendTex2 UV Scale(U)", Float) = 1
		_Mask1UVScaleV ("BlendTex2 UV Scale(V)", Float) = 1
		[Space] [Header(Culling___________________________)] _Stencil ("MatLink ID", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)] _CullMode ("Culling Mode", Float) = 0
		[Space] [Header(Z Test____________________________)] [Enum(UnityEngine.Rendering.CompareFunction)] _ZTest ("Z Test", Float) = 4
		[MaterialToggle] _ZWrite ("Z Write", Float) = 1
	}
	//DummyShaderTextExporter
	SubShader{
		Tags { "RenderType" = "Opaque" }
		LOD 200

		Pass
		{
			HLSLPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			float4x4 unity_ObjectToWorld;
			float4x4 unity_MatrixVP;

			struct Vertex_Stage_Input
			{
				float4 pos : POSITION;
			};

			struct Vertex_Stage_Output
			{
				float4 pos : SV_POSITION;
			};

			Vertex_Stage_Output vert(Vertex_Stage_Input input)
			{
				Vertex_Stage_Output output;
				output.pos = mul(unity_MatrixVP, mul(unity_ObjectToWorld, input.pos));
				return output;
			}

			float4 frag(Vertex_Stage_Output input) : SV_TARGET
			{
				return float4(1.0, 1.0, 1.0, 1.0); // RGBA
			}

			ENDHLSL
		}
	}
	//CustomEditor "FireMaskShaderGUI"
}