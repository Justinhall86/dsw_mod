{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 15,
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
					"name": "Nefud",
					"editorOnly": true,
					"x": -0.7399,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenNefud",
							"source": "Character/Harkonnen/Unit/Nefud/Male01_HarkonnenNefud.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Nefud/Anim_Male01_Nefud_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "NefudMace",
							"source": "Character/Harkonnen/Weapon/NefudMace.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"rotationZ": 180
						},
						{
							"type": "model",
							"name": "NefudShield",
							"source": "Character/Harkonnen/Weapon/NefudShield.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 90,
							"rotationY": 180,
							"rotationZ": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.NefudMace",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.NefudShield",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenNefud.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_Shield"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 2.42,
					"y": 0.44016,
					"z": 0.91,
					"scaleX": 1.17,
					"scaleY": 1.82,
					"scaleZ": 0,
					"rotationX": -95.45,
					"rotationY": -141.82,
					"rotationZ": 176.4,
					"time": 0.13,
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
								"useScale": false,
								"wrap": true,
								"progress": 0.58,
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
											"mode": 2
										},
										{
											"time": 1.2116491900435964,
											"value": 0.7,
											"mode": 0,
											"prevHandle": {
												"dv": 0.3717107743024825,
												"dt": -1.184544677734375
											},
											"nextHandle": {
												"dv": -0.3717107743024825,
												"dt": 1.184544677734375
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
								"range": 2.27,
								"power": 3.79
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
									0.34509803921568627,
									0.19607843137254902
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.815,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.9695984087935962,
											"value": 0.2,
											"mode": 2
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
						},
						{
							"type": "shader",
							"name": "ColorMult",
							"source": "shaders/ColorMult.hx",
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									0.9921568627450981,
									0.7568627450980392,
									0.7450980392156863
								]
							}
						}
					]
				},
				{
					"type": "emitter",
					"name": "Shockwave",
					"props": {
						"warmUpTime": -0.55,
						"emitType": "Burst",
						"instScale": 15,
						"instRotation_rand": [
							0,
							0,
							360
						]
					},
					"x": 6.1951,
					"y": -0.45767,
					"z": 0.64725,
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
										"alpha": 0.8,
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
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
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
										"width": 1,
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
									"value": 0,
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
						"frameCount": 32,
						"frameDivisionX": 8,
						"frameDivisionY": 8,
						"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
						"instScale": 12,
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
						"instOffset": [
							0,
							0,
							1
						]
					},
					"x": 5.96809,
					"y": -0.22568,
					"z": -0.03098,
					"scaleX": 0.1,
					"scaleY": 0.1,
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
										"scale": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 0.42,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/NoisyWave_01.png",
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
										"range": 25,
										"power": 50
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
									"envBlend": 0.5
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
										"dv": -0.07620241819144336,
										"dt": -0.9450000000000001
									},
									"nextHandle": {
										"dv": 0.021440078189261927,
										"dt": 0.265882295729136
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
						"frameCount": 32,
						"frameDivisionX": 8,
						"frameDivisionY": 8,
						"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
						"instScale": 18,
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
						"warmUpTime": -0.5,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"lifeTime": 1.5,
						"burstDelay": 0.5,
						"instOffset": [
							0,
							0,
							1
						]
					},
					"x": 5.96809,
					"y": -0.22568,
					"z": -0.53413,
					"scaleX": 0.1,
					"scaleY": 0.1,
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
										"scale": 0.5
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 1
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
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 0,
										"width": 0.42,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/NoisyWave_01.png",
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
										"range": 25,
										"power": 50
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.6,
									"envBlend": 0.5
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
										"dv": -0.07620241819144336,
										"dt": -0.9450000000000001
									},
									"nextHandle": {
										"dv": 0.021440078189261927,
										"dt": 0.265882295729136
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
						"instScale": 20,
						"instRotation_rand": [
							0,
							0,
							360
						],
						"instScale_rand": 0,
						"warmUpTime": -0.6,
						"emitType": "Burst"
					},
					"x": 6.45847,
					"y": -0.76669,
					"z": 0.99106,
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
										"intensity": 0.03
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
				},
				{
					"type": "model",
					"name": "PlanePivBot_NoVrtx",
					"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx_UVRotate.fbx",
					"x": 5.64226,
					"z": -1.11815,
					"scaleX": 5,
					"scaleY": 2.5,
					"scaleZ": 8,
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
											"time": 0.5444115937846232,
											"value": 0.8948601617813111,
											"mode": 1
										},
										{
											"time": 0.5444115937846232,
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
											"time": 1.8267931484428148,
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
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.6936997179788107,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6936997179788107,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.6141157995646966,
										"dt": -0.29141785020757316
									},
									"nextHandle": {
										"dv": 1.9087633109092725,
										"dt": 0.35074449895550963
									}
								},
								{
									"time": 2.2114834139295425,
									"value": 1.814904036521913,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5693487278761048,
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
									"time": 1.9605984581773312,
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
					"x": 5.89999,
					"y": 0.15534,
					"z": -1.11815,
					"scaleX": 5,
					"scaleY": 2.5,
					"scaleZ": 8,
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
											"time": 0.5444115937846232,
											"value": 0.8948601617813111,
											"mode": 1
										},
										{
											"time": 0.5444115937846232,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.03032581659370004,
												"dt": 0.5096775548746344
											}
										},
										{
											"time": 1.8267931484428148,
											"value": -0.014914336029688502,
											"mode": 0,
											"prevHandle": {
												"dv": 0.030325816593699984,
												"dt": -1.0811994972030563
											},
											"nextHandle": {
												"dv": -0.013418988933783842,
												"dt": 0.48136811743022434
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
							"name": "position.x",
							"enabled": false,
							"keyMode": 0,
							"keys": [
								{
									"time": 0.6936997179788107,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6936997179788107,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": -1.6141157995646966,
										"dt": -0.29141785020757316
									},
									"nextHandle": {
										"dv": 1.9087633109092725,
										"dt": 0.35074449895550963
									}
								},
								{
									"time": 2.2114834139295425,
									"value": 1.814904036521913,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale.z",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5693487278761048,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -0.9954511514480451,
										"dt": -0.2571974231220046
									},
									"nextHandle": {
										"dv": 1.0054686908400579,
										"dt": 0.25742794900036414
									}
								},
								{
									"time": 1.9605984581773312,
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
					"type": "emitter",
					"name": "Hit",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"instScale_rand": 0,
						"instRotation_rand": [
							0,
							0,
							180
						],
						"warmUpTime": 0.4,
						"lifeTime": 1.5,
						"instScale": 2
					},
					"x": 6.23641,
					"y": 0.07842,
					"z": 0.12511,
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
											1,
											0.5176470588235293,
											0.34901960784313724
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
				}
			]
		}
	]
}