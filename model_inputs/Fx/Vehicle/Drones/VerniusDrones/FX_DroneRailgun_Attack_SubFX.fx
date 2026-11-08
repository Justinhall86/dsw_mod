{
	"type": "fx",
	"duration": 3.5,
	"cullingRadius": 150,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15,
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
			"z": 3,
			"scaleX": 3,
			"scaleY": 3,
			"scaleZ": 3,
			"children": [
				{
					"type": "model",
					"name": "DroneRailGun",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"enabled": false,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"time": 0.85,
							"animation": "Anim/DroneRailgun/Anim_DroneRailgun_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "AttackRange",
					"y": -0.13627,
					"z": 2.45261,
					"scaleX": 0.72,
					"scaleY": 0.72,
					"scaleZ": 0.72,
					"rotationX": -90,
					"rotationY": -90,
					"children": [
						{
							"type": "object",
							"name": "Elec_Gun",
							"x": -1.6616,
							"z": 0.12838,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt",
									"x": -0.9516099999999996,
									"z": 0.14154999999999984,
									"rotationY": -70.11097710507933,
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
											"scaleX": 2.5,
											"scaleY": 0.63,
											"scaleZ": 1.25,
											"rotationX": 90,
											"rotationZ": 90,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
														"speed": 10,
														"frameDivision": [
															4,
															1
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
															0.6549019607843137,
															0.5764705882352941,
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
															"time": 1.9562954224872957,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9562954224872957,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.9562954224872957,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.043444191800037,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.043444191800037,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.043444191800037,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.17523491227139,
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
									"type": "lookAt",
									"name": "lookAt",
									"rotationY": -77.50001350765382,
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
											"scaleX": 2.5,
											"scaleY": 0.63,
											"scaleZ": 1.25,
											"rotationX": 90,
											"rotationZ": 90,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 1,
														"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
														"speed": 10.5,
														"frameDivision": [
															4,
															1
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
															0.6549019607843137,
															0.5764705882352941,
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
															"time": 2.042136212208798,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.129284981521539,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.17523491227139,
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
									"type": "lookAt",
									"name": "lookAt",
									"x": 0.7622924999999996,
									"y": 6.938893903907228e-18,
									"scaleX": 0.9999999999999998,
									"scaleZ": 0.9999999999999998,
									"rotationY": -67.17999367102354,
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
											"scaleX": 2.5,
											"scaleY": 0.63,
											"scaleZ": 1.25,
											"rotationX": 90,
											"rotationZ": 90,
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
															"emissive": 5
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"useSourceUVs": true,
														"blendBetweenFrames": true,
														"startFrame": 3,
														"texture": "Fx/Alphas/T_ElectricArc_4x1_01.png",
														"speed": 11,
														"frameDivision": [
															4,
															1
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
															0.6549019607843137,
															0.5764705882352941,
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
															"time": 2.1093187028086207,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.174453326869786,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.184453326869786,
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
										"range": 1.2,
										"power": 0.8
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
										"progress": 0.7,
										"saturation": 1,
										"width": 0.53,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0.34375,
														"color": -1
													},
													{
														"position": 0.375,
														"color": -16777216
													},
													{
														"position": 0.546875,
														"color": -16777216
													},
													{
														"position": 0.625,
														"color": -1
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										},
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
							"type": "object",
							"name": "Lights",
							"x": -3.42179,
							"z": 0.44504,
							"children": [
								{
									"type": "object",
									"name": "Lights2_slow",
									"children": [
										{
											"type": "polygon",
											"name": "1",
											"x": -0.95537,
											"z": 0.2409,
											"scaleX": 0.3,
											"scaleY": 0.55,
											"scaleZ": 0.45,
											"rotationX": 1,
											"rotationZ": 90,
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
															"emissive": 8
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.01917417074169636,
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
																	"time": 2.0106287461138725,
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
																	"time": 2.0222981577731134,
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
											"name": "MeshLightsCanon",
											"x": 0.87094,
											"z": -0.08729,
											"children": [
												{
													"type": "model",
													"name": "VerniusRailgun_Lights01",
													"source": "Fx/Meshes_Common/VerniusRailgun_Lights01.fbx",
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
													"rotationZ": 90,
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
																	"emissive": 8
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
																			"time": 1.2977298610022552,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.5042493972854625,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.012474265515503,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.022474265515503,
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
													"type": "model",
													"name": "VerniusRailgun_Lights01",
													"source": "Fx/Meshes_Common/VerniusRailgun_Lights01.fbx",
													"x": 0.8679,
													"z": -0.05876,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
													"rotationZ": 90,
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
																	"emissive": 8
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
																			"time": 1.502165111815617,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.7086846480988243,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.012474265515503,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.022474265515503,
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
													"type": "model",
													"name": "VerniusRailgun_Lights01",
													"source": "Fx/Meshes_Common/VerniusRailgun_Lights01.fbx",
													"x": 1.73515,
													"z": -0.12512,
													"scaleX": 1.4,
													"scaleY": 1.4,
													"scaleZ": 1.4,
													"rotationZ": 90,
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
																	"emissive": 8
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
																			"time": 1.7087699211427831,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 1.9152894574259904,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.012474265515503,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 2.022474265515503,
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
											"type": "model",
											"name": "VerniusRailgun_Lights02",
											"source": "Fx/Meshes_Common/VerniusRailgun_Lights02_StraightUV.fbx",
											"x": -1.6214300000000001,
											"z": -0.1024799999999999,
											"scaleX": 1.3999999999999997,
											"scaleY": 1.3999999999999997,
											"scaleZ": 1.3999999999999997,
											"rotationZ": 89.99999999999999,
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
															"emissive": 8
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5625307810217284,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.970202549979125,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.4825572563191322
																	},
																	"nextHandle": {
																		"dv": -0.7,
																		"dt": 0.06479745002087522
																	}
																},
																{
																	"time": 2.345,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.033333333333333326,
																		"dt": -0.31999999999999984
																	},
																	"nextHandle": {
																		"dv": -0.024980772348352536,
																		"dt": 0.23981541454418343
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.01917417074169636,
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
																	"time": 2.0106287461138725,
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
																	"time": 2.0222981577731134,
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03_1024.jpg.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4980392156862745,
													0.403921568627451,
													0.9137254901960784
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "ElecResuduel",
							"children": [
								{
									"type": "emitter",
									"name": "emitter_R01",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -2.2,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 3,
										"instScale": 0.6,
										"burstDelay": 0.1,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instStretch_rand": [
											0,
											0,
											0
										]
									},
									"x": -1.09423,
									"y": -0.96101,
									"z": 0.25514,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -51,
									"rotationY": 34.6,
									"rotationZ": -35.6,
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
															"emissive": 7
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
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.75,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.04574784585419381,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.09198918362486183,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.1497202227955434,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.243988511222367,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.39384996411156603,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4713887251841375,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6252205600073154,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4980392156862745,
													0.403921568627451,
													0.9137254901960784
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_R02",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -2.35,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 1.5,
										"instStretch": [
											1,
											1.2,
											1
										],
										"instScale": 0.45,
										"burstCount": 2,
										"burstDelay": 0.7,
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
										"lifeTime": 0.5
									},
									"x": -0.57828,
									"y": -0.18345,
									"z": 0.16494,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationX": -21,
									"rotationY": 56.3,
									"rotationZ": 167.4,
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
															"emissive": 7
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
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.75,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.04574784585419381,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.11700603624846992,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2322993457906419,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.34666210064141945,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.6182736434120162,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.796965447866356,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4980392156862745,
													0.403921568627451,
													0.9137254901960784
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_L01",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -2.3,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 1.5,
										"instStretch": [
											1,
											0.8,
											1
										],
										"instScale": 0.6,
										"burstCount": 2,
										"burstDelay": 0.8,
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
										"lifeTime": 0.5
									},
									"x": -0.8898,
									"y": 0.88567,
									"z": 0.28644,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.09999999999999999,
									"scaleZ": 0.1,
									"rotationX": -136.6,
									"rotationY": 35.2,
									"rotationZ": 37.3,
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
															"emissive": 7
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
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.75,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.04574784585419381,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.11700603624846992,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.2322993457906419,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.34666210064141945,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.6182736434120162,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.796965447866356,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4980392156862745,
													0.403921568627451,
													0.9137254901960784
												]
											}
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_L02",
									"props": {
										"emitRate": 1,
										"maxCount": 1,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4.png",
										"instScale_rand": 0,
										"warmUpTime": -2,
										"emitType": "Burst",
										"enableSort": false,
										"animationSpeed": 3,
										"instScale": 0.75,
										"burstDelay": 0.1,
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
										"lifeTime": 1.2
									},
									"x": -1.40408,
									"y": 0.35234,
									"z": 0.4175,
									"scaleX": 0.09999999999999999,
									"scaleY": 0.1,
									"scaleZ": 0.09999999999999999,
									"rotationX": -66,
									"rotationY": 14.7,
									"rotationZ": -52.2,
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
															"emissive": 7
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
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.75,
														"uvScaleY": 0.75,
														"texture": "Fx/noise/clouds_Dissolve.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0.04574784585419381,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.09198918362486183,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.1497202227955434,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.243988511222367,
																	"value": 0.2,
																	"mode": 2
																},
																{
																	"time": 0.39384996411156603,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.4713887251841375,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6252205600073154,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.4980392156862745,
													0.403921568627451,
													0.9137254901960784
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
										"range": 1.2,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "object",
							"name": "lightdecals",
							"x": -1.91116,
							"y": -0.01627,
							"z": 0.11264,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal",
									"scaleX": 8,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": -89.99999999999977,
									"albedoMap": "Fx/Alphas/T_circle3.png",
									"emissive": 7.27,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.16,
									"blendMode": 2,
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
													"emissive": 5
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
													1,
													0.30980392156862746,
													0.29411764705882354
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle3.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 2.002728286734273,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0996834769135413,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.7848793649409447,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3335602872475583
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3335602872475583
															}
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
																"position": 0,
																"color": -5230430
															},
															{
																"position": 0.3671875,
																"color": -11660955
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
									"name": "advancedDecal",
									"scaleX": 8,
									"scaleY": 1.5,
									"scaleZ": 1.5,
									"rotationX": 89.99999999999999,
									"albedoMap": "Fx/Alphas/T_circle3.png",
									"emissive": 7.27,
									"renderMode": "BeforeTonemapping",
									"normalFade": true,
									"normalFadeStart": 0.16,
									"blendMode": 2,
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
													"emissive": 5
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
													1,
													0.30980392156862746,
													0.29411764705882354
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
												"alpha": 0.4,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_circle3.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 2.002728286734273,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0996834769135413,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.7848793649409447,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.3335602872475583
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3335602872475583
															}
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
																"position": 0,
																"color": -5230430
															},
															{
																"position": 0.3671875,
																"color": -11660955
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
								}
							]
						},
						{
							"type": "object",
							"name": "shot01",
							"x": 0.1049,
							"z": 0.2027,
							"scaleX": 1.2,
							"scaleY": 1.2,
							"scaleZ": 1.2,
							"children": [
								{
									"type": "object",
									"name": "Anticipation",
									"x": -2.8226,
									"z": 0.07562999999999986,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationZ": 89.99999999999999,
									"children": [
										{
											"type": "lookAt",
											"name": "lookAt",
											"y": -0.2,
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
													"z": -0.87559,
													"scaleZ": 0.8,
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
												},
												{
													"type": "model",
													"name": "CrossPlanes",
													"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
													"z": -0.1723,
													"scaleX": 0.2,
													"scaleY": 0.2,
													"scaleZ": 0.16,
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
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
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
												},
												{
													"type": "polygon",
													"name": "polygon",
													"scaleX": 0.4,
													"scaleY": 0.4,
													"scaleZ": 0.4,
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
																"useSourceUVs": true,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
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
										},
										{
											"type": "emitter",
											"name": "emitterWaves",
											"props": {
												"lifeTime": 0.5,
												"alignLockAxis": "Z",
												"burstCount": 3,
												"instScale": 12,
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
													1,
													0.7843137254901961,
													0.7843137254901961,
													1
												],
												"burstDelay": 0.2,
												"randomColor2": [
													0.8549019607843137,
													0.9490196078431372,
													0.996078431372549,
													1
												],
												"emitDuration": 1.3,
												"alignMode": "Screen",
												"emitRate": 4,
												"maxCount": 10,
												"warmUpTime": 0.1
											},
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
																	"colorMask": 255
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
																"texture": "Fx/Alphas/T_LensFlare_07.png"
															}
														},
														{
															"type": "shader",
															"name": "DepthBlend",
															"source": "shaders/DepthBlend.hx",
															"props": {
																"REVERSE": false,
																"range": 1.5,
																"power": 0.8
															}
														},
														{
															"type": "shader",
															"name": "AlphaKill",
															"source": "shaders/AlphaKill.hx",
															"enabled": false,
															"props": {
																"threshold": 0.008,
																"useRGB": false
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
																	0.6549019607843137,
																	0.5764705882352941,
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
																	0.8196078431372549,
																	0.7764705882352941,
																	0.996078431372549
																]
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "instScale",
													"enabled": false,
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
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "instScale",
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
															"mode": 0,
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": true,
														"wrap": true,
														"progress": 0.82,
														"saturation": 1,
														"width": 0.8,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Fire.png",
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
															"name": "width",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5350976805491343,
																	"value": 0.9422222222222223,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.03695353771889259
																	},
																	"nextHandle": {
																		"dv": -6.922428196740585e-16,
																		"dt": 0.24478506621704163
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.5,
																		"dt": -0.18500000000000005
																	},
																	"nextHandle": {
																		"dv": -0.8474237452673484,
																		"dt": 0.3135467857489186
																	}
																},
																{
																	"time": 2.0100000000000002,
																	"value": 0,
																	"mode": 0
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6793184979137693,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.047462182152558,
																"dt": -0.40958646044622943
															},
															"nextHandle": {
																"dv": 1.074807307466287,
																"dt": 0.4139597096662032
															}
														},
														{
															"time": 1.7527018223151543,
															"value": 2,
															"mode": 1,
															"prevHandle": {
																"dv": -0.02201704545454497,
																"dt": -0.321503771594684
															},
															"nextHandle": {
																"dv": -1.3152202317053487,
																"dt": 0
															}
														},
														{
															"time": 1.7627018223151543,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0.6793184979137693,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.047462182152558,
																"dt": -0.40958646044622943
															},
															"nextHandle": {
																"dv": 1.074807307466287,
																"dt": 0.4139597096662032
															}
														},
														{
															"time": 1.4728106502205343,
															"value": 2,
															"mode": 1,
															"prevHandle": {
																"dv": -0.02201704545454497,
																"dt": -0.321503771594684
															},
															"nextHandle": {
																"dv": -1.3152202317053487,
																"dt": 0
															}
														},
														{
															"time": 1.5707155306836398,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "Sparks",
											"x": 2.7755575615628914e-17,
											"y": -8.881784197001252e-16,
											"z": -8.881784197001252e-16,
											"scaleX": 0.9999999999999999,
											"scaleY": 0.9999999999999999,
											"scaleZ": 0.9999999999999999,
											"children": [
												{
													"type": "emitter",
													"name": "emitterSparks",
													"props": {
														"lifeTime": 0.5,
														"alignLockAxis": "Z",
														"burstCount": 3,
														"instScale": 6,
														"instRotation_rand": [
															0,
															0,
															360
														],
														"instStretch_rand": [
															0,
															0,
															0
														],
														"instScale_rand": 0,
														"useRandomColor": true,
														"randomColor1": [
															1,
															0.7843137254901961,
															0.7843137254901961,
															1
														],
														"burstDelay": 0.2,
														"randomColor2": [
															0.8549019607843137,
															0.9490196078431372,
															0.996078431372549,
															1
														],
														"emitDuration": 1.3,
														"alignMode": "Screen",
														"emitRate": 4,
														"maxCount": 10,
														"warmUpTime": -0.1
													},
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "polygon",
															"name": "polygon",
															"x": 1.1102230246251565e-16,
															"y": 6.938893903907228e-18,
															"scaleZ": 0.9999999999999999,
															"kind": 1,
															"args": [
																24,
																360,
																0,
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
																			"emissive": 30
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
																		"uScale": 1,
																		"vScale": 1,
																		"uOffset": 0,
																		"vOffset": 0,
																		"texture": "Fx/Gradients/Cyl01u_A.jpg"
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
																		"progress": 0.33,
																		"saturation": 1,
																		"width": 0.83,
																		"uvScaleX": 5,
																		"uvScaleY": 0.125,
																		"texture": "Fx/noise/T_Noise_DirectionalSparks02.png",
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
																"progress": 0.82,
																"saturation": 1,
																"width": 0.8,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_Fire.png",
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
																	"name": "width",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0.5350976805491343,
																			"value": 0.9422222222222223,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.03695353771889259
																			},
																			"nextHandle": {
																				"dv": -6.922428196740585e-16,
																				"dt": 0.24478506621704163
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.5,
																				"dt": -0.18500000000000005
																			},
																			"nextHandle": {
																				"dv": -0.8474237452673484,
																				"dt": 0.3135467857489186
																			}
																		},
																		{
																			"time": 2.0100000000000002,
																			"value": 0,
																			"mode": 0
																		}
																	]
																}
															]
														},
														{
															"type": "curve",
															"name": "emitRate",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.6793184979137693,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.047462182152558,
																		"dt": -0.40958646044622943
																	},
																	"nextHandle": {
																		"dv": 1.074807307466287,
																		"dt": 0.4139597096662032
																	}
																},
																{
																	"time": 1.7527018223151543,
																	"value": 2,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.02201704545454497,
																		"dt": -0.321503771594684
																	},
																	"nextHandle": {
																		"dv": -1.3152202317053487,
																		"dt": 0
																	}
																},
																{
																	"time": 1.7627018223151543,
																	"value": 0,
																	"mode": 2
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
																	"mode": 2
																},
																{
																	"time": 0.5118219749652295,
																	"value": 0,
																	"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.1666971250103659,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.0106287461138725,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0222981577731134,
															"value": 0,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.01917417074169636,
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
															"time": 2.0106287461138725,
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
															"time": 2.0222981577731134,
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
									"name": "Trail",
									"x": 1.27404,
									"children": [
										{
											"type": "emitter",
											"name": "projectileVertical",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"instStretch": [
													3,
													175,
													3
												],
												"lifeTime": 0.1,
												"instStretch_rand": [
													0.5,
													30,
													0.4
												],
												"emitType": "Burst",
												"speedFactor": 1.5,
												"warmUpTime": -3.08,
												"useRandomColor": true,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"randomColor2": [
													0.8431372549019608,
													0.8431372549019608,
													0.8431372549019608,
													0.5686274509803921
												],
												"instScale": 0.75
											},
											"x": -4.0016,
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationZ": 90,
											"children": [
												{
													"type": "model",
													"name": "PlanePivBot_NoVrtx",
													"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
													"scaleX": 0.06,
													"scaleY": 0.06,
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
																	"depthTest": "Less",
																	"emissive": 8
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
																			"time": 0.35,
																			"value": 0.3,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 5.551115123125783e-17,
																				"dt": -0.17883220886234902
																			},
																			"nextHandle": {
																				"dv": -4.5489684416238926e-17,
																				"dt": 0.08521303258145363
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
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 2.5405004445882086e-16,
																				"dt": -0.5000635940135586
																			},
																			"nextHandle": {
																				"dv": -0.0018717979469484725,
																				"dt": 0.9398600197901078
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 1.0137239552101305,
																				"dt": -0.2345500977885986
																			},
																			"nextHandle": {
																				"dv": -0.8042519375136032,
																				"dt": 0.186855470635801
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
													"type": "curve",
													"name": "instStretch.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.15640816285261333,
																"dt": -0.49746209382577666
															},
															"nextHandle": {
																"dv": 0.11204607759753338,
																"dt": 0.35714680752024097
															}
														},
														{
															"time": 1,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00463335642881102,
																"dt": -0.49867715102107313
															},
															"nextHandle": {
																"dv": -0.00463335642881102,
																"dt": 0.49867715102107313
															}
														}
													]
												}
											]
										},
										{
											"type": "emitter",
											"name": "projectile",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"lifeTime": 0.17,
												"emitType": "Burst",
												"speedFactor": 1.5,
												"warmUpTime": -3.08,
												"useRandomColor": true,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"randomColor2": [
													0.8431372549019608,
													0.8431372549019608,
													0.8431372549019608,
													0.5686274509803921
												],
												"instScale": 7,
												"instSpeed": [
													0,
													-100,
													0
												],
												"instScale_rand": 0,
												"instStretch": [
													1,
													1.1,
													1
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
													"scaleX": 0.06,
													"scaleY": 0.06,
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
																	"depthTest": "Less",
																	"emissive": 2
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
																"texture": "Fx/Alphas/Spark01.png",
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
																			"mode": 2
																		},
																		{
																			"time": 0.16548608368509074,
																			"value": 0.3,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.08521303258145363
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.08521303258145363
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.6549019607843137,
															0.5764705882352941,
															1
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.17620625775559506,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.33427363603634946,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02983786097744015
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.02983786097744015
																	}
																}
															]
														}
													]
												},
												{
													"type": "curve",
													"name": "instSpeed.y",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.5908262503312967,
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
										},
										{
											"type": "emitter",
											"name": "lastingParticles",
											"props": {
												"lifeTime": 0.5,
												"lifeTimeRand": 0.2,
												"warmUpTime": -2.05,
												"alignMode": "Speed",
												"alignLockAxis": "Z",
												"emitType": "Burst",
												"burstParticleCount": 18,
												"emitShape": "Box",
												"emitOrientation": "Speed",
												"instStartSpeed_rand": [
													10,
													5,
													2
												],
												"instDampen": 3.71,
												"useRandomColor": true,
												"randomColor1": [
													0.5764705882352941,
													0.5764705882352941,
													0.5764705882352941,
													1
												],
												"instStretch_rand": [
													2,
													0,
													0
												],
												"instScale": 0.17,
												"instScale_rand": 0.07,
												"instStartSpeed": [
													20,
													0.1,
													0.1
												],
												"instOrbitSpeed_rand": [
													0,
													0,
													0
												],
												"instAcceleration_rand": [
													0,
													0,
													0
												]
											},
											"x": -1.3488,
											"scaleX": 5,
											"scaleY": 0.6,
											"scaleZ": 0.6,
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
																	"colorMask": 255,
																	"emissive": 30,
																	"depthTest": "Less"
																}
															},
															"diffuseMap": "Fx/Gradients/alphaCircular.png"
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	1,
																	0.7058823529411764,
																	0.39215686274509803
																],
																"pointA": 1,
																"colorB": [
																	1,
																	0.6470588235294118,
																	0.30196078431372547
																],
																"pointB": 0.29
															}
														},
														{
															"type": "shader",
															"name": "ParticleFade",
															"source": "hrt.shader.ParticleFade",
															"props": {
																"fadeInLife": 0.1,
																"fadeOutLife": 1,
																"power": 1
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
									"x": -0.45531,
									"scaleX": 1.2,
									"scaleY": 1.2,
									"scaleZ": 1.2,
									"rotationZ": 89.99999999999999,
									"children": [
										{
											"type": "object",
											"name": "Shot1",
											"y": -0.82189,
											"scaleX": 0.6,
											"scaleY": 0.5,
											"scaleZ": 0.5,
											"children": [
												{
													"type": "emitter",
													"name": "SmokeGun_big",
													"props": {
														"instScale_rand": 0.025,
														"simulationSpace": "World",
														"animationSpeed": 0,
														"randomColor1": [
															1,
															0.6901960784313725,
															0.3254901960784314,
															1
														],
														"enableSort": false,
														"instRotation_rand": [
															0,
															0,
															0
														],
														"lifeTimeRand": 0.5,
														"emitShape": "Cylinder",
														"emitSurface": true,
														"emitOrientation": "Normal",
														"instScale": 0.22,
														"emitAngle": 1,
														"lifeTime": 2.5,
														"emitRad1": 0.64,
														"emitRad2": 0.89,
														"randomColor2": [
															1,
															0.7843137254901961,
															0.5254901960784314,
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
														"speedFactor": 3.6,
														"frameDivisionX": 0,
														"frameDivisionY": 0,
														"emitType": "Burst",
														"instWorldSpeed_rand": [
															0,
															0,
															0
														],
														"warmUpTime": -7.45
													},
													"y": -0.15458,
													"scaleX": 0.01,
													"scaleY": 0.01,
													"scaleZ": 0.01,
													"children": [
														{
															"type": "model",
															"name": "Ring_2",
															"source": "Fx/Meshes_Common/Ring_3.fbx",
															"scaleX": 0.5,
															"scaleY": 0.5,
															"scaleZ": 0.5,
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
																			"culling": "Back",
																			"depthTest": "LessEqual",
																			"colorMask": 15,
																			"enableStencil": false,
																			"alphaKill": false,
																			"parallax": 0,
																			"textureWrap": true,
																			"emissive": 2
																		}
																	},
																	"wrapRepeat": true,
																	"diffuseMap": "Fx/Structure/Smoke/white.png"
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
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 0.5,
																		"uvScaleY": 1,
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
																	"value": 0.1,
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
														"instScale": 4,
														"emitType": "Burst",
														"instScale_rand": 0.5,
														"frameDivisionX": 0,
														"alignMode": "Screen",
														"instRotation_rand": [
															0,
															0,
															0
														],
														"warmUpTime": -3,
														"lifeTimeRand": 0.02,
														"useRandomColor": true,
														"randomColor1": [
															0.8549019607843137,
															0.8549019607843137,
															0.8549019607843137,
															1
														],
														"instRotation": [
															0,
															0,
															180
														],
														"emitOrientation": "Normal",
														"speedFactor": 1.5,
														"alignLockAxis": "Z"
													},
													"y": 7.78235,
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
																			"emissive": 20
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
																						"dv": 1.1462494082799496e-16,
																						"dt": -0.500118692076805
																					},
																					"nextHandle": {
																						"dv": -0.0002777777777778212,
																						"dt": 0.7424137395426957
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
																			0.011764705882352941,
																			0.00392156862745098,
																			0.01568627450980392
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
																	"value": 0.7,
																	"mode": 2
																},
																{
																	"time": 0.3917535652877765,
																	"value": 0.07441510915756222,
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
																	"time": 0.5367535652877765,
																	"value": 1.3,
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
														},
														{
															"type": "shader",
															"name": "ColorMap",
															"source": "shaders/ColorMap.hx",
															"props": {
																"USE_ALPHA": true,
																"colorA": [
																	0.4196078431372549,
																	0.37254901960784315,
																	0.6352941176470588
																],
																"pointA": 1,
																"colorB": [
																	0.21568627450980393,
																	0.18823529411764706,
																	0.3333333333333333
																],
																"pointB": 0
															}
														}
													]
												}
											]
										},
										{
											"type": "object",
											"name": "distort",
											"y": -1.31951,
											"children": [
												{
													"type": "emitter",
													"name": "Distort_long",
													"props": {
														"instScale_rand": 0,
														"maxCount": 50,
														"simulationSpace": "World",
														"animationSpeed": 0.2,
														"randomColor1": [
															1,
															1,
															1,
															1
														],
														"randomColor2": [
															0.9098039215686274,
															0.615686274509804,
															1,
															0.8509803921568627
														],
														"emitRate": 10,
														"instRotation_rand": [
															0,
															0,
															0
														],
														"frameCount": 16,
														"frameDivisionX": 4,
														"frameDivisionY": 4,
														"spriteSheet": "Fx/Alphas/T_Smoke_4x4_05.png",
														"emitType": "Burst",
														"burstDelay": 0.1,
														"instScale": 15,
														"emitShape": "Cylinder",
														"emitSurface": true,
														"animationLoop": false,
														"warmUpTime": -7.57,
														"speedFactor": 3.7,
														"lifeTime": 1.25
													},
													"y": -0.74228,
													"scaleX": 0.1,
													"scaleY": 0.1,
													"scaleZ": 0.1,
													"children": [
														{
															"type": "model",
															"name": "Ring",
															"source": "Fx/Meshes_Common/Disk_StraightUVs.fbx",
															"scaleX": 0.1,
															"scaleY": 0.25,
															"scaleZ": 1.8,
															"rotationX": 90,
															"rotationY": 90,
															"children": [
																{
																	"type": "material",
																	"name": "material",
																	"props": {
																		"PBR": {
																			"mode": "Distortion",
																			"blend": "Alpha",
																			"shadows": false,
																			"depthTest": "Less",
																			"colorMask": 15,
																			"enableStencil": false,
																			"culling": "Back"
																		}
																	},
																	"diffuseMap": "Fx/noise/causticTexture_03-2.png"
																},
																{
																	"type": "shader",
																	"name": "DistortionMap",
																	"source": "shaders/DistortionMap.hx",
																	"props": {
																		"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
																		"intensity": 0.01
																	},
																	"isInstance": true,
																	"children": [
																		{
																			"type": "curve",
																			"name": "intensity",
																			"keyMode": 0,
																			"keys": [
																				{
																					"time": 0,
																					"value": 0.8043636363636364,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 1.1438836500205134,
																						"dt": -0.4763721338556696
																					},
																					"nextHandle": {
																						"dv": -0.2551111111111112,
																						"dt": 0.10551280456700678
																					}
																				},
																				{
																					"time": 1,
																					"value": 0.004242424242424214,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.03333333333333333,
																						"dt": -0.51
																					},
																					"nextHandle": {
																						"dv": -0.02178544542538359,
																						"dt": 0.33331731500836026
																					}
																				}
																			]
																		}
																	]
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
																		"shiftSpeedX": 0,
																		"shiftSpeedY": 0
																	},
																	"isInstance": true
																},
																{
																	"type": "shader",
																	"name": "DepthBlend",
																	"source": "shaders/DepthBlend.hx",
																	"props": {
																		"REVERSE": false,
																		"range": 3,
																		"power": 1
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
																		"progress": 1,
																		"saturation": 0,
																		"width": 1,
																		"uvScaleX": 1,
																		"uvScaleY": 1,
																		"texture": {
																			"type": "gradient",
																			"data": {
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
																				"isVertical": true,
																				"interpolation": "Linear",
																				"colorMode": 0
																			}
																		},
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
																					"time": 0,
																					"value": 0.5,
																					"mode": 0,
																					"prevHandle": {
																						"dv": 0.029015069867265493,
																						"dt": -0.49998810981772185
																					},
																					"nextHandle": {
																						"dv": -0.033333333333333326,
																						"dt": 0.5744004892457725
																					}
																				},
																				{
																					"time": 1,
																					"value": 1,
																					"mode": 0,
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
															"type": "curve",
															"name": "instScale",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.009999999999999995,
																	"value": -0.02419093677588713,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.3048411394899193,
																		"dt": -0.28719273573532145
																	},
																	"nextHandle": {
																		"dv": 1.443829751650474,
																		"dt": 0.3181905213357076
																	}
																},
																{
																	"time": 1,
																	"value": 1.29108698853561,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.11323294039229448,
																		"dt": -0.39715416696622907
																	},
																	"nextHandle": {
																		"dv": 0.09487993739524597,
																		"dt": 0.33286343471616847
																	}
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
																	"time": 0.9988431099235052,
																	"value": 1.596443960877134,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03443808703089468,
																		"dt": -0.3759760765082202
																	},
																	"nextHandle": {
																		"dv": -0.022899160758119194,
																		"dt": 0.25000043148287765
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
							"name": "RailGun",
							"x": -3.36105,
							"z": -1.1102230246251565e-16,
							"children": [
								{
									"type": "polygon",
									"name": "LightCANON",
									"x": -0.03439000000000014,
									"z": 0.2582,
									"scaleX": 0.25,
									"scaleY": 0.3499999999999999,
									"scaleZ": 0.25,
									"rotationY": 89.99999999999999,
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
													"emissive": 15
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.33,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/circGrad01.png",
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
															"time": 0.01917417074169636,
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
															"time": 2.0106287461138725,
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
															"time": 2.0222981577731134,
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
									"name": "RailgunLeft",
									"z": 2.220446049250313e-16,
									"children": [
										{
											"type": "model",
											"name": "VerniusRailgun_Anticipation",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test01.fbx",
											"z": -2.220446049250313e-16,
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
															"emissive": 4
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.03125,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 0.97265625,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.1171875,
																		"color": -1
																	},
																	{
																		"position": 0.88671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.125
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.01917417074169636,
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
																	"time": 2.0106287461138725,
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
																	"time": 2.0222981577731134,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.0694101106836844,
																	"value": 0,
																	"mode": 1
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "VerniusRailgun_Light",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test01.fbx",
											"z": -2.220446049250313e-16,
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
															"emissive": 4
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.03125,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 0.97265625,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.1171875,
																		"color": -1
																	},
																	{
																		"position": 0.88671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 2.018282977899675,
																	"value": 0,
																	"mode": 1
																},
																{
																	"time": 2.091559760186415,
																	"value": 1,
																	"mode": 1
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
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
															"keys": [
																{
																	"time": 1.9385343691150918,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1770885239761868
																	}
																},
																{
																	"time": 2.182337771365763,
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
											"type": "model",
											"name": "VerniusRailgun_Trais",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test01.fbx",
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 2,
														"uScale": 2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Lines01.png"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
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
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.2508883976904857,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.7486750449805853e-16,
																		"dt": -0.4999125625672179
																	},
																	"nextHandle": {
																		"dv": 0.0011111111111111738,
																		"dt": 0.8016063629559629
																	}
																},
																{
																	"time": 2.1517546166225427,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.13750355572606754
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 2.1634240282817836,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.7486750449805853e-16,
																		"dt": -0.4999125625672179
																	},
																	"nextHandle": {
																		"dv": 0.0011111111111111738,
																		"dt": 0.8016063629559629
																	}
																},
																{
																	"time": 2.0106287461138725,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9988888888888888,
																		"dt": -0.21053024684434174
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 2.0222981577731134,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 1.9385343691150918,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1770885239761868
																	}
																},
																{
																	"time": 2.182337771365763,
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
									"type": "object",
									"name": "RailgunRight",
									"z": 2.220446049250313e-16,
									"children": [
										{
											"type": "model",
											"name": "VerniusRailgun_Anticipation",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test02.fbx",
											"z": -2.220446049250313e-16,
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
															"emissive": 4
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.03125,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 0.97265625,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.1171875,
																		"color": -1
																	},
																	{
																		"position": 0.88671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.125
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.01917417074169636,
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
																	"time": 2.0106287461138725,
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
																	"time": 2.0222981577731134,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.0694101106836844,
																	"value": 0,
																	"mode": 1
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "VerniusRailgun_Light",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test02.fbx",
											"z": -2.220446049250313e-16,
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
															"emissive": 4
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0.03125,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 0.97265625,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.1171875,
																		"color": -1
																	},
																	{
																		"position": 0.88671875,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": false,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.5
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 2.018282977899675,
																	"value": 0,
																	"mode": 1
																},
																{
																	"time": 2.091559760186415,
																	"value": 1,
																	"mode": 1
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
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
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
															"keys": [
																{
																	"time": 1.9385343691150918,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1770885239761868
																	}
																},
																{
																	"time": 2.182337771365763,
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
											"type": "model",
											"name": "VerniusRailgun_Trais",
											"source": "Fx/Meshes_Common/VerniusRailgun_Test02.fbx",
											"scaleX": 1.3,
											"scaleY": 1.4000000000000004,
											"scaleZ": 1.4000000000000004,
											"rotationZ": 89.99999999999999,
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
														"useSourceUVs": true,
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 2,
														"uScale": 2,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Lines01.png"
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 0.33,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
																"stops": [
																	{
																		"position": 0,
																		"color": -16777216
																	},
																	{
																		"position": 0.50390625,
																		"color": -1
																	},
																	{
																		"position": 1,
																		"color": -16777216
																	}
																],
																"resolution": 64,
																"isVertical": true,
																"interpolation": "Linear",
																"colorMode": 0
															}
														},
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
														"useSourceUVs": true,
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": {
															"type": "gradient",
															"data": {
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
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.2508883976904857,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.7486750449805853e-16,
																		"dt": -0.4999125625672179
																	},
																	"nextHandle": {
																		"dv": 0.0011111111111111738,
																		"dt": 0.8016063629559629
																	}
																},
																{
																	"time": 2.1517546166225427,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9666666666666667,
																		"dt": -0.13750355572606754
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 2.1634240282817836,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 3.7486750449805853e-16,
																		"dt": -0.4999125625672179
																	},
																	"nextHandle": {
																		"dv": 0.0011111111111111738,
																		"dt": 0.8016063629559629
																	}
																},
																{
																	"time": 2.0106287461138725,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.9988888888888888,
																		"dt": -0.21053024684434174
																	},
																	"nextHandle": {
																		"dv": -0.7333333333333334,
																		"dt": 0.011669411659240847
																	}
																},
																{
																	"time": 2.0222981577731134,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"keys": [
																{
																	"time": 1.9385343691150918,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.1770885239761868
																	}
																},
																{
																	"time": 2.182337771365763,
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
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.9,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.AttackRange",
					"target": "FXAnimation.FXRoot.DroneRailGun.root.JNT_Root"
				}
			]
		}
	]
}