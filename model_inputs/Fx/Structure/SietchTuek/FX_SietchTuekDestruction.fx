{
	"type": "fx",
	"duration": 10,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 100,
			"scaleY": 100,
			"scaleZ": 70,
			"rotationZ": 180,
			"kind": 0,
			"args": [
				0
			],
			"children": [
				{
					"type": "material",
					"name": "material",
					"props": {
						"PBR": {
							"mode": "PBR",
							"blend": "None",
							"shadows": true,
							"culling": "Back",
							"depthTest": "Less",
							"colorMask": 15,
							"enableStencil": false
						}
					},
					"diffuseMap": "Fx/Test/Map_Albedo_VFXTest.png"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"rotationZ": 165,
			"children": [
				{
					"type": "object",
					"name": "DamageDecal",
					"locked": true,
					"x": -0.70724,
					"y": 3.11656,
					"z": -0.77242,
					"scaleX": 0.8,
					"scaleY": 1.4,
					"scaleZ": 1.2,
					"rotationZ": -150.1,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"scaleX": 80,
							"scaleY": 80,
							"scaleZ": 20,
							"rotationZ": 164.2,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 3,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 0.9,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.9161105423892169,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 2.993815207716545,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -1.031111111111111,
														"dt": -0.06311911844881202
													},
													"nextHandle": {
														"dv": 0.5053196155656107,
														"dt": 0.03353123907448944
													}
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
										"progress": 0.65,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.81,
										"saturation": 1,
										"width": 0.55,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad_uneaven.png",
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
							"name": "Sanddecal_02",
							"x": -0.23129,
							"y": 0.13246,
							"scaleX": 100.00000000000001,
							"scaleY": 100.00000000000001,
							"scaleZ": 20,
							"rotationZ": -27.1,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"normalMap": "Fx/DistortionMaps/sand-normal.png",
							"albedoStrength": 2,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0,
											0,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": true,
										"onDecal": true,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_SandDecal_02.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.9161105423892169,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 5.587040948717635e-17,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 1.0959708460955895
													}
												},
												{
													"time": 2.993815207716545,
													"value": 0.9666666666666667,
													"mode": 0,
													"prevHandle": {
														"dv": -1.031111111111111,
														"dt": -0.06311911844881202
													},
													"nextHandle": {
														"dv": 0.5053196155656107,
														"dt": 0.03353123907448944
													}
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
										"progress": 0.72,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_02.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.37,
										"saturation": 1,
										"width": 0.55,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad_uneaven.png",
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
						}
					]
				},
				{
					"type": "model",
					"name": "SietchTuek_mesh",
					"source": "Structure/Base/SietchTuek/SietchTuek.fbx",
					"editorOnly": true,
					"locked": true,
					"scaleX": 14.099999999999996,
					"scaleY": 14.099999999999996,
					"scaleZ": 14.1,
					"rotationZ": -150.00000000000003
				},
				{
					"type": "object",
					"name": "TESTDECALS",
					"editorOnly": true,
					"x": 1.3800599999999998,
					"y": 1.6993533333333328,
					"z": 3.4709866666666667,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": -13.96553,
							"y": -6.23203,
							"z": -3.47099,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.91,
									"y": -0.91,
									"scaleX": 7,
									"scaleY": 8,
									"scaleZ": 4,
									"rotationZ": 171.82,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.25,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"name": "Decal_tour",
									"x": 0.11299,
									"y": -0.31286,
									"z": 0.75656,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png"
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 14.14013,
							"y": -1.30447,
							"z": -1.56386,
							"scaleX": 7.999999999999999,
							"scaleY": 7.999999999999999,
							"scaleZ": 8,
							"rotationZ": 61.4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.0573,
									"y": -0.2022,
									"z": -0.19,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 2.5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 0.9,
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.24,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
									"name": "advancedDecal",
									"x": 0.28388,
									"y": 0.30461,
									"z": -0.19293,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 2.419999999999999,
									"rotationZ": 55.5,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.67,
												"saturation": 1,
												"width": 0.15,
												"uvScaleX": 0.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Water_04.png",
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
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": -6.228389999999999,
							"y": 9.842906666666666,
							"z": 5.034843333333333,
							"scaleX": 8.200000000000001,
							"scaleY": 8.200000000000001,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.18313,
									"y": 0.27765,
									"z": 0.27955,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 3,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.41723,
									"y": 1.40384,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 2,
									"rotationZ": 23.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.9
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_SietchTuek_Anticipation",
					"source": "Fx/Structure/SietchTuek/FX_SietchTuek_Anticipation.fx",
					"z": 0.2,
					"rotationZ": 30.4,
					"time": 0.41053,
					"children": [
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"enabled": false,
							"props": {
								"alpha": 0.7
							}
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_BlastTuek",
					"source": "Fx/Structure/SietchTuek/FX_BlastTuek.fx",
					"rotationZ": -150,
					"time": 2.13,
					"children": [
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_ScreenShake",
					"source": "Fx/Explosion/FX_ScreenShake.fx",
					"locked": true,
					"z": -2.70449,
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 79.99999999999999,
					"time": 2.39901
				},
				{
					"type": "object",
					"name": "BigExplosions",
					"children": [
						{
							"type": "subFX",
							"name": "Final - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 2.72398,
							"y": 1.11846,
							"z": 1.76285,
							"scaleX": 1.75,
							"scaleY": 1.75,
							"scaleZ": 1.75,
							"rotationX": 41.2,
							"rotationZ": 44.1,
							"time": 2.235,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "Final - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 2.21411,
							"y": 1.55214,
							"z": 5.73539,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.5,
							"rotationX": 41.2,
							"rotationZ": 44.1,
							"time": 2.235,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "subFX",
							"name": "Final - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 2.13517,
							"y": 1.84676,
							"z": 9.31993,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"rotationX": 56.5,
							"rotationY": -8.3,
							"rotationZ": 43,
							"time": 2.235,
							"children": [
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "object",
					"name": "LightDecals",
					"children": [
						{
							"type": "advancedDecal",
							"name": "HighExplosionAnticipation",
							"x": 4.39411,
							"y": -7.87019,
							"z": 4.12635,
							"scaleX": 65,
							"scaleY": 70,
							"scaleZ": 40,
							"rotationX": 44.7,
							"rotationY": 0.1,
							"rotationZ": 26.9,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.44190735846758145,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 0.45190735846758123,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7302242663502745,
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3737991970032488,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.3837991970032486,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7598236230015787,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7698236230015785,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "HighExplosion",
							"x": 1.19305,
							"y": -8.15531,
							"z": 8.11298,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 40,
							"rotationX": 28.1,
							"rotationY": -2.8,
							"rotationZ": 23.3,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"enabled": false,
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.7
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 2.840164163112642,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 2.850164163112642,
													"value": 1.5,
													"mode": 2
												},
												{
													"time": 7.0245478248596225,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
													}
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 2.768065346702936,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.778065346702936,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.463361653313046,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.483634518608457,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo01",
							"x": 15.85085,
							"y": -0.65494,
							"z": 6.89598,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"rotationX": -10.8,
							"rotationY": 34.9,
							"rotationZ": -41.8,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4119965395664178,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.4219965395664176,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.278410533964635,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
													}
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3199139934033162,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3299139934033164,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.362930026575923,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.3798050265759234,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo02",
							"x": -3.91539,
							"y": -10.87506,
							"z": 5.5401,
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5035476087844208,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.5135476087844206,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.369961603182638,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03361111111111109,
														"dt": -1.949996230602265
													},
													"nextHandle": {
														"dv": 0.0057926397589892495,
														"dt": 0.3333135451062032
													}
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.410169647559525,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4201696475595251,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4474561771005416,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.4574561771005414,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo03",
							"x": 14.65309,
							"y": -5.6072,
							"z": 0.43646,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4559964583762,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.4659964583761997,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.00028288673253867614,
														"dt": -0.0033279044480798515
													},
													"nextHandle": {
														"dv": -0.042361111111111294,
														"dt": 0.4986479912750421
													}
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0
												},
												{
													"time": 2.683843668401245,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666552,
														"dt": -1.1107519531250034
													},
													"nextHandle": {
														"dv": 0.006356705433136639,
														"dt": 0.3333088994929532
													}
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3425406359881167,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.3525406359881167,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.904190874025227,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.914190874025227,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo04",
							"x": 3.3706,
							"y": -10.7487,
							"z": 0.98894,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "AfterTonemapping",
											"blend": "Add",
											"shadows": false,
											"culling": "Back",
											"colorMask": 255,
											"emissive": 70
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9050087483175115,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.9150087483175113,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0
												},
												{
													"time": 3.4033833020925557,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666663,
														"dt": -0.9326074218750007
													},
													"nextHandle": {
														"dv": 0.006055923122821887,
														"dt": 0.33331271905465326
													}
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
											0.8745098039215686,
											0.3803921568627451,
											0.22745098039215686
										]
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
										"progress": 0.45,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 3.25,
										"texture": "Fx/noise/T_Fire.png",
										"uvShift": [
											0,
											-0.2
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
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8118257912248386,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8218257912248386,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4944736107438827,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5044736107438825,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 2.7896792102969687,
							"value": 0,
							"mode": 2
						},
						{
							"time": 2.799679210296969,
							"value": 0.45,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.0033333333333334103
							},
							"nextHandle": {
								"dv": -0.3275,
								"dt": 0.10820990551342557
							}
						},
						{
							"time": 5.929813098907473,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.0018518518518517435,
								"dt": -3.073885765075682
							},
							"nextHandle": {
								"dv": -5.6766063595290996e-18,
								"dt": 0.06343031018886429
							}
						}
					]
				},
				{
					"type": "object",
					"name": "SmallExplosions",
					"x": 2.36314,
					"y": -2.803138571428571,
					"z": 3.3610814285714286,
					"children": [
						{
							"type": "subFX",
							"name": "01 - FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 1.81389,
							"y": -7.6381,
							"z": -4.24333,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationX": -6.3,
							"rotationY": -27.7,
							"rotationZ": 30.5,
							"time": 1.29572
						},
						{
							"type": "subFX",
							"name": "09 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": 11.33693,
							"y": 1.93955,
							"z": 0.75611,
							"scaleX": 0.8999999999999999,
							"scaleY": 0.8999999999999999,
							"rotationX": -29.4,
							"rotationY": 35,
							"rotationZ": -3.8,
							"time": 1.14177
						},
						{
							"type": "subFX",
							"name": "10 - FX_Directional_Explosion_trails",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base.fx",
							"x": -6.16444,
							"y": -7.15982,
							"z": -1.06172,
							"scaleX": 0.9999999999999999,
							"scaleZ": 1.5,
							"rotationX": 24,
							"rotationY": -29,
							"rotationZ": -21.6,
							"time": 1.25723
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": 11.65087,
							"y": -2.46497,
							"z": -3.29957,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": -27.1,
							"rotationY": 60.5,
							"rotationZ": 4.1,
							"time": 1.01348
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.75,
								"ATTENUATE": true,
								"emissiveMap": null
							},
							"isInstance": true
						}
					]
				}
			]
		}
	]
}