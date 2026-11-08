{
	"type": "fx",
	"duration": 1.5,
	"cullingRadius": 3,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"x": -0.1092677924158452,
			"y": 0.049577590407192035,
			"z": 0.24757302922975288,
			"children": [
				{
					"type": "object",
					"name": "Character",
					"editorOnly": true,
					"scaleX": 1.8,
					"scaleY": 1.8,
					"scaleZ": 1.8,
					"children": [
						{
							"type": "model",
							"name": "Female01_FreeCompany",
							"source": "Character/Smuggler/Unit/FreeCompany/Female01_FreeCompany.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Female01/DualGuns/Anim_Female01_DualGuns_AttackRange01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Smuggler_Gun_02",
							"source": "Character/Common/Weapon/Gun/Gun.fbx",
							"x": -0.15494,
							"y": -0.04421,
							"z": 0.05,
							"rotationZ": -90
						},
						{
							"type": "model",
							"name": "Smuggler_Gun_01",
							"source": "Character/Common/Weapon/Gun/Gun.fbx",
							"y": -0.05288,
							"z": -0.31111,
							"rotationX": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.Character.Smuggler_Gun_02",
							"target": "FXAnimation.Character.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.Character.Smuggler_Gun_01",
							"target": "FXAnimation.Character.Female01_FreeCompany.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Gun"
						}
					]
				},
				{
					"type": "object",
					"name": "shot01",
					"x": 2.68534,
					"y": -0.23387,
					"z": 2.7683,
					"children": [
						{
							"type": "object",
							"name": "Trail",
							"rotationZ": -8.5,
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											1.5,
											100,
											1.2
										],
										"lifeTime": 0.12,
										"instStretch_rand": [
											0.5,
											30,
											0.4
										],
										"emitType": "Burst",
										"burstDelay": 0.7,
										"speedFactor": 1.5,
										"warmUpTime": -0.195,
										"burstCount": 2,
										"lifeTimeRand": 0.05,
										"useRandomColor": true,
										"randomColor1": [
											0.7098039215686275,
											0.9411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.49411764705882355,
											0.8588235294117647,
											0.8274509803921568,
											0.5686274509803921
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"scaleX": 0.08,
											"scaleY": 0.11,
											"scaleZ": 0.08,
											"rotationX": 90,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square03.jpg",
														"onDecal": false
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
														"saturation": 1,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/Dissolve_lines.jpg.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															2,
															0
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.035745189424735785,
																		"dt": -0.4999893526669539
																	},
																	"nextHandle": {
																		"dv": -0.050000000000000044,
																		"dt": 0.7000199507390062
																	}
																},
																{
																	"time": 1,
																	"value": 0,
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
														"power": 1.2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
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
							"name": "Muzzle",
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "Shot1",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 1.0000000000000002,
									"children": [
										{
											"type": "emitter",
											"name": "SmokeGun",
											"props": {
												"instScale_rand": 1.7,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"lifeTimeRand": 0.5,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 2.8,
												"emitAngle": 1,
												"alignMode": "Screen",
												"lifeTime": 2.5,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"instSpeed_rand": [
													0,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0,
													0
												],
												"emitRate": 1,
												"speedFactor": 3.7,
												"maxCount": 2,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"useRandomColor": true,
												"warmUpTime": -0.37,
												"burstCount": 2,
												"burstDelay": 1.73
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 8
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_ChocWave_Blurred.png",
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
																			"value": 0.2833333333333333,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.6477951347620967,
																				"dt": -9.080851668466424e-17
																			},
																			"nextHandle": {
																				"dv": 0.8666666666666666,
																				"dt": 0
																			}
																		},
																		{
																			"time": 0.45,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.29000000000000004
																			},
																			"nextHandle": {
																				"dv": -2.9391523179536476e-16,
																				"dt": 0.36
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.01694444444444443,
																				"dt": -0.27
																			},
																			"nextHandle": {
																				"dv": 0.013434004892663146,
																				"dt": 0.21406315992899264
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
																"useScale": false,
																"wrap": true,
																"progress": 1,
																"saturation": 1,
																"width": 0.75,
																"uvScaleX": 0.25,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/clouds.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.07,
																	-0.05
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.408519742567825,
																				"dt": -0.014085197425678224
																			},
																			"nextHandle": {
																				"dv": -1,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.62
																			},
																			"nextHandle": {
																				"dv": -2.1771608536988747e-16,
																				"dt": 0.3333350157390327
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.28277436002838635,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.685
															},
															"nextHandle": {
																"dv": -1.582726646250665e-16,
																"dt": 0.2500018203703057
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.0890297805850073,
																"dt": -0.11575828486016804
															},
															"nextHandle": {
																"dv": -0.9363636363636363,
																"dt": 0.03508928571428571
															}
														},
														{
															"time": 0.6549999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.6245892857142856
															},
															"nextHandle": {
																"dv": 0.008774267419493307,
																"dt": 0.6028344762228577
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlareStar2",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.15,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 1.3,
												"emitType": "Burst",
												"burstDelay": 0.7,
												"instScale_rand": 0.5,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													0
												],
												"warmUpTime": -0.1,
												"lifeTimeRand": 0.02,
												"useRandomColor": true,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"instRotation": [
													0,
													0,
													180
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5,
												"burstCount": 2
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationY": 90,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare05.png",
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
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.2610256091340131,
																			"value": 3,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.0864952927985753
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.011804602326868493
																			}
																		},
																		{
																			"time": 0.2948996853763314,
																			"value": 0.7544444444444445,
																			"mode": 0
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
																"uvShift": [
																	0,
																	0
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
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
																			}
																		},
																		{
																			"time": 1,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.51,
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
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.265,
															"value": 1.4883021831512457,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08666666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05000000000000001
															}
														},
														{
															"time": 0.41000000000000003,
															"value": 0.7166666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": 0.04420191197517367,
																"dt": 0.37129606059146064
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
					"type": "object",
					"name": "shot02",
					"x": 1.12448,
					"y": 0.60542,
					"z": 2.725,
					"children": [
						{
							"type": "object",
							"name": "Trail",
							"rotationZ": -8.5,
							"children": [
								{
									"type": "emitter",
									"name": "projectileVertical",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"instStretch": [
											1.5,
											100,
											1.2
										],
										"lifeTime": 0.12,
										"instStretch_rand": [
											0.5,
											30,
											0.4
										],
										"emitType": "Burst",
										"burstDelay": 0.7,
										"speedFactor": 1.5,
										"warmUpTime": -0.195,
										"burstCount": 2,
										"lifeTimeRand": 0.05,
										"useRandomColor": true,
										"randomColor1": [
											0.7098039215686275,
											0.9411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.49411764705882355,
											0.8588235294117647,
											0.8274509803921568,
											0.5686274509803921
										],
										"seedGroup": 1
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
											"scaleX": 0.08,
											"scaleY": 0.11,
											"scaleZ": 0.08,
											"rotationX": 90,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/T_Square03.jpg",
														"onDecal": false
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
														"saturation": 1,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 0.2,
														"texture": "Fx/noise/Dissolve_lines.jpg.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															2,
															0
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.035745189424735785,
																		"dt": -0.4999893526669539
																	},
																	"nextHandle": {
																		"dv": -0.050000000000000044,
																		"dt": 0.7000199507390062
																	}
																},
																{
																	"time": 1,
																	"value": 0,
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
														"power": 1.2
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.033333333333333326,
														"dt": -0.865
													},
													"nextHandle": {
														"dv": 0.012845000567937064,
														"dt": 0.33332776473798326
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
							"name": "Muzzle",
							"rotationZ": 89.99999999999999,
							"children": [
								{
									"type": "object",
									"name": "Shot1",
									"scaleX": 1.0000000000000002,
									"scaleY": 1.0000000000000002,
									"scaleZ": 1.0000000000000002,
									"children": [
										{
											"type": "emitter",
											"name": "SmokeGun",
											"props": {
												"instScale_rand": 1.7,
												"simulationSpace": "World",
												"animationSpeed": 0,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"enableSort": false,
												"instRotation_rand": [
													0,
													0,
													360
												],
												"lifeTimeRand": 0.5,
												"emitShape": "Cylinder",
												"emitSurface": true,
												"emitOrientation": "Normal",
												"instScale": 2.8,
												"emitAngle": 1,
												"alignMode": "Screen",
												"lifeTime": 2.5,
												"emitRad1": 0.64,
												"emitRad2": 0.89,
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"instSpeed_rand": [
													0,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0,
													0
												],
												"emitRate": 1,
												"speedFactor": 3.7,
												"maxCount": 2,
												"frameDivisionX": 0,
												"frameDivisionY": 0,
												"emitType": "Burst",
												"instWorldSpeed_rand": [
													0,
													0,
													0
												],
												"useRandomColor": true,
												"warmUpTime": -0.37,
												"burstCount": 2,
												"burstDelay": 1.73,
												"seedGroup": 1
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
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
																	"depthTest": "LessEqual",
																	"colorMask": 15,
																	"enableStencil": false,
																	"alphaKill": false,
																	"parallax": 0,
																	"textureWrap": true,
																	"emissive": 8
																}
															},
															"wrapRepeat": true,
															"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																"alpha": 2,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_ChocWave_Blurred.png",
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
																			"value": 0.2833333333333333,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -1.6477951347620967,
																				"dt": -9.080851668466424e-17
																			},
																			"nextHandle": {
																				"dv": 0.8666666666666666,
																				"dt": 0
																			}
																		},
																		{
																			"time": 0.45,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.29000000000000004
																			},
																			"nextHandle": {
																				"dv": -2.9391523179536476e-16,
																				"dt": 0.36
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.01694444444444443,
																				"dt": -0.27
																			},
																			"nextHandle": {
																				"dv": 0.013434004892663146,
																				"dt": 0.21406315992899264
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
																"useScale": false,
																"wrap": true,
																"progress": 1,
																"saturation": 1,
																"width": 0.75,
																"uvScaleX": 0.25,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/clouds.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.07,
																	-0.05
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
																			"value": 0.8,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.408519742567825,
																				"dt": -0.014085197425678224
																			},
																			"nextHandle": {
																				"dv": -1,
																				"dt": 0.009999999999999995
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.62
																			},
																			"nextHandle": {
																				"dv": -2.1771608536988747e-16,
																				"dt": 0.3333350157390327
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.28277436002838635,
															"mode": 0,
															"prevHandle": {
																"dv": -1.0969964913138766,
																"dt": -7.796244552137517e-17
															},
															"nextHandle": {
																"dv": 0.9692887305398012,
																"dt": 0
															}
														},
														{
															"time": 1,
															"value": 1.0582053444602273,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.685
															},
															"nextHandle": {
																"dv": -1.582726646250665e-16,
																"dt": 0.2500018203703057
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.x",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 3.0890297805850073,
																"dt": -0.11575828486016804
															},
															"nextHandle": {
																"dv": -0.9363636363636363,
																"dt": 0.03508928571428571
															}
														},
														{
															"time": 0.6549999999999999,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.009090909090909038,
																"dt": -0.6245892857142856
															},
															"nextHandle": {
																"dv": 0.008774267419493307,
																"dt": 0.6028344762228577
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "FlareStar2",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.15,
												"frameDivisionY": 0,
												"animationSpeed": 0,
												"instScale": 1.3,
												"emitType": "Burst",
												"burstDelay": 0.7,
												"instScale_rand": 0.5,
												"frameDivisionX": 0,
												"alignMode": "Screen",
												"instRotation_rand": [
													0,
													0,
													0
												],
												"warmUpTime": -0.1,
												"lifeTimeRand": 0.02,
												"useRandomColor": true,
												"randomColor1": [
													0.615686274509804,
													0.6470588235294118,
													0.7490196078431373,
													1
												],
												"randomColor2": [
													0.615686274509804,
													0.7490196078431373,
													0.7450980392156863,
													1
												],
												"instRotation": [
													0,
													0,
													180
												],
												"emitOrientation": "Normal",
												"speedFactor": 1.5,
												"burstCount": 2,
												"seedGroup": 1
											},
											"scaleX": 0.01,
											"scaleY": 0.01,
											"scaleZ": 0.01,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
													"rotationY": 90,
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
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Alphas/T_Flare05.png",
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
																			"value": 0.43333333333333335,
																			"mode": 2
																		},
																		{
																			"time": 0.2610256091340131,
																			"value": 3,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.0864952927985753
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.011804602326868493
																			}
																		},
																		{
																			"time": 0.2948996853763314,
																			"value": 0.7544444444444445,
																			"mode": 0
																		},
																		{
																			"time": 0.72,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.022847819119101713,
																				"dt": -0.2399021007505667
																			},
																			"nextHandle": {
																				"dv": -0.016666666666666607,
																				"dt": 0.17499999999999993
																			}
																		},
																		{
																			"time": 1,
																			"value": 0.7,
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
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 1,
																"texture": "Fx/noise/causticTexture_03-2-Blured.png",
																"uvShift": [
																	0,
																	0
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
																			"mode": 0,
																			"prevHandle": {
																				"dv": -0.009691703115208502,
																				"dt": -0.5000918807447791
																			},
																			"nextHandle": {
																				"dv": 0.016666666666666607,
																				"dt": 0.86
																			}
																		},
																		{
																			"time": 1,
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
															},
															"children": [
																{
																	"type": "curve",
																	"name": "amount",
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.51,
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
													"type": "curve",
													"name": "instScale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.265,
															"value": 1.4883021831512457,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.08666666666666667
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.05000000000000001
															}
														},
														{
															"time": 0.41000000000000003,
															"value": 0.7166666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.14
															},
															"nextHandle": {
																"dv": 0.04420191197517367,
																"dt": 0.37129606059146064
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
				}
			]
		}
	]
}