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
			"scaleX": 0.25,
			"scaleY": 0.25,
			"scaleZ": 0.25,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"children": [
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
							"y": 0.067158,
							"scaleX": 0.052500000000000005,
							"scaleY": 0.052500000000000005,
							"scaleZ": 0.052500000000000005,
							"children": [
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
								},
								{
									"type": "emitter",
									"name": "emitter_FlareWhite",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.85,
										"instStretch": [
											20,
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
										"warmUpTime": -1.05,
										"emitType": "Burst",
										"instScale": 8,
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
									"y": 1.7044,
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