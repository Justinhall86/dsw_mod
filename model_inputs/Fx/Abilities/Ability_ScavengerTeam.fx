{
	"type": "fx",
	"cullingRadius": 150,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": 528.65001,
			"y": 1111.05802,
			"z": 0.02,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "GoldVolutes",
					"z": 1,
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"children": [
						{
							"type": "model",
							"name": "Spiral",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"scaleX": 250,
							"scaleY": 250,
							"scaleZ": 92.5,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"emissive": 3,
											"textureWrap": true
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.6,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.33,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.7,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.01,
											-0.015
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.27,
										"saturation": 0.35,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8235294117647058,
											0.6196078431372549,
											0.48627450980392156
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "model",
							"name": "Spiral",
							"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
							"scaleX": 150,
							"scaleY": 150,
							"scaleZ": 55.5,
							"rotationZ": 42.79999999999999,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
											"blend": "Alpha",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"depthTest": "LessEqual",
											"enableStencil": false,
											"emissive": 3,
											"textureWrap": true
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"normalMap": "Fx/DistortionMaps/water-normal.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.6,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
										"onDecal": false
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.39,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.8,
										"texture": "Fx/noise/causticTexture_02.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											-0.005,
											-0.02
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.32,
										"saturation": 0.61,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										],
										"uvScaleSpeed": [
											0,
											0
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.8235294117647058,
											0.6196078431372549,
											0.48627450980392156
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.75,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.35,
								"sandColorSet": false,
								"envBlend": 0.7,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "shader",
					"name": "DepthBlend",
					"source": "shaders/DepthBlend.hx",
					"props": {
						"REVERSE": false,
						"range": 1.2,
						"power": 0.8
					}
				},
				{
					"type": "shader",
					"name": "AlphaMult",
					"source": "shaders/AlphaMult.hx",
					"props": {
						"alpha": 0.6
					}
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_floor",
					"scaleX": 500,
					"scaleY": 500,
					"scaleZ": 33,
					"albedoMap": "Fx/Gradients/circGrad01.png",
					"renderMode": "BeforeTonemapping",
					"children": [
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 0.75,
								"color": [
									0.5882352941176471,
									0.30980392156862746,
									0.23137254901960785
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.2
							}
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_stars",
					"scaleX": 250,
					"scaleY": 250,
					"scaleZ": 25,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"emissive": 20,
					"renderMode": "BeforeTonemapping",
					"blendMode": 2,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMap",
							"source": "shaders/AlphaMap.hx",
							"props": {
								"useSourceUVs": false,
								"onDecal": false,
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 5,
								"vScale": 5,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/Dust02.png"
							}
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.5,
								"saturation": 1,
								"width": 0.5,
								"uvScaleX": 3.5,
								"uvScaleY": 3.5,
								"texture": "Fx/Alphas/Dust02.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									-0.01,
									0.025
								]
							}
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": false,
								"wrap": true,
								"progress": 0.23,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Gradients/circGrad05.jpg",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							}
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"props": {
								"amount": 1,
								"color": [
									0.6352941176470588,
									0.32156862745098036,
									0.10980392156862745
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				}
			]
		}
	]
}