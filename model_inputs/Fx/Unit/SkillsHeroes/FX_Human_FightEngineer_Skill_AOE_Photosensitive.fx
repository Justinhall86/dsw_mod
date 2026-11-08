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
			"scaleX": 1.25,
			"scaleY": 1.25,
			"scaleZ": 1.25,
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
							"enabled": false,
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
							"enabled": false,
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
						},
						{
							"type": "model",
							"name": "Male01_FightEngineer",
							"source": "Character/Vernius/Unit/Fight_Engineer/Male01_FightEngineer.fbx",
							"x": -1.72133,
							"y": 1.02197,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/FightEngineer/Anim_Male01_FightEngineer_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/Male01/FightEngineer/Anim_Male01_FightEngineer_Skill_Loop.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Male01_FightEngineer",
							"source": "Character/Vernius/Unit/Fight_Engineer/Male01_FightEngineer.fbx",
							"x": -1.72133,
							"y": -0.82455,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/FightEngineer/Anim_Male01_FightEngineer_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/Male01/FightEngineer/Anim_Male01_FightEngineer_Skill_Loop.fbx",
									"loop": true
								}
							]
						},
						{
							"type": "model",
							"name": "DroneFightEngineer",
							"source": "Character/Vernius/Unit/Fight_Engineer/DroneFightEngineer/DroneFightEngineer.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/DroneFightEngineer/Anim_DroneFightEngineer_Skill_On.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": 2,
									"animation": "Anim/DroneFightEngineer/Anim_DroneFightEngineer_Skill_Loop.fbx",
									"loop": true
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "TestDuration",
					"children": [
						{
							"type": "object",
							"name": "TriangleWeapon",
							"enabled": false,
							"editorOnly": true,
							"y": 0.067158,
							"scaleX": 0.052500000000000005,
							"scaleY": 0.052500000000000005,
							"scaleZ": 0.052500000000000005,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAtTOP",
									"enabled": false,
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
									"y": 0.6,
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationY": 36.7,
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
									"type": "object",
									"name": "FlashDecals",
									"y": -1.95647,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 15,
											"rotationX": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.2672641403273712,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.30706260292374515,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.34839177561997936,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9134252586806585,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9516449028797779,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9934308548094833,
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
															0,
															0,
															0
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Red",
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 15,
											"rotationX": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
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
																	"time": 1.0953846855111369,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.1940141873027146,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.914546074366523,
																	"value": 0,
																	"mode": 2
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.396078431372549,
															0.23529411764705882,
															0.8549019607843137
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_White",
											"scaleX": 20,
											"scaleY": 20,
											"scaleZ": 15,
											"rotationX": 90,
											"albedoMap": "Fx/Gradients/circGrad05.jpg",
											"fadePower": 3,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
											"blendMode": 2,
											"children": [
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
																	"time": 0.3409564730400816,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.37523339251438653,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 0.5202511287518302,
																	"value": 0,
																	"prevHandle": {
																		"dv": -0.0006038814045939978,
																		"dt": -0.08964732785587443
																	},
																	"nextHandle": {
																		"dv": -7.84877284411883e-17,
																		"dt": 0.16793770456807758
																	}
																},
																{
																	"time": 0.9876862137351361,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.019533823319448,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.1673153140743366,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.08163119444600841
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.08163119444600841
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
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.6,
														"envColorSet": false
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.996078431372549,
															0.9019607843137255,
															0.8352941176470589
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
															0.6980392156862745,
															0.592156862745098,
															1
														]
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.55,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygonLight",
									"x": -0.08369,
									"y": 0.83364,
									"z": 0.5017,
									"scaleX": 3.2,
									"scaleY": 3.2,
									"scaleZ": 3.2,
									"rotationX": -90,
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
												"texture": "Fx/Alphas/T_FEDrone.png"
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
												"minAlpha": 0.25,
												"maxAlpha": 1,
												"frequency": 2
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
						},
						{
							"type": "object",
							"name": "NeuralCore02_inv",
							"x": -0.18978,
							"y": -0.21512,
							"z": -0.13093,
							"scaleX": 2.9999999999999987,
							"scaleY": 2.9999999999999987,
							"scaleZ": 3,
							"rotationZ": 156.1,
							"children": [
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
									"type": "object",
									"name": "AnglesTes",
									"z": 0.18,
									"children": [
										{
											"type": "object",
											"name": "BOTTOMangles",
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"x": 1.79754,
													"y": -4.96026,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
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
																			"emissive": 2,
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
																		"alpha": 0.99,
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
																	"enabled": false,
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
																	"enabled": false,
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
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
																						"color": -7973121
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
															"name": "polygon",
															"enabled": false,
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
													"x": 3.28709,
													"y": 4.14989,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
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
																			"emissive": 2,
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
																		"alpha": 0.99,
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
																	"enabled": false,
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
																	"enabled": false,
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
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
																						"color": -7973121
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
															"name": "polygon",
															"enabled": false,
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
													"x": -5.22398,
													"y": 0.39476,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
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
																			"emissive": 2,
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
																		"alpha": 0.99,
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
																	"enabled": false,
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
																	"enabled": false,
																	"props": {
																		"minAlpha": 0.5,
																		"maxAlpha": 1,
																		"frequency": 2
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
																						"color": -7973121
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
															"name": "polygon",
															"enabled": false,
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
																	"time": 0,
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
																	"time": 0.27506864135705916,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.2006880757185305,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.3198589101437213,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
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
																	"time": 0.27506864135705916,
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
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.7301114131343236,
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
													"time": 2.0051800544913823,
													"value": 0.9732427100774028,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 8,
											"value": 0,
											"mode": 2
										}
									],
									"loop": true
								},
								{
									"type": "object",
									"name": "TestLINKTop",
									"enabled": false,
									"x": -0.15102666666666673,
									"y": -0.11259999999999999,
									"z": 0.18636000000000005,
									"rotationZ": 3.1805546814635168e-15,
									"children": [
										{
											"type": "object",
											"name": "Pivot",
											"x": -5.10147,
											"y": 0.4932,
											"z": 0.0027,
											"scaleX": 0.5,
											"scaleY": 0.49999999999999994,
											"scaleZ": 0.49999999999999994,
											"rotationX": 8.6,
											"rotationY": 173.3,
											"rotationZ": 86.5,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"y": -6.04847,
													"rotationX": 15.5,
													"rotationY": 24.5,
													"target": "camera",
													"lockAxis": [
														0,
														1,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 10.5,
															"scaleY": 0.12,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 6
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
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 10.5,
															"scaleY": 0.35,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	-0.01,
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
																			"time": 1.9832317000630664,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.186019178461684,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.1635565926219277
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.75,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	-0.01,
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
											"name": "Pivot",
											"x": 1.89492,
											"y": -4.67531,
											"z": -0.01706,
											"scaleX": 0.49999999999999994,
											"scaleY": 0.5000000000000001,
											"scaleZ": 0.5000000000000001,
											"rotationX": -170.7,
											"rotationY": 2.3,
											"rotationZ": 18.5,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"y": -5.07509,
													"rotationY": -62.81906648774097,
													"target": "camera",
													"lockAxis": [
														0,
														1,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 9.75,
															"scaleY": 0.15,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 6
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
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 9.75,
															"scaleY": 0.5,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad.png",
																"uvShift": [
																	-0.01,
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
																			"time": 1.9832317000630664,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.186019178461684,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.1635565926219277
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygonElec",
															"enabled": false,
															"y": 8.881784197001252e-16,
															"z": -8.881784197001252e-16,
															"scaleX": 10,
															"rotationX": 89.99999999999999,
															"rotationY": 7.352732281927438e-15,
															"rotationZ": -89.99999999999999,
															"kind": 0,
															"args": [
																10
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
																	"name": "AnimatedTexture",
																	"source": "h3d.shader.AnimatedTexture",
																	"props": {
																		"useSourceUVs": false,
																		"blendBetweenFrames": false,
																		"startFrame": 0,
																		"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																		"speed": 15,
																		"frameDivision": [
																			1,
																			4
																		],
																		"totalFrames": 4,
																		"startTime": 0,
																		"loop": true
																	}
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.5686274509803921,
																			0.47058823529411764,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.33,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 2,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/T_Fire.png",
																		"uvShift": [
																			-0.01,
																			0
																		],
																		"uvShiftSpeed": [
																			-1,
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
																		"progress": 0.5,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
																		"uvShift": [
																			-0.01,
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
																					"time": 0.4703766769668404,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.0113148737571431,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.015828068999619305,
																						"dt": -0.2721380076678208
																					},
																					"nextHandle": {
																						"dv": 0.0161672128995334,
																						"dt": 0.2063853520171111
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
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.75,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/Cyl05v_A.png",
																"uvShift": [
																	-0.01,
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
											"name": "Pivot",
											"x": 3.35976,
											"y": 4.17876,
											"z": 0.00154,
											"scaleX": 0.5000000000000001,
											"scaleY": 0.49999999999999994,
											"scaleZ": 0.5,
											"rotationX": 7.6,
											"rotationY": 177.6,
											"rotationZ": -37.6,
											"children": [
												{
													"type": "lookAt",
													"name": "lookAt",
													"y": -5.39685,
													"rotationY": -62.81906648774097,
													"target": "camera",
													"lockAxis": [
														0,
														1,
														0
													],
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 9.75,
															"scaleY": 0.15,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																			"emissive": 6
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
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygon",
															"y": 0.47989,
															"scaleX": 9.75,
															"scaleY": 0.5,
															"rotationX": 90,
															"rotationZ": -90,
															"kind": 0,
															"args": [
																10
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
																		"alpha": 0.2,
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl03u_A.jpg"
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
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																	"name": "UVDistortion",
																	"source": "shaders/UVDistortion.hx",
																	"props": {
																		"noiseTexture": "Fx/noise/T_Fire.png",
																		"directionalNoise": false,
																		"intensity": 0.63,
																		"scrollSpeed": [
																			-1,
																			0
																		],
																		"scale": [
																			1,
																			0.5
																		]
																	}
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": false,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/Gradients/uGrad_inv.png",
																"uvShift": [
																	-0.01,
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
																			"time": 1.9832317000630664,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 2.186019178461684,
																			"value": 1,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.1635565926219277
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "polygon",
															"name": "polygonElec",
															"enabled": false,
															"y": 8.881784197001252e-16,
															"z": -8.881784197001252e-16,
															"scaleX": 10,
															"rotationX": 89.99999999999999,
															"rotationY": 7.352732281927438e-15,
															"rotationZ": -89.99999999999999,
															"kind": 0,
															"args": [
																10
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
																	"name": "AnimatedTexture",
																	"source": "h3d.shader.AnimatedTexture",
																	"props": {
																		"useSourceUVs": false,
																		"blendBetweenFrames": false,
																		"startFrame": 0,
																		"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																		"speed": 15,
																		"frameDivision": [
																			1,
																			4
																		],
																		"totalFrames": 4,
																		"startTime": 0,
																		"loop": true
																	}
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
																	"name": "ColorSet",
																	"source": "shaders/ColorSet.hx",
																	"props": {
																		"amount": 1,
																		"color": [
																			0.5686274509803921,
																			0.47058823529411764,
																			1
																		]
																	}
																},
																{
																	"type": "shader",
																	"name": "UVTransform",
																	"source": "shaders/UVTransform.hx",
																	"props": {
																		"scaleX": 3,
																		"scaleY": 1,
																		"shiftX": 0,
																		"shiftY": 0,
																		"shiftSpeedX": -0.05,
																		"shiftSpeedY": 0
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
																		"progress": 0.74,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad_inv.png",
																		"uvShift": [
																			-0.01,
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
																		"useSourceUVs": true,
																		"useScale": true,
																		"wrap": true,
																		"progress": 0.33,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 2,
																		"uvScaleY": 0.5,
																		"texture": "Fx/noise/T_Fire.png",
																		"uvShift": [
																			-0.01,
																			0
																		],
																		"uvShiftSpeed": [
																			-1,
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
																		"progress": 0.5,
																		"saturation": 1,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": "Fx/Gradients/uGrad.png",
																		"uvShift": [
																			-0.01,
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
																					"time": 0.4703766769668404,
																					"value": 0,
																					"mode": 2
																				},
																				{
																					"time": 1.0113148737571431,
																					"value": 1,
																					"prevHandle": {
																						"dv": -0.015828068999619305,
																						"dt": -0.2721380076678208
																					},
																					"nextHandle": {
																						"dv": 0.0161672128995334,
																						"dt": 0.2063853520171111
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
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad_inv.png",
												"uvShift": [
													-0.01,
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
													"keys": [
														{
															"time": 1.8557804055850413,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.100543994449589,
															"value": 1,
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
												"alpha": 1
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 2.0541449284722493,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.1174715258311854,
															"value": 0.25,
															"mode": 2
														},
														{
															"time": 2.206128762133693,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.323831271291228,
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
						},
						{
							"type": "object",
							"name": "AOE_inv",
							"scaleX": 1.85,
							"scaleY": 1.85,
							"scaleZ": 1.85,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_mask",
									"locked": true,
									"scaleX": 16.85,
									"scaleY": 16.85,
									"scaleZ": 15.34,
									"albedoMap": "Fx/Alphas/T_UI_Round_256.png",
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "BeforeTonemapping",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Front",
													"depthTest": "Greater",
													"colorMask": 15,
													"enableStencil": true,
													"alphaKill": false,
													"stencilFailOp": "Keep",
													"depthFailOp": "Keep",
													"stencilPassOp": "Replace",
													"stencilCompare": "Always",
													"stencilValue": 2,
													"stencilReadMask": 2,
													"stencilWriteMask": 2,
													"emissive": 1,
													"drawOrder": "-100"
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.002
													}
												},
												{
													"type": "shader",
													"name": "AlphaKill",
													"source": "shaders/AlphaKill.hx",
													"props": {
														"threshold": 0.001,
														"useRGB": false
													}
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "AoE",
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_border",
											"locked": true,
											"scaleX": 17,
											"scaleY": 17,
											"scaleZ": 15.3,
											"rotationZ": -52.27095572260782,
											"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
											"emissive": 0.5,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "Front",
															"depthTest": "Greater",
															"colorMask": 15,
															"enableStencil": true,
															"alphaKill": false,
															"stencilFailOp": "Keep",
															"depthFailOp": "Keep",
															"stencilPassOp": "Replace",
															"stencilCompare": "NotEqual",
															"stencilValue": 2,
															"stencilReadMask": 2,
															"stencilWriteMask": 0,
															"emissive": 1
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
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25779842717708584,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6745276791165088,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
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
															"time": 10,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.3568627450980392,
															0.20392156862745098,
															0.615686274509804
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
															0.6862745098039216,
															0.5411764705882353,
															0.8392156862745098
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.050060820827633516,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5510841998220848,
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_var",
											"locked": true,
											"scaleX": 17,
											"scaleY": 17,
											"scaleZ": 15.3,
											"rotationZ": -142.67482395117338,
											"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
											"emissive": 0.5,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "Front",
															"depthTest": "Greater",
															"colorMask": 15,
															"enableStencil": true,
															"alphaKill": false,
															"stencilFailOp": "Keep",
															"depthFailOp": "Keep",
															"stencilPassOp": "Replace",
															"stencilCompare": "NotEqual",
															"stencilValue": 2,
															"stencilReadMask": 2,
															"stencilWriteMask": 0,
															"emissive": 2
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25779842717708584,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6745276791165088,
																	"value": 0.5,
																	"mode": 2
																}
															]
														}
													]
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
															"time": 50,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.3568627450980392,
															0.20392156862745098,
															0.615686274509804
														]
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 0.6,
														"color": [
															0.6862745098039216,
															0.5411764705882353,
															0.8392156862745098
														]
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_border",
											"locked": true,
											"scaleX": 17.5,
											"scaleY": 17.5,
											"scaleZ": 15,
											"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
											"emissive": 0.5,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "Front",
															"depthTest": "Greater",
															"colorMask": 15,
															"enableStencil": true,
															"alphaKill": false,
															"stencilFailOp": "Keep",
															"depthFailOp": "Keep",
															"stencilPassOp": "Replace",
															"stencilCompare": "NotEqual",
															"stencilValue": 2,
															"stencilReadMask": 2,
															"stencilWriteMask": 0,
															"emissive": 1
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
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25779842717708584,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6745276791165088,
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
															0.3568627450980392,
															0.20392156862745098,
															0.615686274509804
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
															0.6862745098039216,
															0.5411764705882353,
															0.8392156862745098
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.050060820827633516,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.5510841998220848,
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
													"type": "shader",
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
													"props": {
														"UVScale": [
															1,
															1
														],
														"alpha": 0.6,
														"MULTIPLY": false,
														"color": [
															0.6862745098039216,
															0.5411764705882353,
															0.8392156862745098,
															1
														],
														"mask": "Fx/Alphas/FloorScan_Round_12_1024_thick.png",
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
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 0.75
											}
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_border",
											"locked": true,
											"scaleX": 17.5,
											"scaleY": 17.5,
											"scaleZ": 15.01,
											"rotationY": -180,
											"rotationZ": -92,
											"albedoMap": "Fx/Alphas/T_Circle_Trio_512.png",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "BeforeTonemapping",
															"blend": "Alpha",
															"shadows": false,
															"culling": "Front",
															"depthTest": "Greater",
															"colorMask": 15,
															"enableStencil": true,
															"alphaKill": false,
															"stencilFailOp": "Keep",
															"depthFailOp": "Keep",
															"stencilPassOp": "Replace",
															"stencilCompare": "NotEqual",
															"stencilValue": 2,
															"stencilReadMask": 2,
															"stencilWriteMask": 0,
															"emissive": 0.5,
															"drawOrder": "120"
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
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
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.25779842717708584,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6745276791165088,
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
															0.6862745098039216,
															0.5411764705882353,
															0.8392156862745098
														]
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 2
														},
														{
															"time": 8,
															"value": 0,
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
													"time": 2.0298031984347005,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3178219449412665,
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
							"type": "constraint",
							"name": "constraint",
							"object": ".FXRoot.TestDuration.TriangleWeapon",
							"target": ".FXRoot.Chara.DroneFightEngineer.root.JNT_Root"
						}
					]
				}
			]
		},
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
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
		}
	]
}