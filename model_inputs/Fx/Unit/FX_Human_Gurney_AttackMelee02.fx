{
	"type": "fx",
	"duration": 2.5,
	"cullingRadius": 3,
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
					"name": "group",
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Atreide/Unit/Gurney/Male01_AtreidesGurney.fbx",
							"editorOnly": true,
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Gurney/Anim_Male01_Gurney_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Javelin.fbx",
							"editorOnly": true,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Atreide/Unit/Weapons/GurneySet_Shield.fbx",
							"editorOnly": true,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"rotationY": 180,
							"rotationZ": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"editorOnly": true,
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon.B_Whip01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"editorOnly": true,
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
						}
					]
				},
				{
					"type": "emitter",
					"name": "HeatWave_Distort",
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
						"instScale": 13,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"instScale_rand": 0,
						"warmUpTime": -0.6,
						"emitType": "Burst",
						"lifeTime": 0.7,
						"alignMode": "Screen"
					},
					"x": 4.47771,
					"y": -0.00212,
					"z": 1.59693,
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
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.08
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "emitRate",
							"keyMode": 1,
							"keys": [
								{
									"time": -0.008955438443594144,
									"value": 0,
									"mode": 0
								},
								{
									"time": 1.199261029354163,
									"value": 1,
									"mode": 1,
									"prevHandle": {
										"dv": -0.5333333333333333,
										"dt": -0.4725329589843752
									},
									"nextHandle": {
										"dv": 0.016666666666666607,
										"dt": 0.31836303710937575
									}
								},
								{
									"time": 3.140094610862653,
									"value": 0.9833333333333334,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666607,
										"dt": -0.21809168368578025
									},
									"nextHandle": {
										"dv": -0.049836898730717664,
										"dt": 0.6521407892315909
									}
								},
								{
									"time": 5.952119635515775,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.5
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
									"value": 0.25000000000000006,
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
				},
				{
					"type": "model",
					"name": "GurneyShield",
					"source": "Fx/Meshes_Common/GurneyShield.fbx",
					"x": 4.04904,
					"y": -0.00667,
					"z": 1.67641,
					"scaleX": 2.5,
					"scaleY": 2.5,
					"scaleZ": 2.5,
					"rotationX": -15.5,
					"rotationZ": 92,
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
									"emissive": 15
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.13
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.5529411764705883,
									1,
									0.5098039215686274
								]
							}
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.5964075707025077,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.6467967922593939,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.7643716425587952,
									"value": 0.016666666666666663,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": -0.0050000000000000044,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.590808768307298,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.6411979898641845,
									"value": 1.1194789073481342,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.01833333333333335
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.02166666666666665
									}
								},
								{
									"time": 0.7195812233971186,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.2906590677084964,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 21.97,
								"power": 11.36
							}
						}
					]
				},
				{
					"type": "model",
					"name": "GurneyShield",
					"source": "Fx/Meshes_Common/GurneyShield.fbx",
					"x": 4.0113,
					"y": -0.00983,
					"z": 1.67647,
					"scaleX": 3,
					"scaleY": 3,
					"scaleZ": 3,
					"rotationX": -15.5,
					"rotationZ": 92,
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
								"alpha": 0.13
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": -0.0050000000000000044,
											"value": 0.9666666666666667,
											"mode": 2
										},
										{
											"time": 0.6400000000000001,
											"value": 0.9666666666666667,
											"mode": 1,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33499999999999996
											},
											"nextHandle": {
												"dv": -0.8,
												"dt": 0.050000000000000044
											}
										},
										{
											"time": 0.9400000000000002,
											"value": -0.06666666666666667,
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
									0.6274509803921569,
									1,
									0.592156862745098
								]
							}
						},
						{
							"type": "curve",
							"name": "visibility",
							"keys": [
								{
									"time": 0.5690909090909086,
									"value": 0,
									"mode": 2
								},
								{
									"time": 0.6312727272727274,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.3250000000000002,
									"value": 0.016666666666666663,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": -0.0050000000000000044,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.5800000000000001,
									"value": 1,
									"mode": 2
								},
								{
									"time": 0.625,
									"value": 1.1194789073481342,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.01833333333333335
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.02166666666666665
									}
								},
								{
									"time": 0.6950000000000001,
									"value": 1,
									"mode": 2
								},
								{
									"time": 1.205,
									"value": 1,
									"mode": 2
								}
							]
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 21.97,
								"power": 11.36
							}
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
							0
						],
						"warmUpTime": 0.05,
						"instRotation": [
							30,
							0,
							0
						],
						"instScale": 1.7
					},
					"x": 3.93472,
					"y": 0.04101,
					"z": 1.35972,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": 44.3,
					"rotationY": 67.4,
					"rotationZ": 78.5,
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
										"alpha": 0.17,
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
										"progress": 0.47,
										"saturation": 0,
										"width": 0.28,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"enabled": false,
									"props": {
										"REVERSE": false,
										"range": 200,
										"power": 23.48
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
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.45,
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
								},
								{
									"type": "curve",
									"name": "position.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.55,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -5.1929172557584735,
												"dt": -0.27727380087695946
											},
											"nextHandle": {
												"dv": 4.550322954356672,
												"dt": 0.24499999999999988
											}
										},
										{
											"time": 1.305,
											"value": 5,
											"mode": 2
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
					"type": "emitter",
					"name": "HitFlash",
					"props": {
						"emitType": "Burst",
						"instScale_rand": 0,
						"instRotation_rand": [
							0,
							0,
							0
						],
						"warmUpTime": -0.55,
						"instRotation": [
							30,
							0,
							0
						],
						"instScale": 2.5,
						"lifeTime": 0.05,
						"alignMode": "Screen",
						"instOffset": [
							0,
							0,
							2
						]
					},
					"x": 3.93472,
					"y": 0.04101,
					"z": 1.35972,
					"scaleX": 0.1,
					"scaleY": 0.1,
					"scaleZ": 0.1,
					"rotationX": 44.3,
					"rotationY": 67.4,
					"rotationZ": 78.5,
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
										"alpha": 0.5,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_circle5.png"
									}
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
										"progress": 0.47,
										"saturation": 0,
										"width": 0.28,
										"uvScaleX": 5,
										"uvScaleY": 5,
										"texture": "Fx/noise/Wave_01.jpg",
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
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 200,
										"power": 23.48
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
											0.7490196078431373,
											0.9921568627450981,
											0.7372549019607844
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"enabled": false,
											"keys": [
												{
													"time": 0.45,
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
								},
								{
									"type": "curve",
									"name": "position.x",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0.55,
											"value": 0.1,
											"mode": 0,
											"prevHandle": {
												"dv": -5.1929172557584735,
												"dt": -0.27727380087695946
											},
											"nextHandle": {
												"dv": 4.550322954356672,
												"dt": 0.24499999999999988
											}
										},
										{
											"time": 1.305,
											"value": 5,
											"mode": 2
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
					"type": "emitter",
					"name": "Sand_Floor",
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
						"instScale": 20,
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
						"warmUpTime": -0.5,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
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
						]
					},
					"x": 4.86422,
					"y": -0.49999,
					"z": 0.48991,
					"scaleZ": 0.01,
					"rotationZ": 43.6,
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
										"scale": 0.61
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
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 1.6195399014805467,
										"dt": 2.975046534659357e-17
									},
									"nextHandle": {
										"dv": -1.1333333333333333,
										"dt": 0
									}
								},
								{
									"time": 1,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": 0.016666666666666663,
										"dt": -0.98
									},
									"nextHandle": {
										"dv": -0.005668855987316409,
										"dt": 0.3333287320541929
									}
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": 5.45,
					"y": -0.15,
					"z": 1.21,
					"scaleX": 7,
					"scaleY": 8,
					"scaleZ": 0.1,
					"rotationX": -16.4,
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
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 0.5,
									"drawOrder": "100"
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
								"alpha": 0.7,
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
								"progress": 0.5,
								"saturation": 0.5,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/T_Noise_Grunge_01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									1
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
											"time": 0.49469386844690677,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6413164492766062,
												"dt": 0.2348929044717959
											}
										},
										{
											"time": 1.2161355400085478,
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
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.4,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5629235924793381,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.44080947842916,
										"dt": -0.3325846355154632
									},
									"nextHandle": {
										"dv": 1.44080947842916,
										"dt": 0.3325846355154632
									}
								},
								{
									"time": 1.1918922719227387,
									"value": 1.9663565946370385,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5417303952067746,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -2.9546484919213998,
										"dt": -0.9375525527792775
									},
									"nextHandle": {
										"dv": 0.7666666666666666,
										"dt": 0.24327438354492237
									}
								},
								{
									"time": 1.0749006425114094,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Shockwave",
					"props": {
						"warmUpTime": -0.6,
						"emitType": "Burst",
						"instScale": 11,
						"instRotation_rand": [
							0,
							0,
							360
						]
					},
					"x": 2.64465,
					"y": -0.45767,
					"z": 0.51099,
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
									}
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
														"dv": 1.5390245215250955,
														"dt": -0.2674323155246688
													},
													"nextHandle": {
														"dv": -1.05,
														"dt": 0.18221940994262736
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
					"type": "model",
					"name": "Shoulder",
					"source": "Fx/Meshes_Common/CrossPlanePivBot_NoVrtx.fbx",
					"x": -1.51924,
					"y": -0.08615,
					"z": 1.94145,
					"scaleX": 1.78,
					"scaleY": 1.06,
					"scaleZ": 3,
					"rotationY": 91.7,
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
									"emissive": 1
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
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.45370591199324495,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.6131220357331916,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.745968805516481,
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
											"time": 0.4404212350149167,
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
											"time": 0.6330490512006852,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9385966217022503,
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
											"time": 0.6330490512006852,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.9385966217022503,
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
									0.396078431372549,
									1,
									0.3411764705882353
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.21515278715841246,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.0315893605505504,
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
}