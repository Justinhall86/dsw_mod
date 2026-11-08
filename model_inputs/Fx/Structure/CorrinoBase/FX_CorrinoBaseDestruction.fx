{
	"type": "fx",
	"cullingRadius": 150,
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
					"name": "TESTSDECALS",
					"editorOnly": true,
					"locked": true,
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
					"type": "object",
					"name": "CorinoBase_mesh",
					"editorOnly": true,
					"locked": true,
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
					"type": "model",
					"name": "Mesh_sidescorrino",
					"source": "Fx/Structure/CorrinoBase/Mesh_sidescorrino.fbx",
					"z": 0.33424,
					"scaleX": 1.0499999999999998,
					"scaleY": 1.0500000000000003,
					"scaleZ": 1.0500000000000003,
					"rotationZ": -150,
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
									"emissive": 15
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
								"alpha": 1,
								"uScale": 1,
								"vScale": 0.75,
								"uOffset": -0.42,
								"vOffset": 0.35,
								"texture": "Fx/Alphas/T_Flare04.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.8381562745571141,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015960427820990455,
												"dt": -0.49990576705532597
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 1.0440525627136237
											}
										},
										{
											"time": 3.0666384780406952,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 3.078307889699936,
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
									0.45098039215686275,
									0.2901960784313725
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "model",
					"name": "Mesh_sidescorrino",
					"source": "Fx/Structure/CorrinoBase/Mesh_sidescorrino_L.fbx",
					"x": 0.52232,
					"y": -0.30156,
					"z": 0.33424,
					"scaleX": 1.0499999999999998,
					"scaleY": 1.0500000000000003,
					"scaleZ": 1.0500000000000003,
					"rotationZ": -150,
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
									"emissive": 15
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
								"alpha": 1,
								"uScale": 1,
								"vScale": 0.75,
								"uOffset": -0.42,
								"vOffset": 0.35,
								"texture": "Fx/Alphas/T_Flare04.png"
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.8381562745571141,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.015960427820990455,
												"dt": -0.49990576705532597
											},
											"nextHandle": {
												"dv": -0.033333333333333326,
												"dt": 1.0440525627136237
											}
										},
										{
											"time": 3.0666384780406952,
											"value": 1,
											"mode": 1,
											"prevHandle": {
												"dv": -0.9666666666666667,
												"dt": -0.038011622428894
											},
											"nextHandle": {
												"dv": -0.7333333333333334,
												"dt": 0.011669411659240847
											}
										},
										{
											"time": 3.078307889699936,
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
									0.45098039215686275,
									0.2901960784313725
								]
							},
							"isInstance": true
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_SideExplosions_Corrino",
					"source": "Fx/Structure/CorrinoBase/FX_SideExplosions_Corrino.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 2.00258
				},
				{
					"type": "subFX",
					"name": "FX_ElectricitySmall",
					"source": "Fx/Structure/CorrinoBase/FX_ElectricitySmall.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 4.54876
				},
				{
					"type": "subFX",
					"name": "FX_ElectricitySmall",
					"source": "Fx/Structure/CorrinoBase/FX_ElectricitySmall.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 3.35384
				},
				{
					"type": "subFX",
					"name": "FX_ElectricityBig",
					"source": "Fx/Structure/CorrinoBase/FX_ElectricityBig.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 3.498
				},
				{
					"type": "subFX",
					"name": "FX_Corrino_FinalExplosion",
					"source": "Fx/Structure/CorrinoBase/FX_Corrino_FinalExplosion.fx",
					"scaleX": 0.9999999999999998,
					"scaleY": 0.9999999999999998,
					"rotationZ": 150.00000000000003,
					"time": 1.29746
				},
				{
					"type": "object",
					"name": "ElectricitySides",
					"x": 0.165,
					"y": 1.555,
					"z": 1.56,
					"children": [
						{
							"type": "object",
							"name": "Elec02",
							"x": 4.51286,
							"y": 17.73675,
							"z": 2.53896,
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
							"rotationX": -136.7,
							"rotationY": -25.2,
							"rotationZ": -57.5,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"warmUpTime": -3.55,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.8,
											1,
											1
										],
										"lifeTime": 0.15,
										"instScale": 0.9
									},
									"x": 0.12,
									"y": -0.14,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Elec02",
							"x": -19.16797,
							"y": 11.04802,
							"z": 1.56087,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": -7.3,
							"rotationY": 160.3,
							"rotationZ": -61.1,
							"children": [
								{
									"type": "emitter",
									"name": "emitter",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0,
										"warmUpTime": -3.75,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 0.7,
										"instStretch": [
											1.8,
											1,
											1
										],
										"lifeTime": 0.15,
										"burstDelay": 0.5
									},
									"x": 0.12,
									"y": -0.14,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "None",
															"colorMask": 255,
															"depthTest": "Less",
															"emissive": 10
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "NightEmissive",
													"source": "shaders/NightEmissive.hx",
													"props": {
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
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
														"progress": 0.4,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
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
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										}
									]
								}
							]
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
							"name": "01 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": -2.07187,
							"y": 2.10468,
							"z": 2.44822,
							"scaleX": 1.5,
							"scaleY": 1.5000000000000009,
							"scaleZ": 1.5000000000000009,
							"rotationX": -13,
							"rotationY": -44.9,
							"rotationZ": 34.5,
							"time": 0.13177
						},
						{
							"type": "subFX",
							"name": "06 - FX_Directional_Explosion_High",
							"source": "Fx/Explosion/FX_Directional_Explosion_High.fx",
							"x": -20.65827,
							"y": 1.71463,
							"z": -1.06295,
							"scaleX": 1.3,
							"scaleY": 1.3,
							"scaleZ": 1.3,
							"rotationX": -7.5,
							"rotationY": -29.3,
							"rotationZ": 40.8,
							"time": 0.32437
						},
						{
							"type": "subFX",
							"name": "07 - FX_Explosion_Mid_Slow_SmallDistort",
							"source": "Fx/Explosion/BasesExplosions/FX_Explosion_Mid_Slow_SmallDistort_Base.fx",
							"x": 18.04818,
							"y": -1.25377,
							"z": -3.33634,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"rotationZ": -180
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
							"name": "Explo01",
							"x": -0.54429,
							"y": -0.99853,
							"z": 6.04165,
							"scaleX": 22,
							"scaleY": 22,
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
													"time": 0.58017553541412,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.5901755354141198,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.4465895298123375,
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
											"time": 0.4880929892510185,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.4980929892510185,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.5311090224236255,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.5479840224236256,
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
							"x": -17.7246,
							"y": -1.45029,
							"z": 1.47536,
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
													"time": 0.8107857900178259,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 0.8207857900178257,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.677199784416043,
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
											"time": 0.7174078287929301,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.7274078287929301,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7546943583339467,
											"value": 1,
											"mode": 2
										},
										{
											"time": 2.7646943583339465,
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
							"x": 20.12686,
							"y": -5.23793,
							"z": 2.12237,
							"scaleX": 25,
							"scaleY": 25,
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
													"time": 1.520141071224959,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 1.5301410712249588,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3.018515625000003,
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
											"time": 1.426958114132286,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.436958114132286,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.10960593365133,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3.11960593365133,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs",
							"x": 2.45221,
							"y": -3.90778,
							"scaleX": 70,
							"scaleY": 70,
							"scaleZ": 30,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.50268559008837,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.51268559008837,
													"value": 2,
													"mode": 2
												},
												{
													"time": 3.937295861542227,
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
											0.4666666666666667,
											0.8352941176470589,
											1
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
											"time": 3.2028130554064442,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.212813055406444,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.2231912634003725,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.233191263400372,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs2",
							"x": 1.37387,
							"y": -3.2852,
							"z": 4.8434,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.3
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 4.503341550529006,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 4.513341550529006,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.448120411246203,
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
											0.4666666666666667,
											0.8352941176470589,
											1
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
											"time": 4.225719178428992,
											"value": 0,
											"mode": 2
										},
										{
											"time": 4.235719178428992,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.721018086397673,
											"value": 1,
											"mode": 2
										},
										{
											"time": 5.731018086397673,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs2",
							"x": 6.45463,
							"y": 15.36846,
							"z": 2.46858,
							"scaleX": 30,
							"scaleY": 30,
							"scaleZ": 30,
							"rotationX": -32.7,
							"rotationY": -4.3,
							"rotationZ": -36.6,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.566830202937128,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.5768302029371277,
													"value": 2,
													"mode": 2
												},
												{
													"time": 4.001440474390984,
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
											0.4666666666666667,
											0.8352941176470589,
											1
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
											"time": 3.2393454169429634,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.249345416942963,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.351054528778188,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.361054528778188,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "eclairs2",
							"x": -17.54791,
							"y": 12.59973,
							"z": 2.46858,
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 30,
							"rotationX": -15,
							"rotationY": -24.2,
							"rotationZ": 3.2,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"albedoStrength": 3,
							"emissive": 45,
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
											"colorMask": 255
										}
									}
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.2
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 3.759264041483405,
													"value": -0.01666666666666672,
													"mode": 0
												},
												{
													"time": 3.769264041483405,
													"value": 1,
													"mode": 2
												},
												{
													"time": 4.193874312937261,
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
											0.4666666666666667,
											0.8352941176470589,
											1
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
											"time": 3.5133381284668608,
											"value": 0,
											"mode": 2
										},
										{
											"time": 3.5233381284668606,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.424119251851228,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4.434119251851228,
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
					"type": "object",
					"name": "DamageDecal",
					"x": 2.7755575615628914e-17,
					"y": 0.47709000000000007,
					"z": -0.77242,
					"children": [
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 70.00000000000003,
							"scaleY": 70.00000000000003,
							"scaleZ": 20,
							"rotationZ": 120.59999999999998,
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
													"time": 2.2102078729594368,
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
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
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
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Sanddecal_02",
							"z": 1.1102230246251565e-16,
							"scaleX": 100.00000000000001,
							"scaleY": 100.00000000000001,
							"scaleZ": 20,
							"rotationZ": 156.1,
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
													"time": 2.2102078729594368,
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
													"time": 3.287912538286765,
													"value": 0.9666666666666667,
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
								}
							]
						}
					]
				}
			]
		}
	]
}