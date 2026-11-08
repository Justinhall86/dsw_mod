{
	"type": "fx",
	"cullingRadius": 250,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 1.32,
			"scaleY": 1.32,
			"scaleZ": 1.32,
			"children": [
				{
					"type": "polygon",
					"name": "Floor",
					"editorOnly": true,
					"locked": true,
					"z": -11,
					"scaleX": 50,
					"scaleY": 50,
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
					"type": "model",
					"name": "Monument",
					"source": "Vehicle/Ecaz/Monument/Monument.fbx",
					"enabled": false,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"rotationZ": 180,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Monument/Anim_Monument_Run.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "Lullaby",
					"z": -9,
					"scaleX": 2.75,
					"scaleY": 2.75,
					"scaleZ": 2.75,
					"children": [
						{
							"type": "object",
							"name": "PartitionOnde",
							"children": [
								{
									"type": "polygon",
									"name": "Ribbon",
									"scaleX": 12.000000000000002,
									"scaleY": 12.000000000000002,
									"kind": 1,
									"args": [
										48,
										360,
										0.52,
										6
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
												"alpha": 0.3,
												"uScale": 5,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0.25,
												"texture": "Fx/Alphas/T_Music_Partition_05.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5490196078431373,
													1,
													0.984313725490196
												]
											}
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
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 7,
												"texScaleY": 7,
												"tex": "Fx/Gradients/Cyl05v_A01.png",
												"intensity": 3,
												"scrollSpeed": [
													0.5,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -83746674
															},
															{
																"position": 0.5,
																"color": -8140080
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0,
													0.21176470588235294
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.006544325238833983,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4253811405242089,
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
									"type": "polygon",
									"name": "partition",
									"scaleX": 12.000000000000002,
									"scaleY": 12.000000000000002,
									"kind": 1,
									"args": [
										48,
										360,
										0.52,
										6
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
													"emissive": 10
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
												"uScale": 5,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0.25,
												"texture": "Fx/Alphas/T_Music_Partition_01.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.5490196078431373,
													1,
													0.984313725490196
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 2
											}
										},
										{
											"type": "shader",
											"name": "VertexDisplacement",
											"source": "shaders/VertexDisplacement.hx",
											"props": {
												"X": true,
												"Y": true,
												"Z": true,
												"texScaleX": 7,
												"texScaleY": 7,
												"tex": "Fx/Gradients/Cyl05v_A01.png",
												"intensity": 3,
												"scrollSpeed": [
													0.5,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"enabled": false,
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -285073266
															},
															{
																"position": 0.61328125,
																"color": -209466672
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.00784313725490196,
													0.12549019607843137,
													0.5568627450980392
												]
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													10,
													2
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													1,
													0,
													0,
													1
												],
												"mask": "Fx/noise/T_Noise_Water_04.png",
												"UVOffset": [
													0,
													0
												]
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													1,
													0,
													0.21176470588235294
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.006544325238833983,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4253811405242089,
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
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 1,
										"power": 0.8
									}
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.012567610151602349,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.8318989042096461,
													"value": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.5626732983290179
													},
													"nextHandle": {
														"dv": 0.014473662997169512,
														"dt": 0.244318310925603
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.18080460750586536,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.533358220009317,
											"value": 1,
											"prevHandle": {
												"dv": -0.016507093038543363,
												"dt": -0.3511598057350942
											},
											"nextHandle": {
												"dv": 0.016507093038543363,
												"dt": 0.3511598057350942
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Duration",
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_inside",
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.19693712619639903,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4569633372521915,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8736925891916152,
															"value": 0.5,
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
												"progress": 0.86,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Alphas/T_circle4.png",
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
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -83746674
															},
															{
																"position": 0.5,
																"color": -8140080
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Partition",
									"scaleX": 16.999999999999996,
									"scaleY": 16.999999999999996,
									"scaleZ": 6,
									"rotationZ": -123.27560182750095,
									"albedoMap": "Fx/Alphas/T_Music_Partition_Circle.png",
									"emissive": 5,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": -0.001474934131443506,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.258551276924349,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6752805288637729,
															"value": 0.5,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.19693712619639903,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4569633372521915,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8736925891916152,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0.56640625,
																"color": -83746674
															},
															{
																"position": 1,
																"color": -8140080
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5137254901960784,
													0.792156862745098,
													0.8156862745098039
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
												"progress": 0.88,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds_Dissolve.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
												"progress": 0.88,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/clouds_Dissolve.png",
												"uvShift": [
													0,
													0.1
												],
												"uvShiftSpeed": [
													0,
													-0.05
												]
											}
										},
										{
											"type": "curve",
											"name": "rotation.z",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 200,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_border",
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"emissive": 0.5,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keys": [
														{
															"time": -0.001474934131443506,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.258551276924349,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6752805288637729,
															"value": 0.5,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.19693712619639903,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4569633372521915,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8736925891916152,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "GradientMap",
											"source": "hrt.shader.GradientMap",
											"props": {
												"USE_ALPHA": true,
												"gradient": {
													"type": "gradient",
													"data": {
														"stops": [
															{
																"position": 0,
																"color": -83746674
															},
															{
																"position": 1,
																"color": -8140080
															}
														],
														"resolution": 64,
														"isVertical": false,
														"interpolation": "Linear",
														"colorMode": 0
													}
												}
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													0.5529411764705883,
													0.8235294117647058,
													0.8470588235294118,
													1
												],
												"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
												"UVOffset": [
													0,
													0
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Partition",
									"z": 0.05,
									"children": [
										{
											"type": "polygon",
											"name": "Ribbon",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.52,
												6
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
														"alpha": 0.5,
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_05.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.984313725490196
														]
													}
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.82,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.1,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 7,
														"texScaleY": 7,
														"tex": "Fx/Gradients/Cyl05v_A01.png",
														"intensity": 2,
														"scrollSpeed": [
															0.5,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -83746674
																	},
																	{
																		"position": 0.5,
																		"color": -8140080
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "partition",
											"scaleX": 12.000000000000002,
											"scaleY": 12.000000000000002,
											"kind": 1,
											"args": [
												48,
												360,
												0.52,
												6
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
															"emissive": 10
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
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_01.png"
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.5490196078431373,
															1,
															0.984313725490196
														]
													}
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 2
													}
												},
												{
													"type": "shader",
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 7,
														"texScaleY": 7,
														"tex": "Fx/Gradients/Cyl05v_A01.png",
														"intensity": 2,
														"scrollSpeed": [
															0.5,
															0
														]
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
														"progress": 0.85,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.1,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "hrt.shader.GradientMap",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -83746674
																	},
																	{
																		"position": 0.5,
																		"color": -8140080
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														}
													}
												},
												{
													"type": "shader",
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
													"props": {
														"UVScale": [
															10,
															2
														],
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															1,
															0,
															0,
															1
														],
														"mask": "Fx/noise/T_Noise_Water_04.png",
														"UVOffset": [
															0,
															0
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
												"range": 1,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.26668669018608404,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5267129012418765,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9434421531813002,
															"value": 0.5,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Notes",
									"props": {
										"alignMode": "Screen",
										"instScale": 0.45,
										"burstParticleCount": 5,
										"maxCount": 30,
										"emitShape": "Cylinder",
										"instScale_rand": 0.15,
										"emitAngle": 360,
										"emitSurface": true,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"spriteSheet": "Fx/Alphas/T_Music.png",
										"instOrbitSpeed_rand": [
											0.05,
											0,
											0
										],
										"speedFactor": 0.5,
										"instOrbitSpeed": [
											0.15,
											0,
											0
										],
										"simulationSpace": "World",
										"instSpeed": [
											1.5,
											0,
											0
										],
										"instSpeed_rand": [
											0.75,
											0,
											0
										],
										"lifeTime": 1.75,
										"instWorldSpeed": [
											0,
											0,
											0.075
										],
										"instWorldSpeed_rand": [
											0,
											0,
											-0.175
										],
										"instRotation": [
											0,
											0,
											2.5
										],
										"instRotation_rand": [
											0,
											0,
											-5
										],
										"instAcceleration": [
											0,
											0,
											-1.2
										],
										"instAcceleration_rand": [
											0,
											0,
											-0.2
										],
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
									"z": 0.6770200000000002,
									"scaleX": 16,
									"scaleY": 16,
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
															"enableStencil": false,
															"parallax": 0,
															"drawOrder": "120",
															"emissive": 1
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
																	"time": 0.10476190476190476,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.024291647063283572,
																		"dt": -0.4963235294117647
																	},
																	"nextHandle": {
																		"dv": 0.024291647063283572,
																		"dt": 0.4963235294117647
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
															0.00784313725490196,
															0.12549019607843137,
															0.5568627450980392
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 3.2265005631462738,
																	"prevHandle": {
																		"dv": 0.01804863695746972,
																		"dt": -0.14732142857142855
																	},
																	"nextHandle": {
																		"dv": -0.04082846060276429,
																		"dt": 0.33326101890937065
																	}
																},
																{
																	"time": 0.8442179558095838,
																	"value": 3.9643907295299767,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.596774193548387,
																	"prevHandle": {
																		"dv": -0.0010666137178234614,
																		"dt": -0.15625
																	},
																	"nextHandle": {
																		"dv": 0.0022753519050003152,
																		"dt": 0.3333200475630523
																	}
																},
																{
																	"time": 0.8442179558095838,
																	"value": 0.9722222222222223,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.7568627450980392,
																	"prevHandle": {
																		"dv": -0.0013480392156863807,
																		"dt": -0.1875
																	},
																	"nextHandle": {
																		"dv": 0.0023964478276402214,
																		"dt": 0.33332410693542613
																	}
																},
																{
																	"time": 0.8442179558095838,
																	"value": 0.2823529411764706,
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
														"range": 1.2,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keys": [
												{
													"time": 1.532634403004366,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6815232918932548,
													"value": 1,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "instWorldSpeed.z",
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
														"dv": 0,
														"dt": -0.3333333333333333
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3333333333333333
													}
												}
											]
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