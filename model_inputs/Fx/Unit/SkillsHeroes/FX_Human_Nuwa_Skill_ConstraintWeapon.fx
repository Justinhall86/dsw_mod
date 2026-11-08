{
	"type": "fx",
	"cullingRadius": 100,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": 0.01,
			"scaleX": 150,
			"scaleY": 150,
			"scaleZ": 150,
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
					"name": "Chara",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Female01_Nuwa",
							"source": "Character/Vernius/Unit/Nuwa/Female01_Nuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/Female01/Nuwa/Anim_Female01_Nuwa_Skill_Loop.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "DroneNuwa",
							"source": "Character/Vernius/Unit/Nuwa/DroneNuwa.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/DroneNuwa/Anim_DroneNuwa_Skill_Loop.fbx",
									"loop": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TestDuration",
					"scaleX": 0.35,
					"scaleY": 0.35,
					"scaleZ": 0.35,
					"children": [
						{
							"type": "object",
							"name": "TriangleWeapon",
							"y": 0.19188,
							"scaleX": 0.15,
							"scaleY": 0.15,
							"scaleZ": 0.15,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAtTOP",
									"y": 8.5,
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000004,
									"scaleZ": 0.9999999999999994,
									"rotationX": -118.21732826745645,
									"rotationY": -27.11143119521258,
									"rotationZ": 40.78186127011464,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										0
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"x": -0.5,
											"y": -3.3306690738754696e-16,
											"z": -7.105427357601002e-15,
											"scaleX": 4,
											"scaleY": 4,
											"scaleZ": 4,
											"rotationX": -89.99999999999999,
											"rotationY": -1.5687009724754765e-15,
											"rotationZ": -89.99999999999999,
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
															"emissive": 5,
															"drawOrder": "100"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"refMatLib": ""
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
														"texture": "Fx/Alphas/T_circle.png"
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12844844
																	},
																	{
																		"position": 1,
																		"color": -3689985
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
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.5,
														"maxAlpha": 1,
														"frequency": 2
													}
												}
											]
										},
										{
											"type": "polygon",
											"name": "polygon",
											"x": -0.3351192230682116,
											"y": -0.06322503364348797,
											"z": 0.039341874014105827,
											"scaleX": 10,
											"scaleY": 10,
											"scaleZ": 10,
											"rotationY": 90,
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
															"emissive": 3
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.5,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													}
												},
												{
													"type": "shader",
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12444212
																	},
																	{
																		"position": 0.5234375,
																		"color": -8008705
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
													"name": "GradientMap",
													"source": "shaders/GradientMap.hx",
													"props": {
														"USE_ALPHA": true,
														"gradient": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -12444212
																	},
																	{
																		"position": 1,
																		"color": -18584
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
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 0.1,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.2,
															"value": 0.5,
															"mode": 2
														}
													],
													"loop": true
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.0318156330612474,
													"value": 0,
													"prevHandle": {
														"dv": -0.03467354713704517,
														"dt": -0.4999305700197999
													},
													"nextHandle": {
														"dv": 0.009002752680527859,
														"dt": 0.2596072020860385
													}
												},
												{
													"time": 1.0638488833143593,
													"value": 0.9732427100774028,
													"mode": 1,
													"prevHandle": {
														"dv": -0.3541813591394464,
														"dt": -0.0033717048902996982
													},
													"nextHandle": {
														"dv": 1.4296492847548923,
														"dt": 0.008121495161251935
													}
												},
												{
													"time": 1.36889940110921,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0.00022767763793574147,
														"dt": -0.2565051722404734
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.723751679693135
													}
												}
											]
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
															"time": 0.7794930242818805,
															"value": 0,
															"prevHandle": {
																"dv": -0.049813649272402935,
																"dt": -0.4998283554580937
															},
															"nextHandle": {
																"dv": 0.015276566427900429,
																"dt": 0.20033429218980658
															}
														},
														{
															"time": 1.054561665638942,
															"value": 0.9732427100774028,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Gun",
											"scaleX": 2,
											"scaleY": 2,
											"scaleZ": 2,
											"rotationZ": 89.99999999999999,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"scaleX": 2.5,
													"scaleY": 2.5,
													"scaleZ": 2.5,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														1
													],
													"children": [
														{
															"type": "model",
															"name": "CrossPlanes",
															"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
															"z": -0.8,
															"scaleX": 0.95,
															"scaleY": 0.95,
															"scaleZ": 0.76,
															"rotationZ": 45,
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
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.6549019607843137,
																			0.5764705882352941,
																			1
																		]
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
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Triangle",
									"y": 4.04547,
									"rotationY": 17.9,
									"children": [
										{
											"type": "object",
											"name": "Triangle",
											"rotationX": 90,
											"children": [
												{
													"type": "model",
													"name": "V_PrismTrianle_fond",
													"source": "Fx/Meshes_Common/V_PrismTriangle.fbx",
													"x": 0.60602,
													"y": 1.04966,
													"scaleX": 2,
													"scaleY": 2,
													"scaleZ": 2,
													"rotationZ": 59.99999999999999,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"emissive": 5
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 0.5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/Vernius_NuwaTriangle01.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.4235294117647059,
																	0.2901960784313725,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "Fresnel",
															"source": "shaders/Fresnel.hx",
															"props": {
																"RGB": false,
																"ALPHA": true,
																"REVERSE": false,
																"bias": 0.24,
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
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 3,
																"power": 0.8
															}
														},
														{
															"type": "shader",
															"name": "AlphaCycle",
															"source": "shaders/AlphaCycle.hx",
															"props": {
																"minAlpha": 0.5,
																"maxAlpha": 1,
																"frequency": 6
															}
														}
													]
												},
												{
													"type": "model",
													"name": "V_PrismTriangle_Border",
													"source": "Fx/Meshes_Common/V_PrismTriangle.fbx",
													"x": 0.60602,
													"y": 1.04966,
													"scaleX": 2,
													"scaleY": 2,
													"scaleZ": 2,
													"rotationZ": 59.99999999999999,
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
																	"depthTest": "Less",
																	"colorMask": 15,
																	"enableStencil": false,
																	"emissive": 7
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
														},
														{
															"type": "shader",
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"props": {
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 5,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/Vernius_NuwaTriangle.png"
															}
														},
														{
															"type": "shader",
															"name": "ColorSet",
															"source": "shaders/ColorSet.hx",
															"props": {
																"amount": 1,
																"color": [
																	0.4235294117647059,
																	0.2901960784313725,
																	1
																]
															}
														}
													]
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
																	"time": 1.1069618984403433,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1702884957992792,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 1.2589457321017865,
																	"value": 0.1,
																	"mode": 2
																},
																{
																	"time": 1.3949806449469069,
																	"value": 1,
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
											"name": "Angles",
											"rotationX": 90,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"x": 3.91915,
													"y": -4.63583,
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -7.13181103689818e-15,
													"rotationY": -63.51475551917284,
													"rotationZ": -51.714549676227705,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.5,
															"y": -3.3306690738754696e-16,
															"z": -7.105427357601002e-15,
															"scaleX": 4,
															"scaleY": 4,
															"scaleZ": 4,
															"rotationX": -89.99999999999999,
															"rotationY": -1.5687009724754765e-15,
															"rotationZ": -89.99999999999999,
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
																			"emissive": 5,
																			"drawOrder": "100"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"refMatLib": ""
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
																		"texture": "Fx/Alphas/T_circle.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12844844
																					},
																					{
																						"position": 1,
																						"color": -3689985
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
																	"name": "AlphaCycle",
																	"source": "shaders/AlphaCycle.hx",
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.3351192230682116,
															"y": -0.06322503364348797,
															"z": 0.039341874014105827,
															"scaleX": 10,
															"scaleY": 10,
															"scaleZ": 10,
															"rotationY": 90,
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
																			"emissive": 3
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 0.5234375,
																						"color": -8008705
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
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 1,
																						"color": -18584
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
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.1,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.2,
																			"value": 0.5,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														}
													]
												},
												{
													"type": "lookAt",
													"name": "lookAt",
													"x": 2.5458,
													"y": 5.85714,
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -5.493753210055895e-15,
													"rotationY": -54.623962302284305,
													"rotationZ": -64.05456229873921,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.5,
															"y": -3.3306690738754696e-16,
															"z": -7.105427357601002e-15,
															"scaleX": 4,
															"scaleY": 4,
															"scaleZ": 4,
															"rotationX": -89.99999999999999,
															"rotationY": -1.5687009724754765e-15,
															"rotationZ": -89.99999999999999,
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
																			"emissive": 5,
																			"drawOrder": "100"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"refMatLib": ""
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
																		"texture": "Fx/Alphas/T_circle.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12844844
																					},
																					{
																						"position": 1,
																						"color": -3689985
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
																	"name": "AlphaCycle",
																	"source": "shaders/AlphaCycle.hx",
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.3351192230682116,
															"y": -0.06322503364348797,
															"z": 0.039341874014105827,
															"scaleX": 10,
															"scaleY": 10,
															"scaleZ": 10,
															"rotationY": 90,
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
																			"emissive": 3
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 0.5234375,
																						"color": -8008705
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
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 1,
																						"color": -18584
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
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.1,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.2,
																			"value": 0.5,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
														}
													]
												},
												{
													"type": "lookAt",
													"name": "lookAt",
													"x": -6.31583,
													"y": -0.53727,
													"scaleX": 0.8,
													"scaleY": 0.8,
													"scaleZ": 0.8,
													"rotationX": -5.3947187975957725e-15,
													"rotationY": -53.87362725061461,
													"rotationZ": -45.27997247203318,
													"target": "camera",
													"lockAxis": [
														0,
														0,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.5,
															"y": -3.3306690738754696e-16,
															"z": -7.105427357601002e-15,
															"scaleX": 4,
															"scaleY": 4,
															"scaleZ": 4,
															"rotationX": -89.99999999999999,
															"rotationY": -1.5687009724754765e-15,
															"rotationZ": -89.99999999999999,
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
																			"emissive": 5,
																			"drawOrder": "100"
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
																	"refMatLib": ""
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
																		"texture": "Fx/Alphas/T_circle.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12844844
																					},
																					{
																						"position": 1,
																						"color": -3689985
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
																	"name": "AlphaCycle",
																	"source": "shaders/AlphaCycle.hx",
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"x": -0.3351192230682116,
															"y": -0.06322503364348797,
															"z": 0.039341874014105827,
															"scaleX": 10,
															"scaleY": 10,
															"scaleZ": 10,
															"rotationY": 90,
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
																			"emissive": 3
																		}
																	},
																	"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
																},
																{
																	"type": "shader",
																	"name": "AlphaMap",
																	"source": "shaders/AlphaMap.hx",
																	"props": {
																		"useSourceUVs": true,
																		"onDecal": false,
																		"wrap": true,
																		"invert": false,
																		"replace": false,
																		"alpha": 0.5,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Alphas/T_circle2.png"
																	}
																},
																{
																	"type": "shader",
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 0.5234375,
																						"color": -8008705
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
																	"name": "GradientMap",
																	"source": "shaders/GradientMap.hx",
																	"props": {
																		"USE_ALPHA": true,
																		"gradient": {
																			"type": "gradient",
																			"data": {
																				"stops": [
																					{
																						"position": 0,
																						"color": -12444212
																					},
																					{
																						"position": 1,
																						"color": -18584
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
																	"type": "curve",
																	"name": "scale",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.5,
																			"mode": 2
																		},
																		{
																			"time": 0.1,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.2,
																			"value": 0.5,
																			"mode": 2
																		}
																	],
																	"loop": true
																}
															]
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.9334748453427184,
															"value": 0,
															"prevHandle": {
																"dv": -0.049813649272402935,
																"dt": -0.4998283554580937
															},
															"nextHandle": {
																"dv": 0.015276566427900429,
																"dt": 0.20033429218980658
															}
														},
														{
															"time": 1.0780992313339917,
															"value": 0.9732427100774028,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 0.9334748453427184,
													"value": 0,
													"prevHandle": {
														"dv": -0.049813649272402935,
														"dt": -0.4998283554580937
													},
													"nextHandle": {
														"dv": 0.015276566427900429,
														"dt": 0.20033429218980658
													}
												},
												{
													"time": 1.0780992313339917,
													"value": 0.9732427100774028,
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
									}
								},
								{
									"type": "trails",
									"name": "trails",
									"y": 8.5486,
									"rotationX": 40,
									"startWidth": 0.3,
									"lifetime": 0.3,
									"minSpeed": 0.00001,
									"maxSpeed": 10000,
									"uvRepeat": "EClamp",
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
													"emissive": 2
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Gradients/uGrad_inv.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 1
											}
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 3,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/Cyl03u_A.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4120705455708493,
															"value": 0,
															"prevHandle": {
																"dv": 1.5147492921937428e-16,
																"dt": -0.2649110109302774
															},
															"nextHandle": {
																"dv": 0.002342879664983477,
																"dt": 0.8357637124293951
															}
														},
														{
															"time": 1.2211543094228894,
															"value": 1,
															"prevHandle": {
																"dv": -0.04241000812688278,
																"dt": -0.5162748265523565
															},
															"nextHandle": {
																"dv": 0.035057755242652304,
																"dt": 0.43549402583399405
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.6126280438546257,
															"value": 0,
															"prevHandle": {
																"dv": -0.008423293544465273,
																"dt": -0.26485804461745566
															},
															"nextHandle": {
																"dv": 0.004059050020559396,
																"dt": 0.12763084246971368
															}
														},
														{
															"time": 0.867889728794053,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8985211309867843,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.018494122908315,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.166545900173183,
															"value": 1,
															"prevHandle": {
																"dv": -0.01770989502462017,
																"dt": -0.11742037507213654
															},
															"nextHandle": {
																"dv": 0.06006800002640268,
																"dt": 0.4344124276128804
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
													0.4235294117647059,
													0.2901960784313725,
													1
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
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.7829759155058098,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7910234594529864,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.8920471873175637,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.10410733261534544
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.15945553476527596
															}
														},
														{
															"time": 1.0714790587468792,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.083339387779007,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1958885873645941,
															"value": 0,
															"prevHandle": {
																"dv": -0.00906637637438279,
																"dt": -0.09092918924631421
															},
															"nextHandle": {
																"dv": -5.616931255453233e-16,
																"dt": 0.5
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
									"name": "flare",
									"y": 8.381,
									"scaleY": 0.65,
									"scaleZ": 0.65,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_FlareWhite",
											"props": {
												"lifeTime": 0.2,
												"alignMode": "Screen",
												"alignLockAxis": "Z",
												"burstDelay": 0.4,
												"instStretch": [
													10,
													4,
													1
												],
												"instRotation_rand": [
													0,
													0,
													0
												],
												"instStretch_rand": [
													0,
													0,
													0
												],
												"instScale_rand": 0,
												"useRandomColor": true,
												"randomColor1": [
													0.48627450980392156,
													0.48627450980392156,
													0.48627450980392156,
													1
												],
												"warmUpTime": -0.35,
												"emitType": "Burst",
												"instScale": 4.5,
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
												},
												"burstCount": 2
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"rotationX": 45,
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
																	"emissive": 10,
																	"drawOrder": "100"
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
																"texture": "Fx/Alphas/T_Flare06_512.png"
															},
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
																				"dv": 0.06196351517869349,
																				"dt": -0.49990757001492336
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.13446288206139395
																			}
																		},
																		{
																			"time": 0.18100772585187647,
																			"value": 1,
																			"mode": 2
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instStretch.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"prevHandle": {
																"dv": 1.2334981930436706,
																"dt": -0.4276798037244547
															},
															"nextHandle": {
																"dv": -0.7166666666666667,
																"dt": 0.24848342791614272
															}
														},
														{
															"time": 1,
															"value": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5240317437099238
															},
															"nextHandle": {
																"dv": -3.8880269028916045e-16,
																"dt": 0.3333333333333333
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
															0.7490196078431373,
															0.6980392156862745,
															0.9725490196078431
														]
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.TestDuration.TriangleWeapon",
							"target": ".FXRoot.Chara.Female01_Nuwa.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				}
			]
		}
	]
}