{
	"type": "fx",
	"duration": 14,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.08361,
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
			"rotationZ": 210,
			"children": [
				{
					"type": "object",
					"name": "CorinoBase_mesh",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "District_1_3",
							"source": "Structure/Base/Corrino/CorrinoBase_District_01.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_2_2",
							"source": "Structure/Base/Corrino/CorrinoBase_District_02.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "District_3_1",
							"source": "Structure/Base/Corrino/CorrinoBase_District_03.fbx",
							"scaleY": 1.0000000000000004,
							"scaleZ": 1.0000000000000004,
							"rotationZ": -150.00000000000003
						},
						{
							"type": "model",
							"name": "CorrinoBase",
							"source": "Structure/Base/Corrino/CorrinoBase.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"rotationZ": -150.00000000000003,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"time": -0.1,
									"animation": "Structure/Base/Corrino/Anim_CorrinoBase.fbx"
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TESTSDECALS",
					"editorOnly": true,
					"children": [
						{
							"type": "object",
							"name": "Decals",
							"x": -9.11913,
							"y": -7.14714,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": -25.2,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.36755,
									"y": -0.18432,
									"scaleX": 7,
									"scaleY": 7,
									"scaleZ": 4,
									"rotationZ": 159.4,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1,
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
									"x": 0.64773,
									"y": 1.28361,
									"z": 0.75656,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 4,
									"rotationZ": 145.9,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.1
								}
							]
						},
						{
							"type": "object",
							"name": "Decals",
							"x": 10.72591,
							"y": -3.27284,
							"z": 1.90713,
							"scaleX": 8,
							"scaleY": 8,
							"scaleZ": 8,
							"rotationZ": 61.4,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": -0.5666,
									"y": -1.16683,
									"z": -0.19,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
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
									"x": -0.41394,
									"y": -0.66683,
									"z": -0.19293,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 2.419999999999999,
									"rotationZ": 17.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.95,
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
							"x": -0.81369,
							"y": 12.34346,
							"z": 4.62925,
							"scaleX": 8.2,
							"scaleY": 8.2,
							"scaleZ": 8.2,
							"rotationZ": 150.8,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Decal_Large",
									"x": 0.20787,
									"y": -0.67384,
									"z": -0.3,
									"scaleX": 4,
									"scaleY": 5,
									"scaleZ": 1.73,
									"rotationZ": 26.8,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
									"albedoStrength": 1.2
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"x": -0.4793,
									"y": 0.50076,
									"z": -0.3,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 1.56,
									"rotationZ": -14,
									"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
									"albedoStrength": 0.75
								}
							]
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_HighCinematic_ElectricExplosion",
					"source": "Fx/Explosion/BasesExplosions/FX_HighCinematic_ElectricExplosion.fx",
					"y": 4.440892098500626e-16,
					"z": -8.881784197001252e-16,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"time": 0.60774
				},
				{
					"type": "subFX",
					"name": "FX_SandShockwave",
					"source": "Fx/Explosion/BasesExplosions/FX_SandShockwave.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 1.04023
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 1.7114929035623998,
							"value": 0,
							"mode": 2
						},
						{
							"time": 1.7214929035624,
							"value": 0.35,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.0033333333333334103
							},
							"nextHandle": {
								"dv": -0.35583333333333333,
								"dt": 0.24184613222801432
							}
						},
						{
							"time": 6.164560612490172,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.005833333333333329,
								"dt": -3.2107886639318926
							},
							"nextHandle": {
								"dv": -0.0001150926715946202,
								"dt": 0.06342950122681006
							}
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
							"enabled": false,
							"x": 2.95844,
							"y": -6.69545,
							"scaleX": 35,
							"scaleY": 35,
							"scaleZ": 40,
							"rotationX": 41.5,
							"rotationZ": 12.3,
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
										"scale": 0.5
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.695389728546143,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.7053897285461428,
													"value": 2,
													"mode": 2
												},
												{
													"time": 3.008681893348697,
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
											"time": 0.6272815670818104,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6372815670818102,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.0724218750000007,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.0824218750000005,
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
							"z": 1.24096,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 40,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 40,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "BeforeTonemapping",
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
										"scale": 0.025
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.637675396548583,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.6476753965485829,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.577432461292484,
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
									"enabled": false,
									"keys": [
										{
											"time": 2.961924621090293,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.971924621090293,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.657220927700403,
											"value": 1,
											"mode": 2
										},
										{
											"time": 6.677493792995814,
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
							"enabled": false,
							"x": -14.91494,
							"y": 6.06757,
							"z": 8.32916,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 15,
							"rotationX": 1.1,
							"rotationY": -12.7,
							"rotationZ": 11.7,
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
													"time": 1.8335737985705334,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8435737985705332,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.699987792968751,
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
											"time": 1.7414912524074317,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.751491252407432,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.784507285580039,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.801382285580039,
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
							"enabled": false,
							"x": -25.06639,
							"y": -0.67857,
							"z": 2.12237,
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
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.835951805642826,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8459518056428257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.702365800041043,
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
											"time": 1.74257384441793,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7525738444179302,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.7798603739589467,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.7898603739589465,
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
							"enabled": false,
							"x": 19.45219,
							"y": -6.62946,
							"z": 2.12237,
							"scaleX": 18,
							"scaleY": 18,
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
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.829545368099959,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8395453680999587,
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
													"time": 3.057392578125004,
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
											"time": 1.7160895457118757,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7260895457118757,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.277739783748986,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.287739783748986,
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
							"enabled": false,
							"x": 23.0165,
							"y": 9.18624,
							"z": 2.12237,
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
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.8231879462249596,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.8331879462249594,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.3215625000000037,
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
											"time": 1.7300049891322866,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.7400049891322866,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.412652808651331,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.4226528086513306,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo05",
							"enabled": false,
							"x": -25.68932,
							"y": 2.28287,
							"z": 2.12237,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 25,
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
													"time": 2.929730914974958,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 2.939730914974958,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.9511230468750025,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
											"time": 2.839801627621055,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.8498016276210554,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.03576424740255,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.04576424740255,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo06",
							"enabled": false,
							"x": 17.01001,
							"y": -3.57503,
							"z": 2.12237,
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
													"time": 2.936850055599958,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 2.946850055599958,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.1219824218750025,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0002777777777778212,
														"dt": -0.4271484375000001
													},
													"nextHandle": {
														"dv": -1.9431447321434067e-16,
														"dt": 0.33332243025631764
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
											"time": 2.8377715601772078,
											"value": 0,
											"mode": 2
										},
										{
											"time": 2.8477715601772076,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.1959171023219834,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.205917102321983,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Explo07",
							"enabled": false,
							"x": 21.11964,
							"y": -0.8932,
							"z": 1.14834,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 30,
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
													"time": 3.342166057700263,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.3521660577002628,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.007061760156948,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.01722222222222225,
														"dt": -0.7208129882812511
													},
													"nextHandle": {
														"dv": -0.007834934023029533,
														"dt": 0.3332963924927146
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
											"time": 3.246911319449141,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.2569113194491406,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.091742061331466,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.101742061331466,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "HighExplosion",
							"enabled": false,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Explo07",
									"x": 10.04878,
									"y": -5.56732,
									"scaleX": 20,
									"scaleY": 20,
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
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													"time": 2.906740848049523,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.916740848049523,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.781980887874963,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.791980887874963,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "tower1",
									"x": -3.25986,
									"y": 0.6673,
									"z": 4.52195,
									"scaleX": 12,
									"scaleY": 12,
									"scaleZ": 20,
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
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													"time": 2.9575594439357538,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.9675594439357535,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.792117320522668,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.802117320522668,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "tower2",
									"x": 3.31567,
									"y": 1.39794,
									"z": 4.52195,
									"scaleX": 18,
									"scaleY": 18,
									"scaleZ": 20,
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
															"time": 3.045211857701097,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.0552118577010967,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.710107560157782,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.7208129882812511
															},
															"nextHandle": {
																"dv": -0.007834934023029533,
																"dt": 0.3332963924927146
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
													"time": 2.9575594439357538,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.9675594439357535,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.792117320522668,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.802117320522668,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								}
							]
						}
					]
				}
			]
		}
	]
}