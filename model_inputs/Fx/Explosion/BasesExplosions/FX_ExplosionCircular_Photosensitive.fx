{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 50,
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
			"children": [
				{
					"type": "object",
					"name": "Carthag",
					"z": -0.5,
					"rotationZ": 180,
					"children": [
						{
							"type": "model",
							"name": "BaseCarthag_mesh",
							"source": "Structure/Base/Carthag/BaseCarthag.fbx",
							"editorOnly": true,
							"locked": true,
							"scaleX": 7.7,
							"scaleY": 7.7,
							"scaleZ": 7.7
						},
						{
							"type": "object",
							"name": "TESTSDECALS",
							"editorOnly": true,
							"locked": true,
							"x": 0.9875483333333329,
							"y": 1.0622166666666666,
							"z": 0.7094466666666666,
							"children": [
								{
									"type": "object",
									"name": "Decals",
									"x": 7.571313333333334,
									"y": 8.618826666666667,
									"z": 0.4882366666666669,
									"scaleX": 8,
									"scaleY": 8,
									"scaleZ": 8,
									"rotationZ": 121.4,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Decal_Large",
											"x": -0.0573,
											"y": -0.2022,
											"z": -0.19,
											"scaleX": 5,
											"scaleY": 5,
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
											"x": 0.04591,
											"y": 0.07799,
											"z": -0.19293,
											"scaleX": 4.619999999999998,
											"scaleY": 4.619999999999998,
											"scaleZ": 2.419999999999999,
											"rotationZ": 55.5,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
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
									"locked": true,
									"x": 0.9049033333333341,
									"y": -12.124433333333332,
									"z": -1.4188933333333331,
									"scaleX": 7.999999999999999,
									"scaleY": 7.999999999999999,
									"scaleZ": 8,
									"rotationZ": 54.55,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Decal_Large",
											"x": -0.45,
											"y": 0.11077,
											"scaleX": 6,
											"scaleY": 7,
											"scaleZ": 4,
											"rotationZ": 117.27,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.2,
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
											"x": 0.91,
											"y": -0.91,
											"z": 0.75656,
											"scaleX": 3,
											"scaleY": 3,
											"scaleZ": 4,
											"rotationZ": 145.9,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.2
										}
									]
								},
								{
									"type": "object",
									"name": "Decals",
									"x": -8.476216666666666,
									"y": 3.505606666666667,
									"z": 0.9306566666666667,
									"scaleX": 8.200000000000001,
									"scaleY": 8.200000000000001,
									"scaleZ": 8.2,
									"rotationZ": 177.5,
									"children": [
										{
											"type": "advancedDecal",
											"name": "Decal_Large",
											"x": 0.33745,
											"y": -0.36061,
											"z": -0.3,
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 1.73,
											"rotationZ": 26.8,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_Large_01_Albedo.png",
											"albedoStrength": 1.2
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal",
											"x": -0.1923,
											"y": 0.28425,
											"z": -0.3,
											"scaleX": 3,
											"scaleY": 3,
											"scaleZ": 1.56,
											"rotationZ": 23.9,
											"albedoMap": "Structure/Base/Destruction/Destruction_Decal_01_Albedo.png",
											"albedoStrength": 0.75
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FireTube_Small",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"animationSpeed": 0,
								"instStretch": [
									1,
									0.9,
									6.25
								],
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0.75
								],
								"instScale": 40,
								"instScale_rand": 1,
								"seedGroup": 3,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"maxCount": 1,
								"randomColor2": [
									0.9764705882352941,
									0.9647058823529412,
									0.9529411764705882,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
								"lifeTime": 2.75,
								"warmUpTime": -0.7,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Cylinder",
									"source": "Fx/Meshes_Common/CylinderCone_StraightUV_02.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 90,
									"rotationZ": -90,
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
													"depthTest": "LessEqual",
													"emissive": 2,
													"drawOrder": "-80",
													"depthWrite": "Off"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											}
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
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
												"progress": 0.5,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.015
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 0.4501476276915423,
																"dt": -0.6144515117989549
															},
															"nextHandle": {
																"dv": -0.33333333333333337,
																"dt": 0.455
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.2833333333333333,
																"dt": -0.29500000000000004
															},
															"nextHandle": {
																"dv": -0.40250763363430087,
																"dt": 0.41908147737218393
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 0.060466822934651644,
																"dt": -0.6288549585203788
															},
															"nextHandle": {
																"dv": -0.050000000000000044,
																"dt": 0.5199999999999999
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.5166666666666667,
																"dt": -0.28500000000000003
															},
															"nextHandle": {
																"dv": -0.6945707990960908,
																"dt": 0.38313421498526273
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "uvShift.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.627604695281038,
																"dt": -0.03181478228005878
															},
															"nextHandle": {
																"dv": 0.7272727272727273,
																"dt": 0.0049999999999999975
															}
														},
														{
															"time": 1,
															"value": 0.75,
															"prevHandle": {
																"dv": -0.03078505856283631,
																"dt": -0.965
															},
															"nextHandle": {
																"dv": 0.010496026753190169,
																"dt": 0.33329640953501305
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.5,
													0.05
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "uvShift.y",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"prevHandle": {
																"dv": -4.5873478210854435,
																"dt": -0.08620197733444586
															},
															"nextHandle": {
																"dv": 0.11666666666666664,
																"dt": 0.002615486322407691
															}
														},
														{
															"time": 1,
															"value": 0.1,
															"prevHandle": {
																"dv": -0.03078505856283631,
																"dt": -0.965
															},
															"nextHandle": {
																"dv": 0.010496026753190169,
																"dt": 0.33329640953501305
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "Fresnel",
											"source": "shaders/Fresnel.hx",
											"props": {
												"RGB": false,
												"ALPHA": true,
												"REVERSE": true,
												"bias": 0.21,
												"scale": 1,
												"power": 1,
												"color": [
													0,
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
													0.45098039215686275,
													0.2901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.725,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"prevHandle": {
												"dv": -0.8857207607292744,
												"dt": -1.0834716920811199e-16
											},
											"nextHandle": {
												"dv": 0.5874999999999999,
												"dt": -0.00005639384240207351
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -1.1332393435959967
											},
											"nextHandle": {
												"dv": -1.2260459771389204e-16,
												"dt": 0.33333778335634656
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FireTube_Big",
							"props": {
								"enableSort": false,
								"emitSurface": true,
								"frameCount": 4,
								"animationSpeed": 0,
								"instStretch": [
									0.97,
									0.97,
									1.85
								],
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0.05
								],
								"instScale": 62,
								"instScale_rand": 1,
								"seedGroup": 4,
								"useRandomColor": true,
								"randomColor1": [
									0.8235294117647058,
									0.7686274509803921,
									0.7176470588235294,
									1
								],
								"instSpeed_rand": [
									0,
									0,
									0
								],
								"maxCount": 1,
								"randomColor2": [
									0.9764705882352941,
									0.9647058823529412,
									0.9529411764705882,
									1
								],
								"instRotation_rand": [
									0,
									0,
									0
								],
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"spriteSheet": "Fx/Alphas/T_DirectionalSmoke_Mesh_2x2.png",
								"lifeTime": 2.5,
								"warmUpTime": -0.7,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"z": 2.5129,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Cylinder",
									"source": "Fx/Meshes_Common/FireTube_tapered03.fbx",
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": 90,
									"rotationZ": -90,
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
													"depthTest": "LessEqual",
													"emissive": 2,
													"drawOrder": "-80",
													"depthWrite": "Off"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.7
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.5449999999999999
															},
															"nextHandle": {
																"dv": 0.010192021509306938,
																"dt": 0.33327910335433686
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1,
												"power": 0.8
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
													0.7058823529411764,
													0.3176470588235294,
													0.19607843137254902
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
												"useScale": true,
												"wrap": true,
												"progress": 0.66,
												"saturation": 0.25,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.025
												],
												"uvScaleSpeed": [
													0,
													0
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 2.942491792923777,
																"dt": -0.4808822806105675
															},
															"nextHandle": {
																"dv": -1.1,
																"dt": 0.18019275266053364
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.49096045782441833
															},
															"nextHandle": {
																"dv": -7.865461723911139e-16,
																"dt": 0.4224127050774995
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 0.75,
												"texture": "Fx/Gradients/vGrad_uneaven.png",
												"uvShift": [
													0.5,
													0.1
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
													0.45098039215686275,
													0.2901960784313725
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.725,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"prevHandle": {
												"dv": -0.7525956070201336,
												"dt": -0.10924774940614855
											},
											"nextHandle": {
												"dv": 0.5166666666666666,
												"dt": 0.075
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.841171875
											},
											"nextHandle": {
												"dv": -1.0751357358769627e-16,
												"dt": 0.33333333333333326
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "FireExplo_floor",
					"z": 2.5,
					"scaleX": 0.75,
					"scaleY": 0.75,
					"scaleZ": 0.75,
					"children": [
						{
							"type": "emitter",
							"name": "FireExplo_floor",
							"props": {
								"warmUpTime": -0.7,
								"emitType": "Burst",
								"instScale": 48,
								"lifeTime": 2.5,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"maxCount": 5,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"z": -0.75,
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
													"depthTest": "LessEqual",
													"emissive": 2,
													"drawOrder": "-80",
													"depthWrite": "Off"
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
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle5.png"
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.38408525123202764
															},
															"nextHandle": {
																"dv": 0.014436864824411356,
																"dt": 0.3332756687015779
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.4258279990287213,
																"dt": -0.24442765697635202
															},
															"nextHandle": {
																"dv": -1.1666666666666665,
																"dt": 0.20000000000000007
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0.033333333333333326,
																"dt": -0.33999999999999986
															},
															"nextHandle": {
																"dv": -0.03266568666923559,
																"dt": 0.33319000402620214
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 8,
												"power": 0.8
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
													0.7058823529411764,
													0.3176470588235294,
													0.19607843137254902
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"prevHandle": {
												"dv": -2.494073049921499,
												"dt": -0.0712919490177076
											},
											"nextHandle": {
												"dv": 0.6127090979023997,
												"dt": 0.018205260047565522
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": -0.0010974281668227892,
												"dt": -1.0012819571088818
											},
											"nextHandle": {
												"dv": -1.6811564388663527e-16,
												"dt": 0.2703197486375193
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "LensFlare",
					"enabled": false,
					"x": -1.51052,
					"y": -0.5043,
					"z": -6.32523,
					"scaleX": 10.5,
					"scaleY": 10.5,
					"scaleZ": 10.5,
					"children": [
						{
							"type": "emitter",
							"name": "LensFlare_circle",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 1.5,
								"maxCount": 5,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									150
								],
								"instScale": 7,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -0.7,
								"instOffset": [
									1.25,
									0,
									0
								],
								"instRotation": [
									0,
									0,
									25
								],
								"instOffset_rand": [
									0.2,
									0,
									0
								],
								"lifeTime": 1.8,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"x": 0.05686,
							"y": -0.145,
							"z": 2.75,
							"scaleX": 0.09999999999999999,
							"scaleY": 0.09999999999999999,
							"scaleZ": 0.09999999999999999,
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
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 5
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_01.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
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
													0.6941176470588235,
													0.3607843137254902,
													0.2588235294117647
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 5,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "LensFlare_color_big2",
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 0,
								"maxCount": 50,
								"simulationSpace": "World",
								"animationSpeed": 0,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"randomColor2": [
									0.9215686274509803,
									0.9215686274509803,
									0.9215686274509803,
									0.8509803921568627
								],
								"emitAngle": 0,
								"emitRate": 1,
								"instRotation_rand": [
									0,
									0,
									0
								],
								"instScale": 10.5,
								"emitType": "Burst",
								"burstDelay": 0.12,
								"instWorldSpeed_rand": [
									0,
									0,
									0
								],
								"instStretch_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -0.7,
								"instRotation": [
									20,
									0,
									0
								],
								"lifeTime": 3,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"z": 1.25,
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
													"culling": "Back",
													"depthTest": "Less",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": true,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 15
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/T_circleGradient_color_double.png",
											"color": [
												0.9411764705882353,
												0.807843137254902,
												0.7058823529411764,
												1
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.325,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_LensFlare_Double.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"prevHandle": {
																"dv": 1.2619278819653144,
																"dt": -0.3266166282733753
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.22000000000000003
															}
														},
														{
															"time": 1,
															"value": 0.033333333333333326,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 24.24,
												"power": 0.8
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.8,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keys": [
										{
											"time": 0,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1.1,
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
					"name": "Shockwave",
					"z": 1,
					"children": [
						{
							"type": "emitter",
							"name": "ShockWave3",
							"props": {
								"emitType": "Burst",
								"instScale": 300,
								"emitDuration": 20,
								"burstDelay": 1.35,
								"speedFactor": 0.5,
								"lifeTime": 15,
								"warmUpTime": -0.35,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
											"color": -16777216
										},
										{
											"position": 1,
											"color": -1
										}
									],
									"resolution": 64,
									"isVertical": false,
									"interpolation": "Linear",
									"colorMode": 0
								}
							},
							"z": 0.5,
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
													"culling": "Back",
													"colorMask": 255,
													"depthTest": "LessEqual"
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_BlurCircle.png",
												"onDecal": false
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.286550392695083,
																"dt": -0.31785362643054976
															},
															"nextHandle": {
																"dv": -0.85,
																"dt": 0.21000000000000002
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.815
															},
															"nextHandle": {
																"dv": -2.7211090888961944e-16,
																"dt": 0.3332931287768935
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.28500000000000003,
															"value": 0
														},
														{
															"time": 0.36,
															"value": 0.6,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.6499999999999999
															},
															"nextHandle": {
																"dv": -2.7211090888961944e-16,
																"dt": 0.3332931287768935
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.41000000000000025,
															"value": 0
														},
														{
															"time": 0.42000000000000026,
															"value": 0.35,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.405
															},
															"nextHandle": {
																"dv": 0.013714721486098064,
																"dt": 0.33326773211218813
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4600000000000005,
															"value": 0
														},
														{
															"time": 0.47000000000000053,
															"value": 0.35,
															"mode": 2
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.405
															},
															"nextHandle": {
																"dv": 0.013714721486098064,
																"dt": 0.33326773211218813
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.6,
												"envColorSet": false
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
												"progress": 0.64,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/T_Noise_Grunge_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.0049999999999999975,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 0.4,
															"prevHandle": {
																"dv": 0,
																"dt": -0.8949999999999999
															},
															"nextHandle": {
																"dv": -1.347456942463063e-16,
																"dt": 0.33008462768233626
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0.0006153761397992286,
											"value": 0,
											"mode": 1,
											"prevHandle": {
												"dv": -0.5609260576910832,
												"dt": -0.42893757473558736
											},
											"nextHandle": {
												"dv": 1.1875,
												"dt": 0.0020001101826084625
											}
										},
										{
											"time": 1,
											"value": 1,
											"prevHandle": {
												"dv": 0.010416666666666519,
												"dt": -0.98203833016689
											},
											"nextHandle": {
												"dv": -0.0008405810382348004,
												"dt": 0.0792558235752288
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SandShockWave",
							"z": 2,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "emitter",
									"name": "Impact_Burst_Mid_SandJet_L",
									"props": {
										"instScale_rand": 3.5,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 7,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen",
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitAngle": 180,
										"instRotation": [
											0,
											0,
											-30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 3,
										"instSpeed": [
											2,
											0,
											0
										],
										"emitRad2": 0.9,
										"useRandomColor": true,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 0.19999999999999998,
									"rotationZ": -90,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.5,
											"scaleY": 2.5,
											"scaleZ": 2.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														0.27058823529411763
													]
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.15,
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
															1,
															1,
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.02
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Impact_Burst_Mid_SandJet_R",
									"props": {
										"instScale_rand": 3.5,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 7,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen",
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.6,
										"emitType": "Burst",
										"burstParticleCount": 10,
										"emitAngle": 180,
										"instRotation": [
											0,
											0,
											30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 2,
										"instSpeed": [
											2,
											0,
											0
										],
										"emitRad2": 0.9,
										"useRandomColor": true,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 40,
									"scaleY": 40,
									"scaleZ": 0.2,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.5,
											"scaleY": 2.5,
											"scaleZ": 2.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														0.27058823529411763
													]
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.15,
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
															1,
															1,
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.02
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Impact_Burst_Far_SandJet_R",
									"props": {
										"instScale_rand": 4,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 8,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											0.5,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen",
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"burstParticleCount": 18,
										"emitAngle": 180,
										"instRotation": [
											0,
											0,
											30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 5,
										"instSpeed": [
											3,
											0,
											0
										],
										"useRandomColor": true,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 0.2,
									"rotationZ": 90,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.5,
											"scaleY": 2.5,
											"scaleZ": 2.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														0.27058823529411763
													]
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.15,
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
															1,
															1,
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.02
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.3,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Impact_Burst_Far_SandJet_L",
									"props": {
										"instScale_rand": 4,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"enableSort": false,
										"instRotation_rand": [
											0,
											0,
											15
										],
										"lifeTimeRand": 3,
										"emitShape": "Cylinder",
										"emitSurface": true,
										"emitOrientation": "Normal",
										"instScale": 8,
										"lifeTime": 4,
										"emitRad1": 0.8,
										"randomColor2": [
											0.8431372549019608,
											0.7607843137254902,
											0.7254901960784313,
											1
										],
										"instSpeed_rand": [
											0.5,
											0,
											0
										],
										"emitRate": 20,
										"maxCount": 100,
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Grunge_4x4_01.png",
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"alignMode": "Screen",
										"instStretch_rand": [
											0,
											0.25,
											0
										],
										"instStretch": [
											1,
											2,
											1
										],
										"warmUpTime": -0.75,
										"emitType": "Burst",
										"burstParticleCount": 18,
										"emitAngle": 180,
										"instRotation": [
											0,
											0,
											-30
										],
										"emitDuration": 20,
										"burstDelay": 1.35,
										"seedGroup": 4,
										"instSpeed": [
											3,
											0,
											0
										],
										"useRandomColor": true,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
													"color": -16777216
												},
												{
													"position": 1,
													"color": -1
												}
											],
											"resolution": 64,
											"isVertical": false,
											"interpolation": "Linear",
											"colorMode": 0
										}
									},
									"x": -0.7514,
									"z": -0.32935,
									"scaleX": 55,
									"scaleY": 55,
									"scaleZ": 0.2,
									"rotationZ": -90,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 2.5,
											"scaleY": 2.5,
											"scaleZ": 2.5,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false
														}
													},
													"color": [
														1,
														0.7764705882352941,
														0.5647058823529412,
														0.27058823529411763
													]
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.15,
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
															1,
															1,
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
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.58,
														"saturation": 0,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/Wave_01.jpg",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.02
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9,
																	"prevHandle": {
																		"dv": 1.1946815774171073,
																		"dt": -0.37422467067608545
																	},
																	"nextHandle": {
																		"dv": -1.0693652343750002,
																		"dt": 0.3379705070727756
																	}
																},
																{
																	"time": 1.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"props": {
														"tag": "WIP"
													},
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topBrighten": true,
													"topIntensity": 0.51,
													"topSpan": 0.3,
													"dirIntensity": 0.1,
													"dirSpan": 0,
													"sandBlend": 0.7,
													"envBlend": 0.7
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": -0.004801283442754212,
													"prevHandle": {
														"dv": -1.388476860780481,
														"dt": -0.06199247660355442
													},
													"nextHandle": {
														"dv": 0.7972549709272361,
														"dt": 0.03559570312500002
													}
												},
												{
													"time": 1,
													"value": 1.0582053444602273,
													"prevHandle": {
														"dv": 0,
														"dt": -0.92880859375
													},
													"nextHandle": {
														"dv": -2.5729900539317147e-16,
														"dt": 0.42212406308208533
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 6,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						}
					]
				}
			]
		}
	]
}