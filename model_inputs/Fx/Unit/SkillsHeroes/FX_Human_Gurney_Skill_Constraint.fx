{
	"type": "fx",
	"cullingRadius": 50,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"scaleX": 200,
			"scaleY": 200,
			"scaleZ": 200,
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
			"name": "Gurney",
			"editorOnly": true,
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "model",
					"name": "Male01_AtreidesGurney",
					"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.9999999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_Run.fbx",
							"loop": true
						}
					]
				},
				{
					"type": "model",
					"name": "GurneySet_Shield",
					"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"rotationX": -90
				},
				{
					"type": "model",
					"name": "GurneySet_Javelin",
					"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
					"x": 0.04935,
					"scaleY": 1.0000000000000002,
					"scaleZ": 1.0000000000000002,
					"rotationX": -90
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Gurney.GurneySet_Shield",
					"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Gurney.GurneySet_Javelin",
					"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				}
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Passif",
					"y": 0.1,
					"scaleX": 0.2,
					"scaleY": 0.2,
					"scaleZ": 0.2,
					"children": [
						{
							"type": "emitter",
							"name": "Notes",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale": 0.5,
								"burstParticleCount": 5,
								"maxCount": 30,
								"emitShape": "Cylinder",
								"instScale_rand": 0.2,
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
									0.2,
									0,
									0
								],
								"simulationSpace": "World",
								"instSpeed": [
									2,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"lifeTime": 1.25,
								"emitRate": 4,
								"instWorldSpeed": [
									0,
									0,
									0.1
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.2
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
								]
							},
							"z": -0.12162,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 1.5,
							"rotationX": 90,
							"rotationY": 90,
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
															"mode": 0,
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
													0.7686274509803921,
													1,
													0.7450980392156863
												]
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
							"type": "trails",
							"name": "TrailsPartition",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3,
							"endWidth": 2,
							"lifetime": 3.5,
							"minSpeed": 1,
							"uvMode": "ELifetime",
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
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
										"vScale": 0.4,
										"uOffset": 1,
										"vOffset": 0.3,
										"texture": "Fx/Alphas/T_Music_Partition_01.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.6823019034632045,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.018382701166021222,
														"dt": -0.49996913865997117
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.4532295245907001
													}
												},
												{
													"time": 2.402472856560643,
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
											0.8509803921568627,
											1,
											0.5176470588235293
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
										"progress": 0.28,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl01v_A.png",
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.45,
										"shiftSpeedY": 0
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
														"color": -8144688
													},
													{
														"position": 0.4921875,
														"color": -2884726
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
											4,
											4
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											1,
											1,
											1,
											1
										],
										"mask": "Fx/noise/T_Fire.png",
										"UVOffset": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "trails",
							"name": "Trails",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3,
							"endWidth": 2,
							"lifetime": 3.5,
							"minSpeed": 1,
							"uvMode": "ELifetime",
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
									"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
										"uScale": 1,
										"vScale": 0.4,
										"uOffset": 1,
										"vOffset": 0.3,
										"texture": "Fx/Alphas/T_Music_Partition_05.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3602941176470589,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.018382701166021222,
														"dt": -0.49996913865997117
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.4532295245907001
													}
												},
												{
													"time": 2.402472856560643,
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
											0.6666666666666666,
											1,
											0.7686274509803921
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
										"progress": 0.28,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl01v_A.png",
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
										"progress": 0.75,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.45,
										"shiftSpeedY": 0
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
														"color": -8144688
													},
													{
														"position": 0.4921875,
														"color": -2884726
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
				}
			]
		},
		{
			"type": "constraint",
			"name": "constraint",
			"object": "FXAnimation.FXRoot",
			"target": "FXAnimation.Gurney.Male01_AtreidesGurney.root.B_ROOTJ"
		},
		{
			"type": "object",
			"name": "FXRoot_",
			"enabled": false,
			"scaleX": 5,
			"scaleY": 5,
			"scaleZ": 5,
			"children": [
				{
					"type": "object",
					"name": "Skill",
					"enabled": false,
					"x": 0.6965427272727274,
					"y": 0.040847272727272725,
					"z": 0.5864790909090908,
					"children": [
						{
							"type": "object",
							"name": "Impact",
							"enabled": false,
							"x": 0.87686,
							"y": 0.11437,
							"z": -0.48962,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "emitter",
									"name": "SandProjectionMesh",
									"props": {
										"enableSort": false,
										"emitSurface": true,
										"frameCount": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instStretch": [
											2,
											2,
											1.3
										],
										"lifeTime": 0.35,
										"lifeTimeRand": 0.1,
										"warmUpTime": -1.4,
										"emitType": "Burst",
										"instStretch_rand": [
											0.1,
											0.1,
											0.3
										],
										"instScale": 3.8,
										"instScale_rand": 0.1,
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
											360
										]
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "CylinderCone_StraightUV",
											"source": "Fx/Meshes_Common/CylinderCone_StraightUV_01_larger.fbx",
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
														"uScale": 7,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlatFlash.png"
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 5,
														"uvScaleY": 1,
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
																	"value": 0.5,
																	"mode": 1,
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
																	"time": 0.9964190873914609,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
														"progress": 1,
														"saturation": 1,
														"width": 0.77,
														"uvScaleX": 2,
														"uvScaleY": 0.25,
														"texture": "Fx/noise/clouds.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.5
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
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1
																},
																{
																	"time": 0.1595451461401853,
																	"value": 0.5,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.23923913632747057,
																		"dt": -0.14321733235582138
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.28015161795327154
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.28015161795327154
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
															0.2196078431372549,
															0.9176470588235294,
															0.4823529411764706
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
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
											"type": "curve",
											"name": "instStretch.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.6,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
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
													"value": 0.3136958552692092,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8360452004908794,
														"dt": -0.004266167276962038
													},
													"nextHandle": {
														"dv": 0.4833333333333333,
														"dt": 0.0017933693486200664
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.885
													},
													"nextHandle": {
														"dv": -1.3607186657192811e-16,
														"dt": 0.33333333333333326
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.z",
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
									"name": "Hit",
									"props": {
										"emitType": "Burst",
										"instScale_rand": 0,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"warmUpTime": -0.5,
										"lifeTime": 1.5,
										"instScale": 0.6
									},
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"culling": "None",
															"depthTest": "LessEqual",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": false,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 10,
															"drawOrder": "120"
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
														"onDecal": false,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_FlatImpact.png"
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
														"progress": 0.45,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/noise/clouds.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.61,
																	"value": 0.01416666666666666,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0.3775126578654911,
																		"dt": -0.49657530216143814
																	},
																	"nextHandle": {
																		"dv": 0.023114784558614043,
																		"dt": 0.08500000000000008
																	}
																},
																{
																	"time": 0.7050000000000001,
																	"value": 0.9419580650329591,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.8723667347431184,
																		"dt": 0.07999999999999996
																	}
																},
																{
																	"time": 0.95,
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
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.5,
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
															0.2196078431372549,
															0.9176470588235294,
															0.4823529411764706
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keys": [
																{
																	"time": 0.8644284090909091,
																	"value": 0.9,
																	"mode": 2
																},
																{
																	"time": 0.9444284090909091,
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
											"type": "curve",
											"name": "instScale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.03236093441864362,
														"dt": -0.49997643676805403
													},
													"nextHandle": {
														"dv": 0.03333333333333333,
														"dt": 0.5149999999999999
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "model",
									"name": "Knee",
									"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
									"x": -0.3445,
									"y": -0.01928,
									"z": 3.70886,
									"scaleX": 0.4,
									"scaleY": 0.4,
									"scaleZ": 2.5,
									"rotationY": 175,
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
													"depthTest": "LessEqual"
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
												"wrap": false,
												"invert": false,
												"replace": false,
												"alpha": 3.56,
												"uScale": 1,
												"vScale": 1,
												"uOffset": -0.18,
												"vOffset": 0,
												"texture": "Fx/Gradients/T_Square03.jpg"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keys": [
														{
															"time": 0.9569214434097999,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.4566899697154054,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.541545696106594,
															"value": 2,
															"mode": 2
														},
														{
															"time": 1.64149671509102,
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
													0.5098039215686274,
													0.8117647058823529,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.9648956035950667,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.90409167658403,
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
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.4,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 0.28,
												"texture": "Fx/noise/Wave_01.jpg",
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
											"name": "UVTransform",
											"source": "shaders/UVTransform.hx",
											"props": {
												"scaleX": 0.53,
												"scaleY": 1,
												"shiftX": 1,
												"shiftY": 1,
												"shiftSpeedX": 0,
												"shiftSpeedY": 0
											},
											"children": [
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.3359491445894558,
															"value": 0.06666666666666667,
															"mode": 0,
															"prevHandle": {
																"dv": -0.808452083454443,
																"dt": -0.48507125007266594
															},
															"nextHandle": {
																"dv": 0.13333333333333336,
																"dt": 0.08000000000000007
															}
														},
														{
															"time": 1.498746745453906,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8072896989041016,
															"value": 1.3,
															"mode": 0
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
												"progress": 0.79,
												"saturation": 1,
												"width": 0.11,
												"uvScaleX": 0.14,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/T_Square03.jpg",
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
													"name": "width",
													"keys": [
														{
															"time": 1.5285769607752242,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.8341245312767893,
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
												"range": 15.15,
												"power": 20
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
												"uvScaleX": 0.98,
												"uvScaleY": 2,
												"texture": "Fx/Gradients/uGrad.png",
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
													0.6666666666666666,
													1,
													0.7686274509803921
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 1.8427967405168735,
															"value": 0.9,
															"mode": 2
														},
														{
															"time": 1.9227967405168735,
															"value": 0.2,
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
							"name": "FlashDecals",
							"x": -0.08407,
							"y": 0.05341,
							"z": 0.33529,
							"scaleX": 0.9999999999999998,
							"scaleY": 0.9999999999999998,
							"scaleZ": 0.9999999999999998,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": -0.04141,
									"z": 1.22656,
									"scaleX": 5,
									"scaleY": 4,
									"scaleZ": 4,
									"rotationY": 89.99999999999999,
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
															"time": 0.5340051808957428,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5440051808957428,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6307306445168033,
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
									"name": "advancedDecal_Green",
									"x": -0.16694,
									"z": 1.26957,
									"scaleX": 4.5,
									"scaleY": 3.5,
									"scaleZ": 3,
									"rotationY": 90,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5991941122909631,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6827890466325224,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4651543152009034,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.09999999999999998,
																"dt": -0.288834637896635
															},
															"nextHandle": {
																"dv": 0.21666666666666667,
																"dt": 0.030952001010344565
															}
														},
														{
															"time": 1.5190527321040586,
															"value": 1,
															"mode": 1
														},
														{
															"time": 1.8340736608130257,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.09336206410417613
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.09336206410417613
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
													0.6666666666666666,
													1,
													0.7686274509803921
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "flare",
							"x": -0.15601,
							"y": 0.07659,
							"z": 3.41807,
							"scaleX": 0.49999999999999994,
							"scaleY": 0.49999999999999994,
							"scaleZ": 0.49999999999999994,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_FlareBlack",
									"props": {
										"lifeTime": 0.35,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.5,
										"instStretch": [
											20,
											8,
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
										"emitType": "Burst",
										"warmUpTime": -0.6
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
													}
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
													"value": 1,
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Flare",
									"props": {
										"lifeTime": 0.2,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"burstDelay": 0.45,
										"instStretch": [
											12,
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
										"warmUpTime": -0.65,
										"emitType": "Burst"
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
															"emissive": 6,
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
																	"mode": 0,
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
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.6666666666666666,
															1,
															0.7686274509803921
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
													"mode": 0,
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
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "object",
							"name": "Flare",
							"x": -0.2297,
							"z": 1.07439,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"children": [
								{
									"type": "lookAt",
									"name": "lookAt_FlareWhite",
									"z": -1.4117100000000002,
									"rotationY": -180,
									"rotationZ": 112.0223446799488,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 1.5,
											"scaleY": 20,
											"scaleZ": 1.5,
											"rotationX": -90,
											"rotationZ": -90,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
														"progress": 0.29,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
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
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5503903254866931,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.740390325486693,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.5137535468403278,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3732325344789038
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3732325344789038
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
														"range": 10,
														"power": 2
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
															0.7607843137254902,
															0.596078431372549,
															0.34509803921568627
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2545976210034451,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.62033557043892,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00757687696833834,
																		"dt": -0.06406311509621984
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.28150569319861213
																	}
																},
																{
																	"time": 1.7262160393406263,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.19319171969186,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008238709171402767,
														"dt": -0.18537095635656012
													},
													"nextHandle": {
														"dv": -0.029999999999999916,
														"dt": 0.675625
													}
												},
												{
													"time": 0.80131671969186,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.509857804214883,
													"value": 1.8000000000000012,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
													}
												}
											]
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt_FlarePartition",
									"z": 8.56452,
									"scaleY": 4,
									"rotationY": -180,
									"rotationZ": 112.0223446799488,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"y": 0.02221,
											"z": -1.04827,
											"scaleX": 1.13,
											"scaleY": 20,
											"scaleZ": 1.13,
											"rotationX": -90,
											"rotationZ": -90,
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
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 2,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_Music_Partition.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "vOffset",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 5,
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
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
															"keys": [
																{
																	"time": 0.4305599752518384,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8013,
																	"value": 0.33683587496717576,
																	"mode": 2
																},
																{
																	"time": 1.51,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.26,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/vGrad.png",
														"uvShift": [
															0,
															0.02
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
															"enabled": false,
															"keys": [
																{
																	"time": 0.4305599752518384,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8013,
																	"value": 0.33683587496717576,
																	"mode": 2
																},
																{
																	"time": 1.51,
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
														"progress": 0.29,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.2,
															1
														],
														"uvScaleSpeed": [
															0,
															0
														]
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"enabled": false,
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
														"texture": "Fx/Alphas/T_circle5.png"
													},
													"isInstance": true
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5503903254866931,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.740390325486693,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.5137535468403278,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3732325344789038
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3732325344789038
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
													"enabled": false,
													"props": {
														"REVERSE": false,
														"range": 10,
														"power": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.7607843137254902,
															0.596078431372549,
															0.34509803921568627
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2545976210034451,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.62033557043892,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00757687696833834,
																		"dt": -0.06406311509621984
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.28150569319861213
																	}
																},
																{
																	"time": 1.7262160393406263,
																	"value": 1,
																	"mode": 0
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
														"shiftSpeedY": 0.3
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 50,
														"power": 0.8
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.19319171969186,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.008238709171402767,
														"dt": -0.18537095635656012
													},
													"nextHandle": {
														"dv": -0.029999999999999916,
														"dt": 0.675625
													}
												},
												{
													"time": 0.80131671969186,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.509857804214883,
													"value": 1.8000000000000012,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.22752087249572386
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.22752087249572386
													}
												}
											]
										},
										{
											"type": "shader",
											"name": "WorldUV",
											"source": "shaders/WorldUV.hx",
											"enabled": false,
											"props": {
												"useNormalMap": false,
												"onDecal": false,
												"scale": 5,
												"rotation": 0
											}
										}
									]
								},
								{
									"type": "lookAt",
									"name": "lookAt_FlareLarge",
									"z": 1.4117100000000002,
									"scaleY": 1.1,
									"rotationZ": -67.97765532005121,
									"target": "camera",
									"lockAxis": [
										0,
										0,
										1
									],
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
											"scaleX": 6,
											"scaleY": 40,
											"scaleZ": 2.05,
											"rotationX": -90,
											"rotationZ": -90,
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
															"parallax": 0
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
														"texture": "Fx/Gradients/Cyl05v_A.png",
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
																	"time": 0.5503903254866931,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.740390325486693,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.02
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3133333333333333
																	}
																},
																{
																	"time": 1.521462947258485,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.3339427824508911
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3339427824508911
																	}
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
														"alpha": 0.65,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_circle2.png"
													},
													"isInstance": true
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
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Gradients/Cyl04v_A.jpg"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 15,
														"power": 2
													},
													"isInstance": true
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
																		"color": -151464545
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
															0.6431372549019607,
															0.5019607843137255,
															0.28627450980392155
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.2545976210034451,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.5699212363686412,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.00757687696833834,
																		"dt": -0.06406311509621984
																	},
																	"nextHandle": {
																		"dv": -0.03333333333333333,
																		"dt": 0.28150569319861213
																	}
																},
																{
																	"time": 1.2587866163647736,
																	"value": 1,
																	"mode": 0
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.6666666666666666,
											1,
											0.7686274509803921
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.6153506542432383,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.2350916509493346,
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
							"name": "sand",
							"x": 0.40328,
							"z": -0.5,
							"children": [
								{
									"type": "polygon",
									"name": "Round_Sand_Stylised",
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 0.04,
									"rotationZ": 89.99999999999997,
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
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 0.3,
													"drawOrder": "110"
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlatImpact.png"
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
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.5
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
													"keyMode": 1,
													"keys": [
														{
															"time": 1.3473935637060945,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 1.3473935637060945,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -1.0614035807794995,
																"dt": 0.24955175517728168
															}
														},
														{
															"time": 2.173595709508376,
															"value": 0.0002485722671614621,
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
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										},
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3989310010180205,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.010893013836548135
													}
												},
												{
													"time": 1.4332050845083764,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": -0.018726500684397046,
														"dt": -0.003303737957172996
													},
													"nextHandle": {
														"dv": 0.5269202398255781,
														"dt": 0.09254882812499987
													}
												},
												{
													"time": 2.30217969388338,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sand_Floor2",
									"props": {
										"instScale_rand": 0.5,
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
										"emitRate": 1,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 16,
										"frameDivisionX": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
										"instScale": 7,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 3,
										"emitShape": "Cylinder",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"alignMode": "Screen",
										"warmUpTime": -1.4,
										"emitOrientation": "Normal",
										"instSpeed_rand": [
											0.5,
											0,
											0
										],
										"seedGroup": 2,
										"lifeTime": 1.5,
										"burstDelay": 0.5,
										"instOffset_rand": [
											0,
											0,
											0
										],
										"instOffset": [
											0,
											0,
											2
										],
										"instSpeed": [
											5,
											0,
											0
										]
									},
									"x": -0.10832,
									"y": 0.1504,
									"z": 0.05376,
									"scaleX": 0.9999999999999997,
									"scaleY": 0.9999999999999997,
									"scaleZ": 0.010000000000000002,
									"rotationZ": 2.0999999999999988,
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
															"textureWrap": true
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Structure/Smoke/white.png"
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.8
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
																	"mode": 0,
																	"prevHandle": {
																		"dv": -1.6472728746925278,
																		"dt": -0.012445056058803479
																	},
																	"nextHandle": {
																		"dv": 0.9454545454545454,
																		"dt": 0.007142857142857143
																	}
																},
																{
																	"time": 0.45,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 8.922912650454184e-17,
																		"dt": -0.21499999999999997
																	},
																	"nextHandle": {
																		"dv": 0,
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9098039215686274,
															0.9098039215686274,
															0.9098039215686274
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
														"useScale": false,
														"wrap": true,
														"progress": 1,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 1,
														"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
																	"value": 0.85,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.1116321015082125,
																		"dt": -0.3076091494743911
																	},
																	"nextHandle": {
																		"dv": -1,
																		"dt": 0.2774350174349862
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
														"range": 28.79,
														"power": 38.64
													},
													"isInstance": true
												},
												{
													"type": "fakeLight",
													"name": "FakeLight",
													"enabled": false,
													"normalMap": "Fx/DistortionMaps/SphereClean.png",
													"topIntensity": 0.4,
													"topSpan": 0.5,
													"dirIntensity": 0.5,
													"dirSpan": 0.9,
													"sandBlend": 0.7,
													"envBlend": 0.5
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.4,
														"envColorSet": false
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
													"value": 0.2,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.040734981627899014,
														"dt": -0.6732812499999992
													},
													"nextHandle": {
														"dv": 0.016048606913192237,
														"dt": 0.2659338296837626
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
														"dv": 1.0368041795619947,
														"dt": -0.22469329683007053
													},
													"nextHandle": {
														"dv": -1.0041624617719014,
														"dt": 0.2179870466083442
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.024279651221022422,
														"dt": -0.3496719776184397
													},
													"nextHandle": {
														"dv": 0.024279651221022422,
														"dt": 0.3496719776184397
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
							"name": "Decals",
							"x": -0.004601111111111167,
							"y": -6.938893903907228e-18,
							"z": -0.17653444444444444,
							"children": [
								{
									"type": "object",
									"name": "testdecalspattern",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"children": [
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 3.4000000000000004,
											"albedoMap": "Fx/Alphas/T_CirclePattern09.png",
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5647604870186452,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7604695666785718,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.7278315889976372,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.4119210152842263
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.4119210152842263
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0.5647604870186452,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.7604695666785718,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.1683993439965947,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.8067378204546471
																	},
																	"nextHandle": {
																		"dv": -3.6059295033098357e-16,
																		"dt": 0.41192101528422637
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
															1,
															1,
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
															0.5490196078431373,
															1,
															0.6862745098039216
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_Black",
											"scaleX": 22,
											"scaleY": 22,
											"scaleZ": 3.4000000000000004,
											"albedoMap": "Fx/Alphas/T_CirclePattern09.png",
											"emissive": 2,
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 1.4553254676665857,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.76982376788267,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.6236693350177767,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.01666666666666672,
																		"dt": -0.5488303670437547
																	},
																	"nextHandle": {
																		"dv": 0.012171516361639812,
																		"dt": 0.40080586753427677
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
															1,
															1,
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
															0.5490196078431373,
															1,
															0.6862745098039216
														]
													}
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
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
												"alpha": 1.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4553254676665857,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5557669975325554,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.042231014460139,
															"value": 0,
															"mode": 0,
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
												},
												{
													"type": "curve",
													"name": "alpha",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4553254676665857,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.76982376788267,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.972317268708874,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.5488303670437547
															},
															"nextHandle": {
																"dv": 0.012171516361639812,
																"dt": 0.40080586753427677
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.41,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.001
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 2.13,
									"albedoMap": "Fx/Gradients/circGrad3.jpg",
									"emissive": 1,
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
													"enabled": false,
													"keys": [
														{
															"time": 0.5949737889442075,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.855,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.41,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4553254676665857,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.76982376788267,
															"value": 1,
															"mode": 2
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
															"time": 1.4553254676665857,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.76982376788267,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.972317268708874,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.5488303670437547
															},
															"nextHandle": {
																"dv": 0.012171516361639812,
																"dt": 0.40080586753427677
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.41,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
													0.001
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_2048.png",
									"emissive": 2,
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
															"time": 0.5949737889442075,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.855,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.41,
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
															"time": 1.3105645606777057,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5705907717334981,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.987320023672922,
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"emissive": 2,
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
															"time": 0.5949737889442075,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.855,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.41,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.4553254676665857,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.76982376788267,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.972317268708874,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.5488303670437547
															},
															"nextHandle": {
																"dv": 0.012171516361639812,
																"dt": 0.40080586753427677
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Inside",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 25,
									"scaleY": 25,
									"scaleZ": 2.13,
									"albedoMap": "Fx/Gradients/circGrad3.jpg",
									"emissive": 1,
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
															"time": 0.5647604870186452,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7604695666785718,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7278315889976372,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4119210152842263
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4119210152842263
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.41,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/noise/causticTexture_02.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.05,
													0.01
												]
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Black",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4000000000000004,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5647604870186452,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.7604695666785718,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.7278315889976372,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4119210152842263
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4119210152842263
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
													1,
													1,
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
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
										}
									]
								},
								{
									"type": "model",
									"name": "CylinderStraight_02",
									"source": "Fx/Meshes_Common/CylinderStraight_02_MoreVrtx.fbx",
									"x": 0.004601111111111056,
									"y": 6.938893903907228e-18,
									"z": -1.4122755555555562,
									"scaleX": 8.1,
									"scaleY": 8.1,
									"scaleZ": 3,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": false,
												"wrap": true,
												"progress": 0.21,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0.02
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
													0.5490196078431373,
													1,
													0.6862745098039216
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
													"keys": [
														{
															"time": 1.638387881331698,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.462367978270281,
															"value": 0,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keys": [
												{
													"time": 1.5241711340007562,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6720760756435302,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "partitiononde",
									"scaleX": 12,
									"scaleY": 12,
									"kind": 1,
									"args": [
										24,
										360,
										0.52,
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
													0.6862745098039216
												]
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
													"keyMode": 0,
													"keys": [
														{
															"time": 1.5816883362145457,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.346513957798648,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.01666666666666672,
																"dt": -0.8446713374934212
															},
															"nextHandle": {
																"dv": 0.003711933488605611,
																"dt": 0.18751319682554488
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
													"time": 1.4762056294348747,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.8287592419383263,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.31666666666666665,
														"dt": -0.3282388382966226
													},
													"nextHandle": {
														"dv": 0.4392579126265218,
														"dt": 0.4553100219572494
													}
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
												"shiftSpeedX": 0.05,
												"shiftSpeedY": 0
											}
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "advancedDecal_Grow",
									"x": -0.03680888888888889,
									"y": 6.938893903907228e-18,
									"z": 0.17653444444444444,
									"scaleX": 17,
									"scaleY": 17,
									"scaleZ": 3.4,
									"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512_test.png",
									"emissive": 1,
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
													"keyMode": 0,
													"keys": [
														{
															"time": 0.5949737889442075,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009199252407447112,
																"dt": -0.4999904742853324
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 0.9035985924518015
															}
														},
														{
															"time": 1.9850492365506835,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.5490196078431373,
													1,
													0.6862745098039216
												]
											}
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
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.4762056294348747,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.8287592419383263,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.31666666666666665,
														"dt": -0.3282388382966226
													},
													"nextHandle": {
														"dv": 0.4392579126265218,
														"dt": 0.4553100219572494
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Sparks",
							"props": {
								"alignMode": "Axis",
								"instScale": 0.6,
								"burstParticleCount": 5,
								"maxCount": 30,
								"emitShape": "Cylinder",
								"instScale_rand": 0.2,
								"emitAngle": 360,
								"emitSurface": true,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"spriteSheet": "Fx/Alphas/T_Music.png",
								"instWorldSpeed": [
									0,
									0,
									120
								],
								"instWorldSpeed_rand": [
									0,
									0,
									10
								],
								"instOrbitSpeed_rand": [
									0.05,
									0,
									0
								],
								"speedFactor": 0.5,
								"lifeTime": 0.5,
								"instOrbitSpeed": [
									0.1,
									0,
									0
								]
							},
							"x": -0.12222,
							"y": -0.25466,
							"z": 2.10174,
							"scaleZ": 0.5,
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
															"mode": 0,
															"prevHandle": {
																"dv": 0.016666666666666663,
																"dt": -0.6
															},
															"nextHandle": {
																"dv": -0.007499980717983807,
																"dt": 0.26999930584746384
															}
														}
													]
												}
											]
										},
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"enabled": false,
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
												"texture": null,
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
															"mode": 2
														},
														{
															"time": 0.19,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.02
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.3133333333333333
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"enabled": false,
											"props": {
												"amount": 1,
												"color": [
													0.9764705882352941,
													0.7529411764705882,
													0.5137254901960784
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
													0.6666666666666666,
													1,
													0.7686274509803921
												]
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keys": [
										{
											"time": 0.24,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 4,
											"mode": 2
										},
										{
											"time": 0.4163567208211221,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.4263567208211221,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instOrbitSpeed.x",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.25,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": -1,
											"mode": 2
										},
										{
											"time": 0.75,
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
					"type": "object",
					"name": "Passif",
					"y": 0.1166,
					"z": 0.0119,
					"scaleX": 0.9999999999999997,
					"scaleY": 0.9999999999999997,
					"children": [
						{
							"type": "emitter",
							"name": "Notes",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale": 0.5,
								"burstParticleCount": 5,
								"maxCount": 30,
								"emitShape": "Cylinder",
								"instScale_rand": 0.2,
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
									0.2,
									0,
									0
								],
								"simulationSpace": "World",
								"instSpeed": [
									2,
									0,
									0
								],
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"lifeTime": 1.25,
								"emitRate": 4,
								"instWorldSpeed": [
									0,
									0,
									0.1
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.2
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
								]
							},
							"z": -0.12162,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 1.5,
							"rotationX": 90,
							"rotationY": 90,
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
															"mode": 0,
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
													0.7686274509803921,
													1,
													0.7450980392156863
												]
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
							"type": "trails",
							"name": "TrailsPartition",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3.5,
							"endWidth": 2,
							"lifetime": 4,
							"minSpeed": 5,
							"uvMode": "ELifetime",
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
											"emissive": 0.5
										}
									},
									"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
										"vScale": 0.4,
										"uOffset": 1,
										"vOffset": 0.3,
										"texture": "Fx/Alphas/T_Music_Partition_01.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.6823019034632045,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.018382701166021222,
														"dt": -0.49996913865997117
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.4532295245907001
													}
												},
												{
													"time": 2.402472856560643,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.8509803921568627,
											1,
											0.5176470588235293
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
										"progress": 0.28,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl01v_A.png",
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
										"progress": 0.85,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.45,
										"shiftSpeedY": 0
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
														"color": -220594300
													},
													{
														"position": 0.71875,
														"color": -7812376
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
														"color": -8144688
													},
													{
														"position": 0.4921875,
														"color": -2884726
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
									"enabled": false,
									"props": {
										"USE_ALPHA": true,
										"gradient": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -220594300
													},
													{
														"position": 0.71875,
														"color": -1537912
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
											4,
											4
										],
										"alpha": 1,
										"MULTIPLY": false,
										"color": [
											1,
											1,
											1,
											1
										],
										"mask": "Fx/noise/T_Fire.png",
										"UVOffset": [
											0,
											0
										]
									}
								}
							]
						},
						{
							"type": "trails",
							"name": "Trails",
							"x": -0.16571,
							"z": 0.25028,
							"startWidth": 3.5,
							"endWidth": 2,
							"lifetime": 4,
							"minSpeed": 5,
							"uvMode": "ELifetime",
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
									"diffuseMap": "Fx/Gradients/T_Square02.jpg"
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
										"uScale": 1,
										"vScale": 0.4,
										"uOffset": 1,
										"vOffset": 0.3,
										"texture": "Fx/Alphas/T_Music_Partition_05.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 1.3602941176470589,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.018382701166021222,
														"dt": -0.49996913865997117
													},
													"nextHandle": {
														"dv": -0.01666666666666672,
														"dt": 0.4532295245907001
													}
												},
												{
													"time": 2.402472856560643,
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
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.6666666666666666,
											1,
											0.7686274509803921
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
										"progress": 0.28,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl01v_A.png",
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
										"progress": 0.75,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 1,
										"scaleY": 1,
										"shiftX": 0,
										"shiftY": 0,
										"shiftSpeedX": -0.45,
										"shiftSpeedY": 0
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
														"color": -72679484
													},
													{
														"position": 0.71875,
														"color": -7812376
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
														"color": -8144688
													},
													{
														"position": 0.4921875,
														"color": -2884726
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
					"name": "Pivot",
					"children": [
						{
							"type": "object",
							"name": "SkillDecalPlaceholder",
							"y": -8.85156,
							"children": [
								{
									"type": "object",
									"name": "Decals",
									"x": -0.004601111111111167,
									"y": -6.938893903907228e-18,
									"z": -0.17653444444444444,
									"children": [
										{
											"type": "object",
											"name": "Partition",
											"x": -1.8301332671555315e-16,
											"z": 0.5,
											"children": [
												{
													"type": "polygon",
													"name": "Ribbon",
													"x": -1.8301332671555315e-16,
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
																	0.6862745098039216
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
																"intensity": 5,
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
													"x": -1.8301332671555315e-16,
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
																	0.6862745098039216
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
																"intensity": 5,
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
																"progress": 0.9,
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_glow",
											"x": 0.004601111111111056,
											"y": 6.938893903907228e-18,
											"z": 0.17653444444444444,
											"scaleX": 24,
											"scaleY": 24,
											"scaleZ": 6,
											"albedoMap": "Fx/Alphas/glow (129).png",
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
																	"time": 0.5949737889442075,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.855,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.41,
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
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5705907717334981,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
															0.4784313725490196,
															0.611764705882353,
															0.19215686274509802
														]
													}
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
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "advancedDecal_glowIn",
											"z": 0.17653,
											"scaleX": 17,
											"scaleY": 17,
											"scaleZ": 6,
											"albedoMap": "Fx/Alphas/T_UI_InnerGradient_512.png",
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
																	"time": 0.5949737889442075,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.855,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.41,
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
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5705907717334981,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
															0.4784313725490196,
															0.611764705882353,
															0.19215686274509802
														]
													}
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
															1,
															1,
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
											"name": "advancedDecal_inside",
											"x": 0.004601111111111056,
											"y": 6.938893903907228e-18,
											"z": 0.17653444444444444,
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
														"alpha": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 0.5949737889442075,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.855,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.41,
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
																	"time": 1.3105645606777057,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.5705907717334981,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.987320023672922,
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
															0.5019607843137255,
															0.6235294117647059,
															0.24705882352941178
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
														"progress": 0.78,
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
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Gurney",
							"y": -8.85156,
							"children": [
								{
									"type": "model",
									"name": "Male01_AtreidesGurney",
									"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
									"scaleX": 0.9999999999999999,
									"scaleY": 0.9999999999999999,
									"scaleZ": 0.9999999999999999,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_Run.fbx",
											"loop": true
										}
									]
								},
								{
									"type": "model",
									"name": "GurneySet_Shield",
									"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
									"scaleY": 1.0000000000000002,
									"scaleZ": 1.0000000000000002,
									"rotationX": -90
								},
								{
									"type": "model",
									"name": "GurneySet_Javelin",
									"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
									"x": 0.04935,
									"scaleY": 1.0000000000000002,
									"scaleZ": 1.0000000000000002,
									"rotationX": -90
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Gurney.GurneySet_Shield",
									"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
								},
								{
									"type": "constraint",
									"name": "constraint",
									"object": "FXAnimation.FXRoot.Gurney.GurneySet_Javelin",
									"target": "FXAnimation.FXRoot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
								}
							]
						},
						{
							"type": "curve",
							"name": "rotation.z",
							"loop": true,
							"keys": [
								{
									"time": 0,
									"value": 0,
									"mode": 2
								},
								{
									"time": 30,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "NightEmissive",
							"source": "shaders/NightEmissive.hx",
							"props": {
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Passif",
					"target": "FXAnimation.FXRoot.Pivot.Gurney.Male01_AtreidesGurney.root.B_ROOTJ"
				}
			]
		}
	]
}