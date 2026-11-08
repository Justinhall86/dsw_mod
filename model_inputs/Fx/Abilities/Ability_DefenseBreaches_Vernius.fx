{
	"type": "fx",
	"cullingRadius": 100,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"locked": true,
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
			"z": -1.7,
			"rotationZ": 90,
			"children": [
				{
					"type": "reference",
					"name": "Prefab_VerniusBase",
					"source": "Structure/Base/Vernius/Prefab_VerniusBase.prefab",
					"enabled": false
				},
				{
					"type": "object",
					"name": "Arrakeen",
					"x": 1.6402,
					"y": 0.12195,
					"z": -0.78492,
					"scaleX": 1.1,
					"scaleY": 1.1,
					"scaleZ": 1.1,
					"rotationZ": -57.3,
					"children": [
						{
							"type": "model",
							"name": "Shield_Arrakeen",
							"source": "Fx/Meshes_Common/Shield_Vernius.fbx",
							"x": -1.13961,
							"y": 0.17568,
							"scaleZ": 0.95,
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
											"emissive": 2
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
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
										"alpha": 0.75,
										"uScale": 3.5,
										"vScale": 4,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/Hextile_hex02-Both.png"
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.1,
											0.2
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.5450980392156862,
											0.5450980392156862
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Fire.png",
										"directionalNoise": false,
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											1
										],
										"scale": [
											1.5,
											1.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "Shield_ArrakeenLight",
							"source": "Fx/Meshes_Common/Shield_Vernius.fbx",
							"x": -1.13961,
							"y": 0.17568,
							"scaleZ": 0.95,
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
											"colorMask": 255
										}
									},
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/Alphas/T_SpiceAlpha.png",
										"uvShift": [
											0.1,
											0.2
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "UVDistortion",
									"source": "shaders/UVDistortion.hx",
									"props": {
										"noiseTexture": "Fx/noise/T_Fire.png",
										"directionalNoise": false,
										"intensity": 0.5,
										"scrollSpeed": [
											0,
											1
										],
										"scale": [
											1.5,
											1.5
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "intensity",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.5
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6274509803921569,
											0.11372549019607843,
											0.11372549019607843
										]
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
								"range": 3,
								"power": 0.8
							}
						},
						{
							"type": "advancedDecal",
							"name": "RedDecal",
							"locked": true,
							"x": -0.3885022222222222,
							"y": 0.6756266666666666,
							"z": -6.267944814814815,
							"scaleX": 90,
							"scaleY": 90,
							"scaleZ": 60.3,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
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
										"alpha": 0.125,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SpiceAlpha.png"
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0,
											0
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.39,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/circGrad3.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Glitch",
							"locked": true,
							"scaleX": 80,
							"scaleY": 80,
							"scaleZ": 22.22,
							"rotationZ": 90,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"fadePower": 1.64,
							"emissive": 2,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 0.49,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											-0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 0.34,
										"uvScaleX": 2,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
											"keys": [
												{
													"time": 0.700096015930177,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.710096015930177,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 0.8724153709411628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3808261871337897,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.39082618713379,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.5125998115539558,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5225998115539559,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.7153284645080569,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.62,
										"saturation": 0,
										"width": 0.17,
										"uvScaleX": 4,
										"uvScaleY": 6,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0,
											0.5
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											1,
											0.5450980392156862,
											0.5450980392156862
										]
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.1,
								"sandColorSet": false,
								"envBlend": 0.6,
								"envColorSet": false
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.8,
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