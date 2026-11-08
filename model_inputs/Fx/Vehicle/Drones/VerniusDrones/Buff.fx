{
	"type": "fx",
	"cullingRadius": 3,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "RailgunMESH",
					"source": "Vehicle/Vernius/DroneRailGun/DroneRailGun.fbx",
					"x": 6.94803,
					"y": 0.47738,
					"z": 3.03653,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"enabled": false,
							"animation": "Anim/Siren/Anim_Siren_Run.fbx"
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0.30196078431372547,
									0.30196078431372547,
									0.3529411764705882
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "TEST_Buff06",
					"children": [
						{
							"type": "lookAt",
							"name": "lookAt_FlareWhite",
							"x": -2.06502,
							"y": 0.39361,
							"z": 3.25839,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"target": "camera",
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Slide",
									"enabled": false,
									"props": {
										"alignMode": "Screen",
										"emitSurface": true,
										"lifeTime": 0.4,
										"lifeTimeRand": 0.05,
										"maxCount": 10,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_02.png",
										"instRotation_rand": [
											0,
											0,
											0
										],
										"instOffset_rand": [
											-1,
											-1,
											-1
										],
										"instScale_rand": 0.5,
										"animationBlendBetweenFrames": false,
										"emitRate": 8,
										"instSpeed_rand": [
											1,
											0,
											0
										],
										"emitShape": "Cone",
										"emitAngle": 180,
										"instSpeed": [
											5,
											0,
											0
										],
										"instOffset": [
											0.5,
											0.5,
											0.5
										]
									},
									"x": 0.8204775141934975,
									"y": 0.0189562286434235,
									"z": -0.11078155161613212,
									"scaleX": 0.39999999999999997,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": -0.31110677841644313,
									"rotationY": 10.510023186538819,
									"rotationZ": -1.7050720914764619,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
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
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
														"speed": 10,
														"frameDivision": [
															2,
															2
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": false
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/clouds3.png",
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
																	"time": 0.24726183384056316,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3176167024895698,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.3845396263264298,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.5
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
											"name": "emitRate",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -11,
													"mode": 0,
													"prevHandle": {
														"dv": 0.24365908668999126,
														"dt": -0.7589621655525467
													},
													"nextHandle": {
														"dv": -0.11290393648300716,
														"dt": 0.4263992115754891
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Slide",
									"props": {
										"alignMode": "Screen",
										"emitSurface": true,
										"lifeTime": 0.4,
										"lifeTimeRand": 0.05,
										"maxCount": 10,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_02.png",
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0.5,
										"animationBlendBetweenFrames": false,
										"emitRate": 8,
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"instScale": 2
									},
									"x": 0.8204775141934975,
									"y": 0.0189562286434235,
									"z": -0.11078155161613212,
									"scaleX": 0.24,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": -0.31110677841644313,
									"rotationY": 10.510023186538819,
									"rotationZ": -1.7050720914764619,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
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
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
														"speed": 10,
														"frameDivision": [
															2,
															2
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": false
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/clouds3.png",
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
																	"time": 0.24726183384056316,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3176167024895698,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.3845396263264298,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.5
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
											"name": "emitRate",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -11,
													"mode": 0,
													"prevHandle": {
														"dv": 0.24365908668999126,
														"dt": -0.7589621655525467
													},
													"nextHandle": {
														"dv": -0.11290393648300716,
														"dt": 0.4263992115754891
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "TestAnticipation/flammes",
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999998,
									"rotationY": 90,
									"children": [
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"scaleX": 11.999999999999998,
											"scaleY": 11.999999999999998,
											"scaleZ": 12,
											"rotationZ": 29.999999999999993,
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
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
																	1,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.23,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
																			}
																		}
																	]
																}
															]
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
																				"position": 0.4296875,
																				"color": -46254969
																			},
																			{
																				"position": 1,
																				"color": -242713346
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
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
											"rotationZ": 29.999999999999993,
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
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 1,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.23,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 2,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
																			}
																		}
																	]
																}
															]
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
																				"position": 0.4296875,
																				"color": -46254969
																			},
																			{
																				"position": 1,
																				"color": -242713346
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
																	0.7019607843137254,
																	0.38431372549019605,
																	0.996078431372549
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
																	0.5568627450980392,
																	0.38431372549019605,
																	0.996078431372549
																]
															}
														}
													]
												}
											]
										},
										{
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 15
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.3,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_ElecNoise01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 0.77,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
																	1
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
											"name": "FX_Mesh_Wormsign_elec01",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 25
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 1,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.3,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/T_ElecNoise01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 0.77,
																"uvScaleX": 2,
																"uvScaleY": 2,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
																	1
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 25
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 5,
																"uvScaleY": 0.5,
																"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.25,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Wave02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
																	1
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/clouds3.png",
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.24726183384056316,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.3176167024895698,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3845396263264298,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
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
											"type": "model",
											"name": "FX_Mesh_Wormsign",
											"source": "Fx/SandWorm/Mesh/FX_Mesh_Wormsign.fbx",
											"enabled": false,
											"scaleX": 8,
											"scaleY": 8,
											"scaleZ": 8,
											"rotationZ": 29.999999999999993,
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
															"drawOrder": "100",
															"emissive": 25
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
													"children": [
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
																"alpha": 12,
																"uScale": 1,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0,
																"texture": "Fx/Gradients/Cyl01u_A.jpg"
															},
															"children": [
																{
																	"type": "curve",
																	"name": "alpha",
																	"enabled": false,
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.06801310782103939,
																				"dt": -0.49993702374179955
																			},
																			"nextHandle": {
																				"dv": -0.01666666666666672,
																				"dt": 0.1225099689747229
																			}
																		},
																		{
																			"time": 0.2001840863976259,
																			"value": 1,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.26,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 5,
																"uvScaleY": 0.5,
																"texture": "Fx/Alphas/T_ElectricArc_1x4_13.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
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
																"progress": 0.25,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 8,
																"uvScaleY": 2,
																"texture": "Fx/Alphas/T_Wave02.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9,
																			"value": 0,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
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
																	0.054901960784313725,
																	0.054901960784313725,
																	0.07058823529411765
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
																	0.6470588235294118,
																	0.6,
																	1
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
																	0.6549019607843137,
																	0.4823529411764706,
																	1
																]
															}
														},
														{
															"type": "shader",
															"name": "DissolveMap_Gradient",
															"source": "shaders/DissolveMap.hx",
															"props": {
																"useSourceUVs": false,
																"useScale": true,
																"wrap": true,
																"progress": 0.17,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 3,
																"uvScaleY": 0.5,
																"texture": "Fx/Gradients/vGrad_inv.jpg",
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
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.5
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.06666666666666667
																			}
																		},
																		{
																			"time": 0.2,
																			"value": 0.23,
																			"mode": 2
																		},
																		{
																			"time": 0.415051602115371,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.07168386737179033
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": 0.07168386737179033
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
																"progress": 0.18,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/Water_01.png",
																"uvShift": [
																	0,
																	0
																],
																"uvShiftSpeed": [
																	0.1,
																	0
																]
															},
															"children": [
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"enabled": false,
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3,
																			"value": 1,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "uvShift.y",
																	"loop": true,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.45,
																			"value": 0,
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
															"enabled": false,
															"props": {
																"useSourceUVs": true,
																"useScale": true,
																"wrap": true,
																"progress": 0.5,
																"saturation": 1,
																"width": 1,
																"uvScaleX": 0.5,
																"uvScaleY": 0.5,
																"texture": "Fx/noise/clouds3.png",
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
																	"loop": true,
																	"keys": [
																		{
																			"time": 0.24726183384056316,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.3176167024895698,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.3845396263264298,
																			"value": 1,
																			"mode": 0
																		},
																		{
																			"time": 0.5,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.16666666666666666
																			},
																			"nextHandle": {
																				"dv": 0,
																				"dt": -0.5
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
																"color": -151464545
															},
															{
																"position": 0.83984375,
																"color": -1
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
											"type": "polygon",
											"name": "polygon",
											"enabled": false,
											"scaleX": 7,
											"scaleY": 7,
											"scaleZ": 7,
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
															"emissive": 2
														}
													}
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
																		"position": 0.4296875,
																		"color": -46254969
																	},
																	{
																		"position": 1,
																		"color": -242713346
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
															0.5333333333333333,
															0.48627450980392156,
															0.996078431372549
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 2,
														"power": 0.8
													}
												},
												{
													"type": "curve",
													"name": "scale",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.2,
															"mode": 2
														},
														{
															"time": 0.25,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5,
															"value": 0.2,
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
									"type": "emitter",
									"name": "emitter_Slide",
									"props": {
										"alignMode": "Screen",
										"emitSurface": true,
										"lifeTime": 0.4,
										"lifeTimeRand": 0.05,
										"maxCount": 10,
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationLoop": false,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_02.png",
										"instRotation_rand": [
											0,
											0,
											360
										],
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instScale_rand": 0.5,
										"animationBlendBetweenFrames": false,
										"emitRate": 8,
										"instSpeed_rand": [
											0,
											0,
											0
										]
									},
									"x": 0.8204775141934975,
									"y": 0.0189562286434235,
									"z": -0.11078155161613212,
									"scaleX": 0.24,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": -0.31110677841644313,
									"rotationY": 10.510023186538819,
									"rotationZ": -1.7050720914764619,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 1.5,
											"scaleY": 1.5,
											"scaleZ": 1.5,
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
													"enabled": false,
													"props": {
														"useSourceUVs": false,
														"blendBetweenFrames": true,
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_2x2_01.png",
														"speed": 10,
														"frameDivision": [
															2,
															2
														],
														"totalFrames": 4,
														"startTime": 0,
														"loop": false
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
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": true,
														"useScale": true,
														"wrap": true,
														"progress": 0.5,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/clouds3.png",
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
																	"time": 0.24726183384056316,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3176167024895698,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.3845396263264298,
																	"value": 1,
																	"mode": 0
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.5
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
											"name": "emitRate",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "position.x",
											"enabled": false,
											"keyMode": 0,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": -11,
													"mode": 0,
													"prevHandle": {
														"dv": 0.24365908668999126,
														"dt": -0.7589621655525467
													},
													"nextHandle": {
														"dv": -0.11290393648300716,
														"dt": 0.4263992115754891
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.0077249401461189915,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.20462454287806833,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.21462454287806834,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.8,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.81,
													"value": 2,
													"mode": 2
												},
												{
													"time": 2,
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
							"type": "advancedDecal",
							"name": "FakeFresnel",
							"y": 0.8794,
							"z": 4.25913,
							"scaleX": 10,
							"scaleY": 16,
							"scaleZ": 5.33,
							"rotationZ": -89.99999999999999,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"renderMode": "AfterTonemapping",
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
											"loop": true,
											"keys": [
												{
													"time": -6.938893903907228e-18,
													"value": 0.75,
													"mode": 2
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5,
													"value": 0.75,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.03485975677854325,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.10527968055035841,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.19917291224611194,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 0.3480308554906656,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.13934203771706083,
														"dt": -0.0940868914220308
													},
													"nextHandle": {
														"dv": -0.0005562475711130138,
														"dt": 0.47318471673981344
													}
												},
												{
													"time": 0.8755118776817458,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9104249280187479,
													"value": 0.02163275373246143,
													"mode": 2
												},
												{
													"time": 0.9372811205856726,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.9802510286927522,
													"value": 0.02494925287235139,
													"mode": 2
												},
												{
													"time": 1.036649033083294,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1118463722706833,
													"value": 0.05479774513136104,
													"mode": 2
												},
												{
													"time": 1.1924149499714574,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2971541009824636,
													"value": 0.10786173136960042,
													"mode": 2
												},
												{
													"time": 1.396522013480085,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4905186874643217,
													"value": 0.25,
													"mode": 2
												},
												{
													"time": 1.600629076988713,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.685641958570401,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.697311370229642,
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0,
											0
										]
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
											0.5372549019607843,
											0.43529411764705883,
											1
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.38,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/circGrad01_invert.png",
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
							"type": "model",
							"name": "RailgunTEST",
							"source": "Fx/Meshes_Common/VerniusRailgun_PlainMat.fbx",
							"x": -0.44152,
							"y": 0.48839,
							"z": -4.80269,
							"scaleX": 3.3,
							"scaleY": 3.1,
							"scaleZ": 3.3,
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
											"emissive": 5
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
											0.4196078431372549,
											0.2823529411764706,
											0.7294117647058823
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
										"bias": 0.15,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.25,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/circGrad05_invert.jpg.png",
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
							"name": "AOE",
							"enabled": false,
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2.5,
							"children": [
								{
									"type": "object",
									"name": "Duration",
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_inside",
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 4.4,
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
													"enabled": false,
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
																		"color": -15007601
																	},
																	{
																		"position": 0.5,
																		"color": -5137922
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
											"name": "advancedDecal_border",
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 7.81,
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
													"enabled": false,
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
																		"color": -15007601
																	},
																	{
																		"position": 0.5,
																		"color": -5137922
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
													"enabled": false,
													"props": {
														"UVScale": [
															1,
															1
														],
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															0.7647058823529411,
															0.6901960784313725,
															1,
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
											"z": 0.5,
											"scaleX": 0.95,
											"scaleY": 0.95,
											"scaleZ": 0.95,
											"children": [
												{
													"type": "polygon",
													"name": "Ribbon",
													"enabled": false,
													"scaleX": 17,
													"scaleY": 17,
													"scaleZ": 1.42,
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
														0.8,
														4
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
																	"emissive": 20
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
																"blendBetweenFrames": true,
																"startFrame": 0,
																"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
																"speed": 10,
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
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 10,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0.25,
																"texture": "Fx/Alphas/CACA.png"
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
															"enabled": false,
															"props": {
																"alpha": 2
															}
														},
														{
															"type": "shader",
															"name": "VertexDisplacement",
															"source": "shaders/VertexDisplacement.hx",
															"enabled": false,
															"props": {
																"X": true,
																"Y": true,
																"Z": true,
																"texScaleX": 8,
																"texScaleY": 8,
																"tex": "Fx/Gradients/Cyl05v_A01.png",
																"intensity": 5,
																"scrollSpeed": [
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
																				"color": -15007601
																			},
																			{
																				"position": 0.5,
																				"color": -5137922
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
															"enabled": false,
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
															"name": "UVTransform",
															"source": "shaders/UVTransform.hx",
															"props": {
																"scaleX": 4,
																"scaleY": 1,
																"shiftX": 0,
																"shiftY": 0,
																"shiftSpeedX": 0,
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
													"rotationZ": 70,
													"kind": 1,
													"args": [
														48,
														360,
														0.8,
														4
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
																	"emissive": 20
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
																"blendBetweenFrames": true,
																"startFrame": 1,
																"texture": "Fx/Alphas/T_ElectricArc_1x4_11.png",
																"speed": 10,
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
															"name": "AlphaMap",
															"source": "shaders/AlphaMap.hx",
															"enabled": false,
															"props": {
																"useSourceUVs": false,
																"onDecal": false,
																"wrap": true,
																"invert": false,
																"replace": false,
																"alpha": 1,
																"uScale": 10,
																"vScale": 1,
																"uOffset": 0,
																"vOffset": 0.25,
																"texture": "Fx/Alphas/CACA.png"
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
															"enabled": false,
															"props": {
																"alpha": 2
															}
														},
														{
															"type": "shader",
															"name": "VertexDisplacement",
															"source": "shaders/VertexDisplacement.hx",
															"enabled": false,
															"props": {
																"X": true,
																"Y": true,
																"Z": true,
																"texScaleX": 8,
																"texScaleY": 8,
																"tex": "Fx/Gradients/Cyl05v_A01.png",
																"intensity": 5,
																"scrollSpeed": [
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
																"progress": 0.85,
																"saturation": 0,
																"width": 1,
																"uvScaleX": 1,
																"uvScaleY": 0.125,
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
																				"color": -65339249
																			},
																			{
																				"position": 0.5,
																				"color": -5203969
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
															"enabled": false,
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
															"name": "UVTransform",
															"source": "shaders/UVTransform.hx",
															"props": {
																"scaleX": 5,
																"scaleY": 1,
																"shiftX": 0,
																"shiftY": 0,
																"shiftSpeedX": 0,
																"shiftSpeedY": 0
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
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.580392156862745,
															0.4549019607843137,
															0.9921568627450981
														]
													}
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
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 1.5544662385332857,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.2655900987052088,
										"dt": -0.4986853911748805
									},
									"nextHandle": {
										"dv": 0.09270017090781124,
										"dt": 0.2238328975833932
									}
								},
								{
									"time": 1.8822215528518247,
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