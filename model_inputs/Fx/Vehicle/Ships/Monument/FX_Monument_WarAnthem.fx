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
					"scaleX": 100,
					"scaleY": 100,
					"scaleZ": 100,
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
					"editorOnly": true,
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
							"name": "Apparition",
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"scaleX": 30,
									"scaleY": 30,
									"scaleZ": 2.13,
									"albedoMap": "Fx/Gradients/circGrad3.jpg",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
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
															"time": 0.14413243989719926,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.18750464810153966,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.7301915196509898,
															"value": 0,
															"prevHandle": {
																"dv": 0.01722222222222225,
																"dt": -0.37632122064209295
															},
															"nextHandle": {
																"dv": -0.018046172041527805,
																"dt": 0.40078962239515425
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
													0.7450980392156863,
													0,
													0.08627450980392157
												]
											}
										}
									]
								},
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
															"emissive": 1
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
														"alpha": 0.8,
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
															0.7098039215686275,
															0.2784313725490196,
															0.24313725490196078
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
															"emissive": 4
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
															0.7098039215686275,
															0.2784313725490196,
															0.24313725490196078
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
													"time": 0.5,
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
								}
							]
						},
						{
							"type": "object",
							"name": "Duration",
							"children": [
								{
									"type": "object",
									"name": "Partition",
									"z": 0.1,
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
															"emissive": 0.5
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
														"alpha": 0.8,
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_05.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.021185276371751643,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.5,
																	"value": 0.2,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.19492791638221563
																	},
																	"nextHandle": {
																		"dv": 0.01260767693828123,
																		"dt": 0.14743959380375388
																	}
																}
															],
															"loop": true
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
															0.7098039215686275,
															0.2784313725490196,
															0.24313725490196078
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
														"progress": 0.22,
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
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0.01,
														"shiftSpeedY": 0
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
															"emissive": 8
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
														"alpha": 2,
														"uScale": 5,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0.25,
														"texture": "Fx/Alphas/T_Music_Partition_01.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.021185276371751643,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.5,
																	"value": 0.2,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.19492791638221563
																	},
																	"nextHandle": {
																		"dv": 0.01260767693828123,
																		"dt": 0.14743959380375388
																	}
																}
															],
															"loop": true
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
															0.7098039215686275,
															0.2784313725490196,
															0.24313725490196078
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
															0,
															0
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0.5
																},
																{
																	"time": 0.027496252379471377,
																	"value": 3,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.08993558171515592,
																		"dt": -0.01630663794945028
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 0.5,
																	"prevHandle": {
																		"dv": -0.016666666666666663,
																		"dt": -0.15259235508845914
																	},
																	"nextHandle": {
																		"dv": 0.036900025635706726,
																		"dt": 0.3332559960213716
																	}
																}
															],
															"loop": true
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
														"progress": 0.2,
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
															0.05,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0.01,
														"shiftSpeedY": 0
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
															0.25098039215686274,
															0.5333333333333333,
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
												"alpha": 2
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
												"alpha": 0.8
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7450980392156863,
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
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.82,
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
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.6470588235294118,
													0.043137254901960784,
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
													0.7490196078431373,
													0.00392156862745098,
													0.21176470588235294
												]
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
													1,
													0.3686274509803922,
													0.14901960784313725,
													0
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
									"type": "advancedDecal",
									"name": "advancedDecal_Partition",
									"scaleX": 16.999999999999993,
									"scaleY": 16.999999999999993,
									"scaleZ": 6,
									"rotationZ": -122.72840261022507,
									"albedoMap": "Fx/Alphas/T_Music_Partition_Circle.png",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"blendMode": 2,
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
													"keys": [
														{
															"time": 0,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 0.021185276371751643,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.2,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.19492791638221563
															},
															"nextHandle": {
																"dv": 0.01260767693828123,
																"dt": 0.14743959380375388
															}
														}
													],
													"loop": true
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
													0.49019607843137253,
													0.6705882352941176
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
												"progress": 0.86,
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
										},
										{
											"type": "shader",
											"name": "ColorMap",
											"source": "shaders/ColorMap.hx",
											"props": {
												"USE_ALPHA": true,
												"colorA": [
													0.6509803921568628,
													0.07058823529411765,
													0.32941176470588235
												],
												"pointA": 0,
												"colorB": [
													1,
													0.6470588235294118,
													0.8784313725490196
												],
												"pointB": 0.64
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_borderGROW",
									"enabled": false,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 6,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"emissive": 2,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.8
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": -0.001474934131443506,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.05765508994285736,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.14744830335238088
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.14744830335238088
															}
														}
													],
													"loop": true
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.6470588235294118,
													0.043137254901960784,
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
													0.9294117647058824,
													0.07450980392156863,
													0.3137254901960784
												]
											}
										},
										{
											"type": "shader",
											"name": "AlphaCycle",
											"source": "shaders/AlphaCycle.hx",
											"enabled": false,
											"props": {
												"minAlpha": 0.5,
												"maxAlpha": 1,
												"frequency": 0.5
											}
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"enabled": false,
											"props": {
												"UVScale": [
													1,
													1
												],
												"alpha": 1,
												"MULTIPLY": false,
												"color": [
													1,
													0.3686274509803922,
													0.14901960784313725,
													0
												],
												"mask": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.19693712619639903,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4569633372521915,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8736925891916152,
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
													0.7490196078431373,
													0.00392156862745098,
													0.12549019607843137
												]
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.16666666666666666
													}
												},
												{
													"time": 0.5,
													"value": 1.2,
													"mode": 2
												}
											],
											"loop": true
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
											0.7098039215686275,
											0.2784313725490196,
											0.24313725490196078
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.19693712619639903,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.6979605051908511,
													"value": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3350000000000002
													},
													"nextHandle": {
														"dv": -1.8417475812501703e-16,
														"dt": 0.22558515433173873
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "PartitionGROW",
									"z": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "partition",
											"scaleX": 15,
											"scaleY": 15,
											"scaleZ": 1.2,
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
															0.7098039215686275,
															0.2784313725490196,
															0.24313725490196078
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
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 1,
														"scaleY": 1,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0.01,
														"shiftSpeedY": 0
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
														"progress": 0.26,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/Water_01.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.05,
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
											"enabled": false,
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
												"alpha": 0.25
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": -0.7344209440906047,
																"dt": -0.49748225069090984
															},
															"nextHandle": {
																"dv": 0.015336507481687134,
																"dt": 0.0629832621263965
															}
														},
														{
															"time": 0.0799402942373494,
															"value": 1.0166666666666666,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0,
															"prevHandle": {
																"dv": -0.03830617961750815,
																"dt": -0.17176030699512596
															},
															"nextHandle": {
																"dv": 0.03830617961750815,
																"dt": 0.17176030699512596
															}
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"prevHandle": {
														"dv": -1.4384421850991163,
														"dt": -0.454190468073672
													},
													"nextHandle": {
														"dv": 0.4833333333333334,
														"dt": 0.15261328899857612
													}
												},
												{
													"time": 0.5,
													"value": 0.85,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "Notes",
									"props": {
										"alignMode": "Screen",
										"instScale": 0.5,
										"burstParticleCount": 3,
										"maxCount": 75,
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
											0,
											0,
											0
										],
										"simulationSpace": "World",
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"lifeTime": 1.2,
										"emitRate": 10,
										"instWorldSpeed": [
											0,
											0,
											8
										],
										"instWorldSpeed_rand": [
											0,
											0,
											3
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
										"lifeTimeRand": 0.2,
										"warmUpTime": -0.5,
										"emitType": "BurstDuration",
										"emitDuration": 500,
										"burstDelay": 0.5,
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
									"scaleX": 15,
									"scaleY": 15,
									"scaleZ": 0.94,
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
															"emissive": 2
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
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.611764705882353,
															0.8784313725490196,
															0.9019607843137255
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 1,
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 1,
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
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 1,
																	"value": 0.2823529411764706,
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
													"enabled": false,
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
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": -0.07759950270036375,
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
																	"value": 0,
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
																	"value": 1,
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
																	"value": 1,
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
																	"value": 0.7831045055131399,
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
																	"value": 0.38235294117647056,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "Bloom",
													"source": "hrt.shader.Bloom",
													"enabled": false,
													"props": {
														"flipY": 0,
														"texture": null,
														"threshold": 0,
														"intensity": 0,
														"colorMatrix": null
													}
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
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.08317994334199158,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.09317994334199159,
													"value": 6,
													"mode": 2
												},
												{
													"time": 0.19878387912958217,
													"value": 6,
													"mode": 2
												},
												{
													"time": 0.20878387912958218,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
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
														"dv": -0.033333333333333326,
														"dt": -0.8546150167384027
													},
													"nextHandle": {
														"dv": 0.012993904240157042,
														"dt": 0.3333299968637185
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "ShockWave",
									"props": {
										"emitType": "BurstDuration",
										"instScale": 37,
										"lifeTime": 2,
										"emitDuration": 500,
										"burstDelay": 0.5,
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
									"x": 0.02468472222222222,
									"z": 0.21332055555555562,
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
															"mode": "Distortion",
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
														"alpha": 1.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png",
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
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.016666666666666663,
																		"dt": -0.15259235508845914
																	},
																	"nextHandle": {
																		"dv": 0.036900025635706726,
																		"dt": 0.3332559960213716
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
														"range": 1.2,
														"power": 0.8
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.8,
														"envColorSet": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DistortionNormal",
													"source": "shaders/DistortionNormal.hx",
													"props": {
														"intensity": 0.006
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
													"value": 0,
													"prevHandle": {
														"dv": 0.059198894770916444,
														"dt": -0.49727071607569884
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.14
													}
												},
												{
													"time": 0.4625895519573449,
													"value": 0.6061895615358934
												},
												{
													"time": 1,
													"value": 1,
													"prevHandle": {
														"dv": -0.050000000000000044,
														"dt": -0.495
													},
													"nextHandle": {
														"dv": 0.03365458515640994,
														"dt": 0.3331803930484605
													}
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
										"alpha": 0.8
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
													"value": 1.2,
													"mode": 2
												},
												{
													"time": 0.8736925891916152,
													"value": 1,
													"mode": 2
												}
											]
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
						"amount": 0.75,
						"ATTENUATE": true,
						"emissiveMap": null
					}
				}
			]
		}
	]
}