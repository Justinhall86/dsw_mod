{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 20,
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
			"scaleX": 0.91,
			"scaleY": 0.91,
			"scaleZ": 0.91,
			"children": [
				{
					"type": "object",
					"name": "Chara",
					"editorOnly": true,
					"y": -1.0092936587501422e-17,
					"scaleX": 0.9999999999999999,
					"scaleY": 0.9999999999999999,
					"scaleZ": 0.9999999999999999,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Ecaz/Unit/WhitmoreBludd/Male01_WhitmoreBludd.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"enabled": false,
									"animation": "Anim/Male01/Duncan/Anim_Male01_AltDuncan_AttackMelee01.fbx"
								},
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Duncan/Anim_Male01_AltDuncan_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"y": -0.28272,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90,
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 0.65,
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
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Ecaz/Weapon/SwordWhitmore/SwordWhitmore.fbx",
							"x": -0.07328,
							"y": -0.02477,
							"z": 0.34657,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Chara.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.Chara.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ.B_lFinger1J1"
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
					"name": "Slash",
					"x": 2.96178,
					"y": -0.27319,
					"z": 3.14225,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"children": [
						{
							"type": "object",
							"name": "flare",
							"x": 4.9816,
							"y": 0.32824,
							"z": 0.42599,
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
										"instScale": 2,
										"instStretch": [
											15,
											6,
											1
										],
										"instRotation_rand": [
											0,
											0,
											80
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
										"warmUpTime": -0.75,
										"instRotation": [
											0,
											0,
											90
										]
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
															0.17254901960784313,
															0.08627450980392157,
															0.11372549019607843
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
															0.17254901960784313,
															0.08627450980392157,
															0.11372549019607843
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
											50,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											5
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
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"instScale": 1.25,
										"instRotation": [
											0,
											0,
											35
										]
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
											50,
											4,
											1
										],
										"instRotation_rand": [
											0,
											0,
											5
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
										"warmUpTime": -0.8,
										"emitType": "Burst",
										"instScale": 1.25,
										"instRotation": [
											0,
											0,
											-35
										]
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
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.85,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "object",
							"name": "SlashR",
							"x": -0.47523,
							"y": 1.9633,
							"z": -1.33156,
							"rotationY": -9.1,
							"children": [
								{
									"type": "polygon",
									"name": "SlashBeforeStraight",
									"x": 1.2938666666666667,
									"y": -1.4278933333333337,
									"z": 0.9053433333333336,
									"scaleX": 3.9999999999999996,
									"scaleY": 3.999999999999997,
									"scaleZ": 3.9999999999999987,
									"rotationX": 144.59999999999994,
									"rotationY": 10.09999999999999,
									"rotationZ": 0.19999999999999943,
									"kind": 1,
									"args": [
										24,
										360,
										0.9,
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
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.75
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.09027812282600323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4254068485116922,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.7755575615628914e-16,
																"dt": -0.720273286813528
															},
															"nextHandle": {
																"dv": -1.717718080690268e-16,
																"dt": 0.1532720149674032
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
												"scaleX": 0.75,
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
															"time": 0.09552925773423099,
															"value": -4.4678653320955775,
															"mode": 0,
															"prevHandle": {
																"dv": -7.060198937350438,
																"dt": -0.36950586998021634
															},
															"nextHandle": {
																"dv": 4.159990515012931,
																"dt": 0.21549818092969203
															}
														},
														{
															"time": 1.2704508846422364,
															"value": -0.07079902046471076,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10022073162635614,
																"dt": -1.0278901750669371
															},
															"nextHandle": {
																"dv": -0.03236836779593402,
																"dt": 0.33169812692914263
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
															"time": -0.12215068643081772,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.7881047227397063,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
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
												"texture": "Fx/Gradients/uGrad_inv.png",
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
															"time": 0.3058607298959665,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.5779373717045784,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": -0.009625771604938271,
																"dt": -0.22934609866138123
															},
															"nextHandle": {
																"dv": 0.5775462962962963,
																"dt": 0.24189056417047677
															}
														},
														{
															"time": 1.405340267906142,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.5939735874966533
															},
															"nextHandle": {
																"dv": 0.004300720265366772,
																"dt": 0.15327085469037743
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
									"name": "SlashThinok",
									"x": 1.2938666666666667,
									"y": -1.4278933333333337,
									"z": 0.9053433333333336,
									"scaleX": 3.9999999999999996,
									"scaleY": 3.999999999999997,
									"scaleZ": 3.9999999999999987,
									"rotationX": 144.59999999999994,
									"rotationY": 10.09999999999999,
									"rotationZ": 0.19999999999999943,
									"kind": 1,
									"args": [
										24,
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
													"emissive": 25,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
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
												"scaleX": 2,
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
															"time": 0.4550663840347309,
															"value": -1.7854762973785405,
															"mode": 2
														},
														{
															"time": 1.3632687328734752,
															"value": 0.8347915420532234,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
															"time": 0.36220776997558235,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.010865299582629162,
																"dt": 0.424712000299571
															}
														},
														{
															"time": 0.7636358748964951,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.1251203777147647,
																"dt": -0.028002118162695933
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.4959175471263775,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04715950531536345,
																"dt": -0.6125145314162203
															},
															"nextHandle": {
																"dv": -0.04715950531536345,
																"dt": 0.6125145314162203
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
												]
											}
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
									"name": "flareFloor",
									"x": -2.58773,
									"y": 3.82531,
									"z": -1.81069,
									"scaleX": 0.49999999999999994,
									"scaleY": 0.49999999999999994,
									"scaleZ": 0.49999999999999994,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													50,
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
												"warmUpTime": -0.78,
												"emitType": "Burst",
												"instScale": 1.25,
												"instRotation": [
													0,
													90,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationY": -44.4,
											"rotationZ": -20.9,
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
									"name": "SlashDistort",
									"x": 1.2938666666666667,
									"y": -1.4278933333333337,
									"z": 0.9053433333333336,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": 144.59999999999994,
									"rotationY": 10.09999999999999,
									"rotationZ": 0.19999999999999943,
									"kind": 1,
									"args": [
										24,
										360,
										0.7,
										4
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
													"culling": "None",
													"colorMask": 255,
													"emissive": 15,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
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
												"scaleX": 1.5,
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
															"time": 0.4550663840347309,
															"value": -1.523449513435364,
															"mode": 2
														},
														{
															"time": 1.3632687328734752,
															"value": 0.8347915420532234,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
															"time": 0.36220776997558235,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.06470170475285186,
																"dt": 0.35887023226196824
															}
														},
														{
															"time": 0.7636358748964951,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9938563336480422,
																"dt": -0.06563236873054612
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.4959175471263775,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.010306320428132454,
																"dt": -0.734459176763524
															},
															"nextHandle": {
																"dv": -0.010306320428132454,
																"dt": 0.734459176763524
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
												]
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SlashL",
							"x": -0.47523,
							"y": 1.32811,
							"z": -1.33156,
							"rotationY": -9.1,
							"children": [
								{
									"type": "polygon",
									"name": "SlashBeforeStraight",
									"x": 1.29387,
									"y": -1.42789,
									"z": 0.90534,
									"scaleX": 3.9999999999999996,
									"scaleY": 3.999999999999997,
									"scaleZ": 3.9999999999999987,
									"rotationX": 36.1,
									"rotationY": 10.1,
									"rotationZ": 0.2,
									"kind": 1,
									"args": [
										24,
										360,
										0.9,
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
													"emissive": 1
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.75
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.09027812282600323,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4254068485116922,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -2.7755575615628914e-16,
																"dt": -0.720273286813528
															},
															"nextHandle": {
																"dv": -1.717718080690268e-16,
																"dt": 0.1532720149674032
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
												"scaleX": 0.75,
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
															"time": 0.09552925773423099,
															"value": -4.4678653320955775,
															"mode": 0,
															"prevHandle": {
																"dv": -7.060198937350438,
																"dt": -0.36950586998021634
															},
															"nextHandle": {
																"dv": 4.159990515012931,
																"dt": 0.21549818092969203
															}
														},
														{
															"time": 1.2704508846422364,
															"value": -0.07079902046471076,
															"mode": 0,
															"prevHandle": {
																"dv": 0.10022073162635614,
																"dt": -1.0278901750669371
															},
															"nextHandle": {
																"dv": -0.03236836779593402,
																"dt": 0.33169812692914263
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
															"time": -0.12215068643081772,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.7881047227397063,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
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
												"texture": "Fx/Gradients/uGrad_inv.png",
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
															"time": 0.3058607298959665,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.5779373717045784,
															"value": 0.5,
															"mode": 1,
															"prevHandle": {
																"dv": -0.009625771604938271,
																"dt": -0.22934609866138123
															},
															"nextHandle": {
																"dv": 0.5775462962962963,
																"dt": 0.24189056417047677
															}
														},
														{
															"time": 1.405340267906142,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666607,
																"dt": -0.5939735874966533
															},
															"nextHandle": {
																"dv": 0.004300720265366772,
																"dt": 0.15327085469037743
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
									"name": "SlashThinok",
									"x": 1.29387,
									"y": -1.42789,
									"z": 0.90534,
									"scaleX": 3.9999999999999996,
									"scaleY": 3.999999999999997,
									"scaleZ": 3.9999999999999987,
									"rotationX": 36.1,
									"rotationY": 10.1,
									"rotationZ": 0.2,
									"kind": 1,
									"args": [
										24,
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
													"emissive": 25,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
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
												"scaleX": 2,
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
															"time": 0.4550663840347309,
															"value": -1.7854762973785405,
															"mode": 2
														},
														{
															"time": 1.3632687328734752,
															"value": 0.8347915420532234,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
															"time": 0.36220776997558235,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.010865299582629162,
																"dt": 0.424712000299571
															}
														},
														{
															"time": 0.7636358748964951,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -1.1251203777147647,
																"dt": -0.028002118162695933
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.4959175471263775,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04715950531536345,
																"dt": -0.6125145314162203
															},
															"nextHandle": {
																"dv": -0.04715950531536345,
																"dt": 0.6125145314162203
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
												]
											}
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
									"name": "flareFloor",
									"x": -4.03664,
									"y": -6.15459,
									"z": -1.81069,
									"scaleX": 0.49999999999999994,
									"scaleY": 0.49999999999999994,
									"scaleZ": 0.49999999999999994,
									"rotationZ": 29,
									"children": [
										{
											"type": "emitter",
											"name": "emitter_Flare",
											"props": {
												"lifeTime": 0.2,
												"alignLockAxis": "Z",
												"burstDelay": 0.45,
												"instStretch": [
													50,
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
												"warmUpTime": -0.78,
												"emitType": "Burst",
												"instScale": 1.25,
												"instRotation": [
													0,
													90,
													0
												]
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -5.3,
											"rotationY": 36.3,
											"rotationZ": 160.4,
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
									"name": "SlashDistort",
									"x": 1.29387,
									"y": -1.42789,
									"z": 0.90534,
									"scaleX": 5,
									"scaleY": 5,
									"scaleZ": 5,
									"rotationX": 36.1,
									"rotationY": 10.1,
									"rotationZ": 0.2,
									"kind": 1,
									"args": [
										24,
										360,
										0.7,
										4
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
													"culling": "None",
													"colorMask": 255,
													"emissive": 15,
													"drawOrder": "100"
												}
											},
											"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
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
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
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
												"scaleX": 1.5,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4233309385838544,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.3315332874225987,
															"value": 1.067704238891602,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "shiftX",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.4550663840347309,
															"value": -1.523449513435364,
															"mode": 2
														},
														{
															"time": 1.3632687328734752,
															"value": 0.8347915420532234,
															"mode": 0,
															"prevHandle": {
																"dv": 2.220446049250313e-16,
																"dt": -0.5599999999999999
															},
															"nextHandle": {
																"dv": -9.460471999616726e-16,
																"dt": 0.3316719842180907
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
												"useSourceUVs": false,
												"useScale": false,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/vGrad.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													1,
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
													"keyMode": 1,
													"keys": [
														{
															"time": 0.3304723245247059,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.03472222222222221,
																"dt": 0.36
															}
														},
														{
															"time": 0.7319004294456186,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.464182101675501,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.04715950531536345,
																"dt": -0.6125145314162203
															},
															"nextHandle": {
																"dv": -0.04715950531536345,
																"dt": 0.6125145314162203
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "progress",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.36220776997558235,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.04818175693045633,
																"dt": -0.49954845585497076
															},
															"nextHandle": {
																"dv": -0.06470170475285186,
																"dt": 0.35887023226196824
															}
														},
														{
															"time": 0.7636358748964951,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9938563336480422,
																"dt": -0.06563236873054612
															},
															"nextHandle": {
																"dv": -1.0069444444444446,
																"dt": 0.05500000000000005
															}
														},
														{
															"time": 1.4959175471263775,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.010306320428132454,
																"dt": -0.734459176763524
															},
															"nextHandle": {
																"dv": -0.010306320428132454,
																"dt": 0.734459176763524
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
													0.4588235294117647,
													0.15294117647058825,
													0.24705882352941178
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
					"name": "SlashTrail01",
					"x": 2.31899,
					"y": -0.27319,
					"z": 3.14225,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": 0.30047,
							"y": 0.01193,
							"z": -1.48606,
							"scaleX": 3.5,
							"scaleY": 3.75,
							"scaleZ": 3.75,
							"rotationX": 90,
							"rotationY": -91.3,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.54,
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
										"scale": 1
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.5968611915766907,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.4767138088567073
													},
													"nextHandle": {
														"dv": -1.1029378149807987e-15,
														"dt": 0.2094324853212485
													}
												},
												{
													"time": 0.7635172385753768,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.7792212432851228,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.7936229939160802,
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
											"name": "scaleX",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7131328522734487,
													"value": 3,
													"mode": 1,
													"prevHandle": {
														"dv": -0.1843292867991746,
														"dt": -0.49167692767992127
													},
													"nextHandle": {
														"dv": -0.8036818468534301,
														"dt": 0.1206871519896705
													}
												},
												{
													"time": 0.7828958486915034,
													"value": 26.15980177681118,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.43167299619997956,
													"value": -0.40216564806449473,
													"mode": 0,
													"prevHandle": {
														"dv": -0.004677480524029144,
														"dt": -0.49997643676805403
													},
													"nextHandle": {
														"dv": 0.00506593861633331,
														"dt": 0.3977315167702271
													}
												},
												{
													"time": 0.7900731116974761,
													"value": -0.14314211248777348,
													"mode": 1,
													"prevHandle": {
														"dv": -0.24275358532978258,
														"dt": -0.08081598144725266
													},
													"nextHandle": {
														"dv": -3.5960869656508946e-16,
														"dt": 0.32953903925872147
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
											0,
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
					"name": "SlashTrail",
					"x": 2.31899,
					"y": -0.27319,
					"z": 3.14225,
					"scaleX": 1.15,
					"scaleY": 1.15,
					"scaleZ": 1.15,
					"children": [
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": 0.93873,
							"y": 0.01193,
							"z": -1.50253,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": -14.7,
							"rotationY": 19.8,
							"rotationZ": 5.9,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.36,
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
													"time": 0.800790084670889,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.810790084670889,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.8877419839275239,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.9418580230004653,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.0105198819565762,
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
											"name": "scaleX",
											"keys": [
												{
													"time": 0.9106855419686086,
													"value": 3,
													"mode": 2
												},
												{
													"time": 1.062859455012087,
													"value": 26.15980177681118,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "shiftX",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6307224235656234,
													"value": -0.893336452322869,
													"mode": 0,
													"prevHandle": {
														"dv": 4.777854810345815e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06741443310884698
													}
												},
												{
													"time": 0.9127151077601702,
													"value": -0.09214407539152399,
													"mode": 0,
													"prevHandle": {
														"dv": 0.017425630165945463,
														"dt": -0.32951582843900096
													},
													"nextHandle": {
														"dv": -0.017425630165945463,
														"dt": 0.32951582843900096
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Slashtrail",
							"x": 2.09722,
							"y": 0.32723,
							"z": -1.4247,
							"scaleX": 3,
							"scaleY": 3,
							"scaleZ": 3,
							"rotationX": 164,
							"rotationY": 6.5,
							"rotationZ": 25.7,
							"kind": 1,
							"args": [
								24,
								289.09,
								0.36,
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
													"time": 0.800790084670889,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.810790084670889,
													"value": 5,
													"mode": 2
												},
												{
													"time": 0.9418580230004653,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.0105198819565762,
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
													"time": 0.6307224235656234,
													"value": -0.893336452322869,
													"mode": 0,
													"prevHandle": {
														"dv": 4.777854810345815e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.06741443310884698
													}
												},
												{
													"time": 0.9127151077601702,
													"value": -0.09214407539152399,
													"mode": 0,
													"prevHandle": {
														"dv": -0.004005662836481683,
														"dt": -0.20038847757605616
													},
													"nextHandle": {
														"dv": 0.004005662836481683,
														"dt": 0.20038847757605616
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "scaleX",
											"keys": [
												{
													"time": 0.9106855419686086,
													"value": 3,
													"mode": 2
												},
												{
													"time": 1.062859455012087,
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
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0,
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
					"name": "HIT_FLOOR",
					"x": 9.43734,
					"y": 1.43039,
					"scaleX": 1.35,
					"scaleY": 1.69,
					"scaleZ": 1.69,
					"rotationZ": 151.9,
					"children": [
						{
							"type": "object",
							"name": "FrontHit",
							"x": 5.47532,
							"y": 0.31809,
							"z": -0.47313,
							"scaleX": 1.5,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": 6.4,
							"rotationY": 10.2,
							"rotationZ": 1.4,
							"children": [
								{
									"type": "model",
									"name": "Sand",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"x": -0.00992,
									"y": -0.00234,
									"z": -0.24373,
									"scaleX": 3.25,
									"scaleY": 2.44,
									"scaleZ": 2.71,
									"rotationZ": -90,
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
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
													-0.15,
													0.25
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
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
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
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
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
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
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
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
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
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
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
										}
									]
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
								}
							]
						},
						{
							"type": "object",
							"name": "Distort",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"y": 0.1374,
									"scaleY": 3.5,
									"scaleZ": 4.5,
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
												"alpha": 1,
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
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
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
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
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
												"intensity": 0.1
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
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7315925719382714,
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
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
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
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
													"value": 0,
													"mode": 1
												},
												{
													"time": 0.7315925719382714,
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
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
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
							"type": "object",
							"name": "FloorStraightImpact",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"z": 0.81007,
									"scaleY": 0.8,
									"scaleZ": 4,
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
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -0.955914249933893,
																"dt": 0.05571925903077668
															}
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0496313332607452,
																"dt": -0.27529709487575815
															},
															"nextHandle": {
																"dv": 0.0496313332607452,
																"dt": 0.27529709487575815
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
												"progress": 0.3,
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
													"mode": 1
												},
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
													"mode": 1
												},
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
													"mode": 1
												},
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
													"mode": 1
												},
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
													"mode": 1
												},
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
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
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.05991845253130612,
														"dt": -0.32130467203348423
													},
													"nextHandle": {
														"dv": 0.05991845253130612,
														"dt": 0.32130467203348423
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
					"name": "HIT_FLOOR",
					"x": 9.38949,
					"y": -1.77778,
					"scaleX": 1.35,
					"scaleY": 1.69,
					"scaleZ": 1.69,
					"rotationZ": -161.8,
					"children": [
						{
							"type": "object",
							"name": "FrontHit",
							"x": 5.47532,
							"y": 0.31809,
							"z": -0.47313,
							"scaleX": 1.5,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": -6,
							"rotationY": 10.2,
							"rotationZ": 1.2,
							"children": [
								{
									"type": "model",
									"name": "Sand",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"x": -0.00992,
									"y": -0.00234,
									"z": -0.24373,
									"scaleX": 3.25,
									"scaleY": 2.44,
									"scaleZ": 2.71,
									"rotationZ": -90,
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
												"alpha": 0.8,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_01.png"
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
													-0.15,
													0.25
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
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.6302812870454002,
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
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
															"value": -0.014914336029688502,
															"mode": 0
														},
														{
															"time": 1.4706135693391325,
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
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
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
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
													"mode": 0
												},
												{
													"time": 0.6774389373862282,
													"value": 0.5,
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
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
													"value": 0.8743206007304851,
													"mode": 2
												},
												{
													"time": 1.6044188790736489,
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
										}
									]
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
								}
							]
						},
						{
							"type": "object",
							"name": "Distort",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"y": 0.1374,
									"scaleY": 3.5,
									"scaleZ": 4.5,
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
												"alpha": 1,
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
															"time": 0.7315925719382714,
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
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 0,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
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
												"intensity": 0.1
											},
											"children": [
												{
													"type": "curve",
													"name": "intensity",
													"enabled": false,
													"keys": [
														{
															"time": 0.7370717881668449,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.6678422132552644,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6678422132552644,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.6678422132552644,
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
															"time": 0.7370717881668449,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.1541744894751793,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1541744894751793,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.1541744894751793,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.22834677668792,
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
															"time": 0.7315925719382714,
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
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
															"value": 1,
															"mode": 0
														},
														{
															"time": 1.1623629970266909,
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
													"time": 0.7315925719382714,
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
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
													"value": 1,
													"mode": 0
												},
												{
													"time": 1.1623629970266909,
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
							"type": "object",
							"name": "FloorStraightImpact",
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"scaleY": 0.25,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"z": 0.81007,
									"scaleY": 0.8,
									"scaleZ": 4,
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
												"useSourceUVs": true,
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 3,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_MissileHead.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0.7321488386452413,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.7421488386452413,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": -0.955914249933893,
																"dt": 0.05571925903077668
															}
														},
														{
															"time": 1.0403584619041482,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0496313332607452,
																"dt": -0.27529709487575815
															},
															"nextHandle": {
																"dv": 0.0496313332607452,
																"dt": 0.27529709487575815
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
												"progress": 0.3,
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
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
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
													"time": 1.0076731105027723,
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
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.7440065138915495,
													"value": 0.2710450124806828,
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
													"time": 1.0076731105027723,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.05991845253130612,
														"dt": -0.32130467203348423
													},
													"nextHandle": {
														"dv": 0.05991845253130612,
														"dt": 0.32130467203348423
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
					"name": "Sand",
					"x": 0.15466,
					"y": 0.35399,
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor",
							"enabled": false,
							"props": {
								"instScale_rand": 1,
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
								"instScale": 16,
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
									-1,
									1,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.1,
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
								"burstCount": 3,
								"emitAngle": 360,
								"instSpeed": [
									0,
									4,
									-0.5
								]
							},
							"z": -0.25,
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
												"alpha": 0.5
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
								}
							]
						},
						{
							"type": "emitter",
							"name": "Shockwave",
							"enabled": false,
							"props": {
								"warmUpTime": -1.45,
								"emitType": "Burst",
								"instScale": 10,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"x": 0.06646,
							"y": -0.48895,
							"z": 0.1,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
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
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.23,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"value": 0.21666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -2.090031350705387,
												"dt": -0.3895058426314596
											},
											"nextHandle": {
												"dv": 1.1,
												"dt": 0.20671875000000048
											}
										},
										{
											"time": 0.8467187500000021,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.9725490196078431,
											0.9725490196078431
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Shockwave",
							"enabled": false,
							"props": {
								"warmUpTime": -0.65,
								"emitType": "Burst",
								"instScale": 8,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"x": 2.05179,
							"y": -0.8235,
							"z": 0.1,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
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
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.23,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"value": 0.21666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -2.090031350705387,
												"dt": -0.3895058426314596
											},
											"nextHandle": {
												"dv": 1.1,
												"dt": 0.20671875000000048
											}
										},
										{
											"time": 0.8467187500000021,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.9725490196078431,
											0.9725490196078431
										]
									}
								}
							]
						},
						{
							"type": "emitter",
							"name": "Shockwave",
							"enabled": false,
							"props": {
								"warmUpTime": -0.75,
								"emitType": "Burst",
								"instScale": 8,
								"instRotation_rand": [
									0,
									0,
									360
								]
							},
							"x": 3.96708,
							"y": 0.16669,
							"z": 0.1,
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100"
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
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.23,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
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
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 1.41712157155829,
																"dt": -0.45256463091700333
															},
															"nextHandle": {
																"dv": -1.0333333333333334,
																"dt": 0.33171875000000084
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
											"value": 0.21666666666666667,
											"mode": 0,
											"prevHandle": {
												"dv": -2.090031350705387,
												"dt": -0.3895058426314596
											},
											"nextHandle": {
												"dv": 1.1,
												"dt": 0.20671875000000048
											}
										},
										{
											"time": 0.8467187500000021,
											"value": 1,
											"mode": 2
										}
									]
								},
								{
									"type": "shader",
									"name": "ColorMult",
									"source": "shaders/ColorMult.hx",
									"props": {
										"amount": 1,
										"color": [
											0.9725490196078431,
											0.9725490196078431,
											0.9725490196078431
										]
									}
								}
							]
						},
						{
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"x": 2.21566,
							"y": -0.84605,
							"z": 0.07087,
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 0.15,
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
													"time": 0.6265512224837013,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 0.6265512224837013,
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
													"time": 1.4527533682859834,
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
											"time": 0.6780886597956273,
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
											"time": 0.7123627432859831,
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
											"time": 1.581337352660987,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "polygon",
							"name": "Round_Sand_Stylised",
							"x": 4.11025,
							"y": 0.16502,
							"z": 0.07087,
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 0.15,
							"rotationZ": 120.9,
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
													"time": 0.6681325632097321,
													"value": 0.8948601617813111,
													"mode": 1
												},
												{
													"time": 0.6681325632097321,
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
													"time": 1.4943347090120143,
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
											"time": 0.7196700005216581,
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
											"time": 0.753944084012014,
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
											"time": 1.6229186933870179,
											"value": 1,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "HeatWave_Distort",
							"enabled": false,
							"props": {
								"emitRate": 2,
								"useRandomColor": true,
								"randomColor1": [
									1,
									1,
									1,
									0.8313725490196078
								],
								"randomColor2": [
									0.9019607843137255,
									0.9019607843137255,
									0.9019607843137255,
									0.7294117647058823
								],
								"instScale": 20,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 0,
								"warmUpTime": -1.4,
								"emitType": "Burst",
								"lifeTime": 0.75,
								"burstDelay": 0.55
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
													"mode": "Distortion",
													"blend": "Alpha",
													"shadows": false,
													"culling": "Back",
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
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
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
															"mode": 0
														},
														{
															"time": 0.1072413710626145,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0058489084243771305,
																"dt": -0.06672153635116596
															},
															"nextHandle": {
																"dv": 0.0058489084243771305,
																"dt": 0.06672153635116596
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
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.8,
												"sandColorSet": false,
												"envBlend": 0.2,
												"envColorSet": false
											}
										},
										{
											"type": "shader",
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
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
											"name": "DistortionMap",
											"source": "shaders/DistortionMap.hx",
											"props": {
												"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
												"intensity": 0.016
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
												"dv": -0.9944446984687934,
												"dt": -0.48890120703870477
											},
											"nextHandle": {
												"dv": 0.7,
												"dt": 0.3425225781956737
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
				}
			]
		}
	]
}