{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
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
		},
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501423e-17,
					"children": [
						{
							"type": "model",
							"name": "male01_SmugglerBannerjee",
							"source": "Character/Vernius/Unit/Ctair/Male01_Ctair.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Ctair/Anim_Male01_Ctair_Skill.fbx"
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.9799973250317098,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9865807693434414,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "model",
									"name": "Atreide_Sword_01",
									"source": "Character/Vernius/Weapon/CtairSword/CtairSword.fbx",
									"y": 0.11864,
									"scaleY": 1.0000000000000002,
									"scaleZ": 1.0000000000000002,
									"rotationX": 90
								}
							]
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.male01_SmugglerBannerjee.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "model",
							"name": "male01_SmugglerBannerjee",
							"source": "Character/Vernius/Unit/Ctair/Male01_Ctair.fbx",
							"y": -1.5407439555097887e-33,
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Ctair/Anim_Male01_Ctair_Skill.fbx"
								},
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
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.7764705882352941,
											1,
											0.9098039215686274
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
										"bias": 0.05,
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
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.4
									}
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
									0,
									0,
									0
								]
							}
						}
					]
				},
				{
					"type": "object",
					"name": "flare",
					"enabled": false,
					"x": -0.91743,
					"y": 1.30138,
					"z": 2.15815,
					"scaleX": 0.65,
					"scaleY": 0.65,
					"scaleZ": 0.65,
					"children": [
						{
							"type": "emitter",
							"name": "emitter_FlarePurple",
							"props": {
								"lifeTime": 0.35,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instScale": 1.5,
								"instStretch": [
									15,
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
								"warmUpTime": -0.27
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
													0.403921568627451,
													0.3058823529411765,
													0.8352941176470589
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
						},
						{
							"type": "emitter",
							"name": "emitter_FlareWhite",
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
								"warmUpTime": -0.32,
								"emitType": "Burst",
								"instScale": 1.25
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
						},
						{
							"type": "emitter",
							"name": "emitter_FlareBlack",
							"props": {
								"lifeTime": 0.5,
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.5,
								"instStretch": [
									15,
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
								"warmUpTime": -0.22,
								"instScale": 1.5
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1.25,
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
						}
					]
				},
				{
					"type": "polygon",
					"name": "Slashtrail",
					"enabled": false,
					"x": 1.41102,
					"y": 0.06829,
					"z": 2.68912,
					"scaleX": 3.4,
					"scaleY": 3.4,
					"scaleZ": 3.4,
					"kind": 1,
					"args": [
						24,
						289.09,
						0.83,
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
									"emissive": 4
								}
							},
							"diffuseMap": "Fx/Alphas/T_Slash_2_blurry.png"
						},
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 2
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "scale",
									"keys": [
										{
											"time": 0.8492528587584949,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9658002426681382,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.105741750082757,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.2222891339924005,
											"value": 0,
											"mode": 2
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
								"wrap": true,
								"invert": false,
								"replace": false,
								"alpha": 2,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Gradients/T_Square02.jpg",
								"onDecal": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "UVTransform",
							"source": "shaders/UVTransform.hx",
							"props": {
								"scaleX": 0.6,
								"scaleY": 1,
								"shiftX": 1.5,
								"shiftY": 0,
								"shiftSpeedX": 0,
								"shiftSpeedY": 0
							},
							"isInstance": true,
							"children": [
								{
									"type": "curve",
									"name": "shiftX",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.88886207315932,
											"value": -1.3362179601533486,
											"mode": 2
										},
										{
											"time": 1.0592114016516332,
											"value": -0.04,
											"mode": 0,
											"prevHandle": {
												"dv": -0.013448718406133965,
												"dt": -0.2373971141832102
											},
											"nextHandle": {
												"dv": 0.01244469374354952,
												"dt": 0.18435874488141457
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "scaleX",
									"keys": [
										{
											"time": 1.025964334138856,
											"value": 1.9499772130470205,
											"mode": 2
										},
										{
											"time": 1.1781382471823343,
											"value": 26.15980177681118,
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
								"progress": 0.18,
								"saturation": 1,
								"width": 0.44,
								"uvScaleX": 1,
								"uvScaleY": 4,
								"texture": "Fx/Gradients/uGrad_uneaven.png",
								"uvShift": [
									0.1,
									0.5
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
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.2980392156862745,
									0.2784313725490196,
									0.27058823529411763
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
									0.403921568627451,
									0.3058823529411765,
									0.8352941176470589
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
											"time": 0.7403188097091231,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 3.1791830905865293e-16,
												"dt": -0.5000000000000001
											},
											"nextHandle": {
												"dv": 1.1102230246251565e-16,
												"dt": 0.23863920261753413
											}
										},
										{
											"time": 1.0308236590886524,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.1557719814024285,
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
								"sandBlend": 0,
								"sandColorSet": false,
								"envBlend": 0.8,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "object",
					"name": "DecalsHand_LEFT",
					"y": -0.09142,
					"scaleX": 0.8,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"rotationZ": 90,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_White",
							"x": -0.83458,
							"y": 0.06401,
							"z": -0.02531,
							"scaleX": 2.75,
							"scaleY": 0.97,
							"scaleZ": 0.77,
							"rotationX": -86.3,
							"rotationY": 0.9,
							"rotationZ": -3.4,
							"albedoMap": "Fx/Gradients/circGrad05.jpg",
							"emissive": 1,
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
											"colorMask": 255,
											"emissive": 3
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
														"dt": 0.18732814496238237
													}
												},
												{
													"time": 0.6382724612835653,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9642560624807053,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.07603713736073055
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.32683082656309065
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
											0.396078431372549,
											0.23529411764705882,
											0.8549019607843137
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "emitter",
							"props": {
								"alignMode": "Screen",
								"lifeTime": 0.4,
								"lifeTimeRand": 0.05,
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationLoop": false,
								"instScale": 0.6,
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
								"instScale_rand": 0.1,
								"animationBlendBetweenFrames": false,
								"emitSurface": true,
								"emitRate": 7,
								"warmUpTime": -0.25,
								"emitType": "Burst",
								"burstCount": 2,
								"burstDelay": 0.2,
								"burstParticleCount": 3
							},
							"x": -0.65537,
							"y": -0.01553,
							"z": -0.03023,
							"scaleX": 1.85,
							"scaleY": 0.25,
							"scaleZ": 0.25,
							"rotationX": -90,
							"rotationZ": 0.6,
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
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.DecalsHand_LEFT",
					"target": "FXAnimation.FXRoot.Chara.male01_SmugglerBannerjee.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
				},
				{
					"type": "object",
					"name": "Tornado",
					"enabled": false,
					"z": 2.17706,
					"scaleX": 1.2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"children": [
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"enabled": false,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.22,
										"saturation": 0.5,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.2450854847579627,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.35,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.7469213676296763,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.5395884080366664,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 2.0772420421447406,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
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
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.9837212314231552,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.28832330233069,
													"value": -0.014914336029688502,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.0151533897427045,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.009584678049055162,
														"dt": -2.251821930745909
													},
													"nextHandle": {
														"dv": -0.0032660472019664325,
														"dt": 0.48155273981546975
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
										"range": 2,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 1.042554176746881,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1776873305287847,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.045044384593967944
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3771380493252639
													}
												},
												{
													"time": 2.1,
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
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"enabled": false,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.22,
										"saturation": 0.5,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.2450854847579627,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.35,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.7469213676296763,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.5395884080366664,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 2.0772420421447406,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"texture": "Fx/Alphas/T_Wave.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6655013313286051,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.16149999627870323,
														"dt": -0.5013320256746407
													},
													"nextHandle": {
														"dv": 0.10659294775387884,
														"dt": 0.33105719216650986
													}
												},
												{
													"time": 1.0648451889166217,
													"value": 1,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.9837212314231552,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.28832330233069,
													"value": -0.014914336029688502,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.956391127990995,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0007442731918721468,
														"dt": -0.7338927659453209
													},
													"nextHandle": {
														"dv": -1.5119282697350795e-16,
														"dt": 0.4815594802394449
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
										"range": 2,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.22,
										"saturation": 0.5,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.2450854847579627,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.35,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.7469213676296763,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.5395884080366664,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 2.0772420421447406,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"texture": "Fx/Alphas/T_Wave.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.8575575778265931,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.8181222043870895,
														"dt": -0.4501626227043787
													},
													"nextHandle": {
														"dv": 0.1742460963956094,
														"dt": 0.0983726115211403
													}
												},
												{
													"time": 1.0515232082825068,
													"value": 1,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.9837212314231552,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.28832330233069,
													"value": -0.014914336029688502,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.956391127990995,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0007442731918721468,
														"dt": -0.7338927659453209
													},
													"nextHandle": {
														"dv": -1.5119282697350795e-16,
														"dt": 0.4815594802394449
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
										"range": 2,
										"power": 0.8
									}
								}
							]
						},
						{
							"type": "model",
							"name": "spiraleSand",
							"source": "Fx/Meshes_Common/Spirale02_mirrorBig.fbx",
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 0.76,
							"rotationZ": -132,
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.32,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/Cyl03v_A.jpg",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.22,
										"saturation": 0.5,
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
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.5,
										"scaleY": 0.75,
										"shiftX": 0,
										"shiftY": 1,
										"shiftSpeedX": -1,
										"shiftSpeedY": 0
									},
									"children": [
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.2450854847579627,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 1.35,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keys": [
												{
													"time": 0.7469213676296763,
													"value": -0.4948720932006838,
													"mode": 2
												},
												{
													"time": 1.5395884080366664,
													"value": 0.85,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftY",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5073329595930102,
													"value": -0.4948720932006838,
													"mode": 0,
													"prevHandle": {
														"dv": 5.71953178782954e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 5.551115123125783e-17,
														"dt": 0.5567216291312178
													}
												},
												{
													"time": 2.0772420421447406,
													"value": 0.85,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00884912545066785,
														"dt": -0.570995442864431
													},
													"nextHandle": {
														"dv": 0.015494864233032216,
														"dt": 0.49998142196294887
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
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
										"progress": 0.4,
										"saturation": 0.5,
										"width": 0.65,
										"uvScaleX": 0.2,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.15,
											0.15
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 0.9837212314231552,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": -0.22616915345191968,
														"dt": -0.039999999999999925
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.49344094974729225
													}
												},
												{
													"time": 2.28832330233069,
													"value": -0.014914336029688502,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015162908296849964,
														"dt": -1.1299093125850823
													},
													"nextHandle": {
														"dv": -0.0064241497665561455,
														"dt": 0.4815334017558196
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.952848667186836,
													"value": 0.8948601617813111,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": -0.006957521412106371
													}
												},
												{
													"time": 4.0151533897427045,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.009584678049055162,
														"dt": -2.251821930745909
													},
													"nextHandle": {
														"dv": -0.0032660472019664325,
														"dt": 0.48155273981546975
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
										"range": 2,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 1.042554176746881,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.1776873305287847,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.045044384593967944
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3771380493252639
													}
												},
												{
													"time": 2.1,
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
					"type": "emitter",
					"name": "Debris",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"lifeTimeRand": 1,
						"burstParticleCount": 15,
						"emitSurface": true,
						"alignMode": "Screen",
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"animationSpeed": 0,
						"instSpeed": [
							0,
							0,
							12
						],
						"instSpeed_rand": [
							0,
							0,
							2.5
						],
						"instAcceleration_rand": [
							0,
							0,
							0
						],
						"instScale_rand": 0.12,
						"spriteSheet": "Fx/Alphas/T_Sparks_4x4.jpg",
						"lifeTime": 2,
						"emitShape": "Cylinder",
						"emitRad2": 0.55,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"emitAngle": 360,
						"warmUpTime": -0.95,
						"useRandomColor": true,
						"randomColor1": [
							0.09411764705882353,
							0.08235294117647059,
							0.0784313725490196,
							1
						],
						"randomColor2": [
							0.5333333333333333,
							0.4235294117647059,
							0.34901960784313724,
							1
						],
						"instScale": 0.8,
						"instOrbitSpeed": [
							0,
							0,
							-5
						],
						"instOrbitSpeed_rand": [
							0,
							0,
							-1
						],
						"seedGroup": 1,
						"emitRad1": 0.73
					},
					"z": -0.26559,
					"scaleX": 13,
					"scaleY": 13,
					"scaleZ": 0.26,
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
											"colorMask": 255,
											"emissive": 3
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
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.065,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.11089160652646488,
														"dt": -0.015692208470726162
													},
													"nextHandle": {
														"dv": -0.8833333333333333,
														"dt": 0.12500000000000003
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.01666666666666672,
														"dt": -0.8384636488340191
													},
													"nextHandle": {
														"dv": 0.006154423696995358,
														"dt": 0.30991955512506614
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
									"enabled": false,
									"props": {
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.7,
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
									"value": 1,
									"mode": 2
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.06666666666666667,
										"dt": -0.56
									},
									"nextHandle": {
										"dv": 0.03967621425974007,
										"dt": 0.3332801997818148
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
									"mode": 2
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.013194444444444398,
										"dt": -0.8841852909175679
									},
									"nextHandle": {
										"dv": -0.006407488794313876,
										"dt": 0.33335250704975594
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
										"dv": 2.844272778839864,
										"dt": -0.2607250047269874
									},
									"nextHandle": {
										"dv": -1.2,
										"dt": 0.11
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.835
									},
									"nextHandle": {
										"dv": -5.442874662877125e-16,
										"dt": 0.33333333333333326
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "FlashDecals",
					"enabled": false,
					"x": -0.49074,
					"y": 1.56092,
					"z": 1.67602,
					"scaleX": 2,
					"scaleY": 1.2,
					"scaleZ": 1.2,
					"rotationZ": 90,
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Black",
							"x": -0.62428,
							"z": 0.33459,
							"scaleX": 3,
							"scaleY": 3.5,
							"scaleZ": 2,
							"rotationY": 90,
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
													"time": 0.20071615996865338,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.23893580416777283,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.2807217560974785,
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
							"x": -0.29235,
							"z": 0.54481,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 2.97,
							"rotationY": 89.99999999999999,
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
													"time": 0.3826755867991314,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.48130508859070903,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2018369756545146,
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
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											1,
											0.2588235294117647,
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
							"x": -0.29235,
							"z": 0.54481,
							"scaleX": 3.5,
							"scaleY": 3.5,
							"scaleZ": 2.6,
							"rotationY": 89.99999999999999,
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
													"time": 0.27497711502313127,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.3068247246074432,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.4546062153623312,
													"value": 0,
													"mode": 0,
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
					"type": "object",
					"name": "SANDFLOOR_Circle",
					"enabled": false,
					"z": 0.2,
					"children": [
						{
							"type": "object",
							"name": "SANDFLOOR_circle",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"rotationZ": -115.9,
							"children": [
								{
									"type": "object",
									"name": "FrontHit",
									"x": -0.17544,
									"y": -1.39107,
									"z": -0.04382,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": 6.3,
									"rotationZ": -35.9,
									"children": [
										{
											"type": "model",
											"name": "Sand",
											"source": "Fx/Meshes_Common/HalfCylinder_BottomPiv.fbx",
											"x": -0.75423,
											"y": 0.15486,
											"z": -0.05371,
											"scaleX": 2,
											"scaleY": 1.7,
											"scaleZ": 2.63,
											"rotationZ": -105.2,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_01_180.png"
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
														"progress": 0.4,
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
															0.15,
															0.15
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
																	"time": 1.0070651287938985,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.006957521412106371
																	}
																},
																{
																	"time": 1.0379376930302169,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.49344094974729225
																	}
																},
																{
																	"time": 2.3425397639377517,
																	"value": -0.014914336029688502,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015162908296849964,
																		"dt": -1.1299093125850823
																	},
																	"nextHandle": {
																		"dv": -0.0064241497665561455,
																		"dt": 0.4815334017558196
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.5,
														"envColorSet": false
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.0850953433710437,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1350785933343468,
																"dt": -0.1698906225913934
															},
															"nextHandle": {
																"dv": 0.9763246708157084,
																"dt": 0.14377171310896975
															}
														},
														{
															"time": 2.476345073672267,
															"value": 0.8743206007304851,
															"mode": 2
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/T_Square02.jpg",
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
														"progress": 0.72,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
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
									"type": "object",
									"name": "Distort",
									"x": 1.10329,
									"y": -1.94579,
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.3,
									"rotationX": -167.1,
									"rotationY": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
											"scaleY": 4,
											"scaleZ": 7,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
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
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.0317540103527463,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -1.124604999922227,
																		"dt": 0.06682227758749892
																	}
																},
																{
																	"time": 1.5317540103527434,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.027656293032379653,
																		"dt": -0.28596902410700986
																	},
																	"nextHandle": {
																		"dv": 0.027656293032379653,
																		"dt": 0.28596902410700986
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/noise/causticTexture_02.png",
														"intensity": 0.15
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 1.0372332265813196,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.037233226581317,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 1.0372332265813196,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.523565502801232,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5383533232601083,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 1.0317540103527463,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0.7871018058682482,
																		"dt": 0.06863200598878672
																	}
																},
																{
																	"time": 1.5317540103527434,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016418796802560642,
																		"dt": -0.40563803898909634
																	},
																	"nextHandle": {
																		"dv": -0.007231640352717618,
																		"dt": 0.16666332862669664
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
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 1.0317540103527463,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7871018058682482,
																"dt": 0.06863200598878672
															}
														},
														{
															"time": 1.5317540103527434,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016418796802560642,
																"dt": -0.40563803898909634
															},
															"nextHandle": {
																"dv": -0.007231640352717618,
																"dt": 0.16666332862669664
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationZ": -126.9,
									"kind": 1,
									"args": [
										24,
										256.36,
										0.95,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
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
												"progress": 0.28,
												"saturation": 0,
												"width": 0.83,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad.png",
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
															"time": 0.9455493249902301,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.09625856167782959,
																"dt": -0.49997500187484384
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.17313611491108072
															}
														},
														{
															"time": 1.1602381074799684,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.4095541129519225,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.1696733926128592
															},
															"nextHandle": {
																"dv": 0.016325680692641273,
																"dt": 0.08310100889504159
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
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SANDFLOOR_circle",
							"scaleX": 1.9999999999999998,
							"scaleY": 1.9999999999999998,
							"scaleZ": 2,
							"rotationZ": -11.199999999999998,
							"children": [
								{
									"type": "object",
									"name": "FrontHit",
									"x": -0.17544,
									"y": -1.39107,
									"z": -0.04382,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": 6.3,
									"rotationZ": -35.9,
									"children": [
										{
											"type": "model",
											"name": "Sand",
											"source": "Fx/Meshes_Common/HalfCylinder_BottomPiv.fbx",
											"x": -0.75423,
											"y": 0.15486,
											"z": -0.05371,
											"scaleX": 2,
											"scaleY": 1.7,
											"scaleZ": 2.63,
											"rotationZ": -105.2,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_01_180.png"
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
														"progress": 0.4,
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
															0.15,
															0.15
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
																	"time": 0.9401540308477924,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.006957521412106371
																	}
																},
																{
																	"time": 0.9710265950841115,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.49344094974729225
																	}
																},
																{
																	"time": 2.275628665991647,
																	"value": -0.014914336029688502,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015162908296849964,
																		"dt": -1.1299093125850823
																	},
																	"nextHandle": {
																		"dv": -0.0064241497665561455,
																		"dt": 0.4815334017558196
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.5,
														"envColorSet": false
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 1.018184245424939,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1350785933343468,
																"dt": -0.1698906225913934
															},
															"nextHandle": {
																"dv": 0.9763246708157084,
																"dt": 0.14377171310896975
															}
														},
														{
															"time": 2.4094339757261625,
															"value": 0.8743206007304851,
															"mode": 2
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/T_Square02.jpg",
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
														"progress": 0.72,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
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
									"type": "object",
									"name": "Distort",
									"x": 1.10329,
									"y": -1.94579,
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.3,
									"rotationX": -167.1,
									"rotationY": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
											"scaleY": 4,
											"scaleZ": 7,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
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
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.9648429124066407,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -1.124604999922227,
																		"dt": 0.06682227758749892
																	}
																},
																{
																	"time": 1.4648429124066387,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.027656293032379653,
																		"dt": -0.28596902410700986
																	},
																	"nextHandle": {
																		"dv": 0.027656293032379653,
																		"dt": 0.28596902410700986
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/noise/causticTexture_02.png",
														"intensity": 0.15
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9703221286352142,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.9703221286352122,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9703221286352142,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.4566544048551273,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.4714422253140036,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.9648429124066407,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0.7871018058682482,
																		"dt": 0.06863200598878672
																	}
																},
																{
																	"time": 1.4648429124066387,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016418796802560642,
																		"dt": -0.40563803898909634
																	},
																	"nextHandle": {
																		"dv": -0.007231640352717618,
																		"dt": 0.16666332862669664
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
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.9648429124066407,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7871018058682482,
																"dt": 0.06863200598878672
															}
														},
														{
															"time": 1.4648429124066387,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016418796802560642,
																"dt": -0.40563803898909634
															},
															"nextHandle": {
																"dv": -0.007231640352717618,
																"dt": 0.16666332862669664
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationZ": -126.9,
									"kind": 1,
									"args": [
										24,
										256.36,
										0.95,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
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
												"progress": 0.28,
												"saturation": 0,
												"width": 0.83,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad.png",
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
															"time": 0.8786382270441239,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.09625856167782959,
																"dt": -0.49997500187484384
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.17313611491108072
															}
														},
														{
															"time": 1.0933270095338636,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.3426430150058177,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.1696733926128592
															},
															"nextHandle": {
																"dv": 0.016325680692641273,
																"dt": 0.08310100889504159
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
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SANDFLOOR_circle",
							"scaleX": 1.9999999999999998,
							"scaleY": 1.9999999999999998,
							"scaleZ": 2,
							"rotationZ": 72.9,
							"children": [
								{
									"type": "object",
									"name": "FrontHit",
									"x": -0.17544,
									"y": -1.39107,
									"z": -0.04382,
									"scaleX": 1.25,
									"scaleY": 1.25,
									"scaleZ": 1.25,
									"rotationX": 6.3,
									"rotationZ": -35.9,
									"children": [
										{
											"type": "model",
											"name": "Sand",
											"source": "Fx/Meshes_Common/HalfCylinder_BottomPiv.fbx",
											"x": -0.75423,
											"y": 0.15486,
											"z": -0.05371,
											"scaleX": 2,
											"scaleY": 1.7,
											"scaleZ": 2.63,
											"rotationZ": -105.2,
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
														"alpha": 2,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/T_JetSand_01_180.png"
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
														"progress": 0.4,
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
															0.15,
															0.15
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
																	"time": 0.8771079799902947,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": -0.006957521412106371
																	}
																},
																{
																	"time": 0.9079805442266138,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.49344094974729225
																	}
																},
																{
																	"time": 2.2125826151341492,
																	"value": -0.014914336029688502,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.015162908296849964,
																		"dt": -1.1299093125850823
																	},
																	"nextHandle": {
																		"dv": -0.0064241497665561455,
																		"dt": 0.4815334017558196
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
														"sandBlend": 0.6,
														"sandColorSet": false,
														"envBlend": 0.5,
														"envColorSet": false
													}
												},
												{
													"type": "curve",
													"name": "scale.z",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.9551381945674412,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -1.1350785933343468,
																"dt": -0.1698906225913934
															},
															"nextHandle": {
																"dv": 0.9763246708157084,
																"dt": 0.14377171310896975
															}
														},
														{
															"time": 2.3463879248686648,
															"value": 0.8743206007304851,
															"mode": 2
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
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/T_Square02.jpg",
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
														"progress": 0.72,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
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
									"type": "object",
									"name": "Distort",
									"x": 1.10329,
									"y": -1.94579,
									"scaleX": 0.5,
									"scaleY": 0.2,
									"scaleZ": 0.3,
									"rotationX": -167.1,
									"rotationY": 90,
									"children": [
										{
											"type": "model",
											"name": "PlanePivBot_NoVrtx",
											"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
											"scaleY": 4,
											"scaleZ": 7,
											"children": [
												{
													"type": "material",
													"name": "material",
													"props": {
														"PBR": {
															"mode": "Distortion",
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
														"texture": "Fx/Gradients/Cyl05v_A_Tapered.png"
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.901796861549143,
																	"value": 1,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -1.124604999922227,
																		"dt": 0.06682227758749892
																	}
																},
																{
																	"time": 1.401796861549141,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.027656293032379653,
																		"dt": -0.28596902410700986
																	},
																	"nextHandle": {
																		"dv": 0.027656293032379653,
																		"dt": 0.28596902410700986
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/noise/causticTexture_02.png",
														"intensity": 0.15
													},
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9072760777777165,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.9072760777777145,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keys": [
																{
																	"time": 0.9072760777777165,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.3936083539976296,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.408396174456506,
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
														"useScale": false,
														"wrap": true,
														"progress": 0.7,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad.png",
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0.901796861549143,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0.7871018058682482,
																		"dt": 0.06863200598878672
																	}
																},
																{
																	"time": 1.401796861549141,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.016418796802560642,
																		"dt": -0.40563803898909634
																	},
																	"nextHandle": {
																		"dv": -0.007231640352717618,
																		"dt": 0.16666332862669664
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
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/Cyl01u_A.jpg",
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
													"type": "curve",
													"name": "scale.z",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.901796861549143,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0.7871018058682482,
																"dt": 0.06863200598878672
															}
														},
														{
															"time": 1.401796861549141,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.016418796802560642,
																"dt": -0.40563803898909634
															},
															"nextHandle": {
																"dv": -0.007231640352717618,
																"dt": 0.16666332862669664
															}
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2,
									"rotationZ": -126.9,
									"kind": 1,
									"args": [
										24,
										256.36,
										0.95,
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
												"alpha": 2,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
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
												"progress": 0.28,
												"saturation": 0,
												"width": 0.83,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Cyl05v_A01.png",
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/uGrad.png",
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
															"time": 0.8155921761866262,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.09625856167782959,
																"dt": -0.49997500187484384
															},
															"nextHandle": {
																"dv": -0.03333333333333333,
																"dt": 0.17313611491108072
															}
														},
														{
															"time": 1.030280958676366,
															"value": 0.5,
															"mode": 2
														},
														{
															"time": 1.27959696414832,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.033333333333333326,
																"dt": -0.1696733926128592
															},
															"nextHandle": {
																"dv": 0.016325680692641273,
																"dt": 0.08310100889504159
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
												"sandBlend": 0.6,
												"sandColorSet": false,
												"envBlend": 0.5,
												"envColorSet": false
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