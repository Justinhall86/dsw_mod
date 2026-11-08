{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 30,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"enabled": false,
			"editorOnly": true,
			"locked": true,
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
			"scaleX": 2,
			"scaleY": 2,
			"scaleZ": 2,
			"children": [
				{
					"type": "object",
					"name": "Enemy",
					"z": 0.2399825,
					"children": [
						{
							"type": "object",
							"name": "Chara",
							"editorOnly": true,
							"x": -0.48151,
							"y": 0.24018,
							"z": -0.23998,
							"scaleX": 0.8,
							"scaleY": 0.8,
							"scaleZ": 0.8,
							"children": [
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"editorOnly": true,
									"y": 0.45861,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8
								},
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"editorOnly": true,
									"x": 1.13821,
									"y": -0.28692,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8
								},
								{
									"type": "model",
									"name": "Male01_HouseGuard",
									"source": "Character/Harkonnen/Unit/HouseGuard/Male01_HouseGuard.fbx",
									"editorOnly": true,
									"x": 0.25964,
									"y": -0.64928,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8
								}
							]
						},
						{
							"type": "object",
							"name": "FlashDecals",
							"z": 0.7199475,
							"scaleX": 0.7000000000000001,
							"scaleY": 0.7000000000000001,
							"scaleZ": 0.7000000000000001,
							"children": [
								{
									"type": "advancedDecal",
									"name": "advancedDecal_White",
									"z": 0.25,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 3,
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
															"time": 0.5345700741961202,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5797278201898565,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.6248855661835926,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.06763285024154592,
																"dt": -0.032952949779212815
															},
															"nextHandle": {
																"dv": -0.1487347482720912,
																"dt": 0.07246846277703266
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
													0.38823529411764707,
													0.2549019607843137,
													0.9803921568627451
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAtDOWN",
							"enabled": false,
							"z": -0.23998,
							"scaleY": 1.5000000000000002,
							"scaleZ": 1.5,
							"rotationZ": -3.636845535558253,
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
									"scaleX": 0.3751215045642074,
									"scaleY": 15,
									"scaleZ": 0.7499392354141005,
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
													"culling": "None",
													"colorMask": 255,
													"depthTest": "LessEqual",
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
													"enabled": false,
													"keys": [
														{
															"time": 0.4439958893019437,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5573408022825815,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.2953387653744293,
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
													"name": "alpha",
													"keys": [
														{
															"time": 0.4439958893019437,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5573408022825815,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9930927431144893,
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
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 12,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.38823529411764707,
													0.2549019607843137,
													0.9803921568627451
												]
											}
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.4602092491607748,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": -10.15619200616612,
														"dt": -0.25258960078446857
													},
													"nextHandle": {
														"dv": 1.0782508970964537,
														"dt": 0.02677310481625539
													}
												},
												{
													"time": 0.5471272353631567,
													"value": 2,
													"mode": 1,
													"prevHandle": {
														"dv": -0.6859430870012908,
														"dt": -0.07461635983805104
													},
													"nextHandle": {
														"dv": -0.6180235535074239,
														"dt": 0.0063056939880301865
													}
												},
												{
													"time": 0.614029746415166,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 1.9595362879724305e-17,
														"dt": -0.015493399073507545
													},
													"nextHandle": {
														"dv": -0.0028161802355345378,
														"dt": 0.016350542617711294
													}
												},
												{
													"time": 0.6609739062064581,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003072196620583223,
														"dt": -0.018694540934144216
													},
													"nextHandle": {
														"dv": -1.2647555766655998e-15,
														"dt": 0.5
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "position.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.46721400110706157,
													"value": 10,
													"mode": 0,
													"prevHandle": {
														"dv": 14.39636073134115,
														"dt": -0.05706043959792209
													},
													"nextHandle": {
														"dv": -6.256910104923487,
														"dt": 0.02419498391471564
													}
												},
												{
													"time": 0.6148641592675004,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.25537680978469357,
														"dt": -0.16158099134929055
													},
													"nextHandle": {
														"dv": 1.4423076923076792,
														"dt": 0.44823178326686186
													}
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
						},
						{
							"type": "object",
							"name": "Death",
							"z": -0.2399825,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_flare",
									"props": {
										"lifeTime": 0.1,
										"alignMode": "Screen",
										"alignLockAxis": "Z",
										"emitType": "Burst",
										"burstDelay": 0.15,
										"instStretch": [
											5,
											0.7,
											1
										],
										"instRotation_rand": [
											0,
											0,
											-20
										],
										"instStretch_rand": [
											1,
											0,
											0
										],
										"instScale_rand": 0.2,
										"useRandomColor": true,
										"randomColor1": [
											0.48627450980392156,
											0.48627450980392156,
											0.48627450980392156,
											1
										],
										"emitAngle": 109.09,
										"warmUpTime": -0.52,
										"instRotation": [
											0,
											0,
											-30
										],
										"instOffset": [
											0,
											0,
											0.5
										]
									},
									"z": 0.98664,
									"scaleX": 0.1,
									"scaleY": 0.1,
									"scaleZ": 0.1,
									"rotationZ": 89.99999999999999,
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
															"culling": "None",
															"colorMask": 255,
															"depthTest": "LessEqual",
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
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.49516908212560384,
																	"value": 1,
																	"mode": 0
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
															"name": "alpha",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.23027259684361548,
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.9882352941176471,
															0.9411764705882353,
															0.8666666666666667
														]
													}
												},
												{
													"type": "shader",
													"name": "DepthBlend",
													"source": "shaders/DepthBlend.hx",
													"props": {
														"REVERSE": false,
														"range": 5,
														"power": 0.8
													}
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															0.38823529411764707,
															0.2549019607843137,
															0.9803921568627451
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
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
																		"dt": 0.3333333333333333
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
												}
											]
										},
										{
											"type": "shader",
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.85,
												"ATTENUATE": true,
												"emissiveMap": null
											}
										},
										{
											"type": "curve",
											"name": "instStretch.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.122339506671671,
														"dt": -0.3379892151917322
													},
													"nextHandle": {
														"dv": 1.2799646653909236,
														"dt": 0.385398953113797
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.2799646653909236,
														"dt": -0.472615425165154
													},
													"nextHandle": {
														"dv": -0.9410191272333069,
														"dt": 0.3474841358008598
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
							"name": "emitter",
							"props": {
								"alignMode": "Screen",
								"emitSurface": true,
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"maxCount": 10,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"instScale": 0.5,
								"spriteSheet": "Fx/Alphas/T_ElectricArc_2x2_01.png",
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
								"instScale_rand": 0.2,
								"animationBlendBetweenFrames": false,
								"emitRate": 7
							},
							"z": 0.49508,
							"scaleX": 1.5,
							"scaleY": 1.5,
							"scaleZ": 1.01,
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
									"keys": [
										{
											"time": 0.4615133118519587,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5615133118519576,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0023001037545094262,
												"dt": -0.06821344567809023
											},
											"nextHandle": {
												"dv": 0.02102604183540535,
												"dt": 0.5701778429444498
											}
										},
										{
											"time": 1.2002016058715264,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4306458503969262,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.474243410172002,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.6206066465597557,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.6579759835098205,
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
		}
	]
}