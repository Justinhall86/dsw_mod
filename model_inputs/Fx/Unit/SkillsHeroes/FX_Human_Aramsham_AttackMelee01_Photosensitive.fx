{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 13,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"x": 15.05147,
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
			"scaleX": 2.2,
			"scaleY": 2.2,
			"scaleZ": 2.2,
			"children": [
				{
					"type": "object",
					"name": "Aramsham",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_ImperialAramsham",
							"source": "Character/Imperial/Aramsham/Male01_ImperialAramsham.fbx",
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Male01/Aramsham/Anim_Male01_Aramsham_AttackMelee01.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Aramsham_Sword",
							"source": "Character/Imperial/Weapon/AramshamSword/Aramsham_Sword.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"enabled": false,
							"x": -0.00275,
							"y": -0.11773,
							"z": 0.01896,
							"rotationX": -90
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Aramsham.Aramsham_Sword",
							"target": "FXAnimation.FXRoot.Aramsham.Male01_ImperialAramsham.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "SLASH",
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"enabled": false,
							"x": 1.19356,
							"y": 0.54255,
							"z": 1.13291,
							"scaleX": 3.1000000000000005,
							"scaleY": 3.1,
							"scaleZ": 3.1,
							"rotationX": 80.69999999999999,
							"rotationY": -16.399999999999995,
							"rotationZ": -0.7999999999999969,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
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
										"scaleX": 1,
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
													"time": 0.03911896444267593,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.1569733401308737,
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
													"time": -0.053739649616472596,
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
													"time": 0.4684524074887779,
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
													"time": 1.289622154383776,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.1388888888888889,
														"dt": -0.615
													},
													"nextHandle": {
														"dv": -0.043250236625664115,
														"dt": 0.19151204777844172
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
											0.9725490196078431,
											0.8352941176470589,
											0.6235294117647059
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 0.3641189644426764,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9141189644426764,
													"value": 0,
													"mode": 2
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
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keys": [
														{
															"time": 0.3641189644426764,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9141189644426764,
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
														"position": 0.35546875,
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
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashBlack",
							"x": 1.19356,
							"y": 0.54255,
							"z": 1.13291,
							"scaleX": 3.1000000000000005,
							"scaleY": 3.1,
							"scaleZ": 3.1,
							"rotationX": 80.69999999999999,
							"rotationY": -16.399999999999995,
							"rotationZ": -0.7999999999999969,
							"kind": 1,
							"args": [
								24,
								300,
								0.57,
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
											"colorMask": 255
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
										"scaleX": 1,
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
													"time": 0.01696726039877272,
													"value": -2.425986213684083,
													"mode": 2
												},
												{
													"time": 1.1348216360869705,
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
													"time": -0.08475203527793629,
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
													"time": 0.43744002182731423,
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
													"time": 1.2586097687223123,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.010995608538952428,
														"dt": -0.6427923963018025
													},
													"nextHandle": {
														"dv": -0.010995608538952428,
														"dt": 0.6427923963018025
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
											0,
											0,
											0
										]
									},
									"isInstance": true
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
														"position": 0.35546875,
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "HIT",
					"x": -0.05,
					"scaleX": 0.8,
					"children": [
						{
							"type": "object",
							"name": "FrontHitR",
							"enabled": false,
							"x": 3.07878,
							"y": 0.27901,
							"z": -0.29486,
							"rotationX": 43.29999999999999,
							"rotationY": 9.700000000000003,
							"rotationZ": 16.1,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"x": 0.33492,
									"scaleX": 2,
									"scaleZ": 2,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 5,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlatSmoke.png"
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.25,
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.563385968531865,
															"value": 1,
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
															"time": 1.9998336366429112,
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
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.46967273289157513,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6383629533995133,
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
							"name": "FrontHitL",
							"enabled": false,
							"x": 3.08519,
							"y": 0.18995,
							"z": -0.22976,
							"rotationX": -43.8,
							"rotationY": 6.300000000000001,
							"rotationZ": -0.5,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"x": 0.33492,
									"scaleX": 2,
									"scaleZ": 2,
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
													"culling": "None",
													"depthTest": "LessEqual",
													"colorMask": 15,
													"enableStencil": false,
													"alphaKill": false,
													"parallax": 0,
													"textureWrap": true,
													"emissive": 5,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_FlatSmoke.png"
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.25,
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.563385968531865,
															"value": 1,
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
															"time": 1.9998336366429112,
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
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.46967273289157513,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6383629533995133,
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
							"name": "FrontHit",
							"x": 4.80749,
							"y": 0.30632,
							"z": -0.23481,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
							"rotationX": 0.2999999999999999,
							"rotationY": 10.2,
							"rotationZ": 1.1999999999999995,
							"children": [
								{
									"type": "model",
									"name": "Sand",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"z": -0.04625,
									"scaleX": 4,
									"scaleY": 2.25,
									"scaleZ": 3.5,
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_Hit03.png"
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"enabled": false,
									"x": -0.2585,
									"z": -0.23419,
									"scaleX": 1.75,
									"scaleY": 1.75,
									"scaleZ": 3,
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
													"drawOrder": "110",
													"emissive": 5
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_JetSand_Hit03.png"
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.563385968531865,
															"value": 1,
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
															"time": 1.9998336366429112,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.39,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 1.5,
												"uvScaleY": 1,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													-0.25,
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
															"time": 0.4359837896236447,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4359837896236447,
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
															"time": 1.7405858605311826,
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
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0.563385968531865,
															"value": 1,
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
															"time": 1.9998336366429112,
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
											"type": "curve",
											"name": "scale.z",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
													"time": 0.48314143996447256,
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
													"time": 1.874391170265699,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.46967273289157513,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6383629533995133,
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
													0,
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
										"range": 1.5,
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
							"rotationY": 89.99999999999999,
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
															"time": 0.5,
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
															"time": 1,
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
															"time": 0.5054792162285735,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.5054792162285735,
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
															"time": 0.5054792162285735,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.9918114924484887,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.0065993129073667,
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
															"time": 0.5,
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
															"time": 1,
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
													"time": 0.5,
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
													"time": 1,
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
							"enabled": false,
							"x": 1.37748,
							"y": 0.18916,
							"z": 0.1,
							"rotationY": 89.99999999999999,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
									"z": 0.51457,
									"scaleY": 1.5,
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
													"emissive": 4
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
															"time": 0.49371047843720023,
															"value": 0,
															"mode": 1
														},
														{
															"time": 0.5,
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
															"time": 1,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.9725490196078431,
													0.8352941176470589,
													0.6235294117647059
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.5131139470220684,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.5432971203763077,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.6607959023624536,
															"value": 1,
															"mode": 2
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "scale.z",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.5055681536835085,
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
													"time": 1,
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
						}
					]
				},
				{
					"type": "object",
					"name": "Step",
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor2",
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
								"instScale": 10,
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
								"warmUpTime": -0.35,
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
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
							"x": 1.69432,
							"y": -0.59936,
							"z": 0.26608,
							"scaleX": 0.9999999999999997,
							"scaleY": 0.9999999999999997,
							"scaleZ": 0.01,
							"rotationZ": -17.3,
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
					"type": "emitter",
					"name": "Sand_FloorFront",
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
						"instScale": 15,
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
						"warmUpTime": -0.45,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							1,
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
							15,
							0,
							0
						]
					},
					"x": 2.3201,
					"y": 0.18782,
					"z": 0.01638,
					"scaleX": 0.9999999999999996,
					"scaleY": 0.9999999999999996,
					"scaleZ": 0.01,
					"rotationZ": 2.0999999999999996,
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
		}
	]
}