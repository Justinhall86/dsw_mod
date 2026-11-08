{
	"type": "fx",
	"duration": 2,
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
					"name": "Nefud",
					"editorOnly": true,
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
									"animation": "Anim/Male01/Nefud/Anim_Male01_Nefud_AttackMelee01.fbx"
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
					"x": 0.69118,
					"y": -1.06659,
					"z": 2.4086,
					"scaleX": 1.5,
					"scaleY": 0.64,
					"scaleZ": 1.3,
					"rotationX": -75.5,
					"rotationY": 6,
					"rotationZ": -2.4,
					"time": -0.01,
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
									"emissive": 7,
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
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 0.15,
					"y": 0.15,
					"z": 2.88,
					"scaleX": 0.95,
					"scaleY": 0.98,
					"scaleZ": 0,
					"rotationX": -21.82,
					"rotationY": 10.91,
					"rotationZ": -38.18,
					"time": -0.13,
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
									"emissive": 5,
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
											"time": 1.3695446777343752,
											"value": 0,
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
									0.32156862745098036,
									0.11372549019607843,
									0.06666666666666667
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
											"time": 0.8949999999999999,
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
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 1.82439,
					"y": -0.73868,
					"z": 2.4086,
					"scaleX": 1.29,
					"scaleY": 0.64,
					"scaleZ": 1.63,
					"rotationX": -75.5,
					"rotationY": 6,
					"rotationZ": -10.7,
					"time": -0.01,
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
									"depthTest": "LessEqual"
								}
							},
							"color": [
								0.2784313725490196,
								0.2784313725490196,
								0.2784313725490196,
								1
							]
						},
						{
							"type": "shader",
							"name": "DistortionMap",
							"source": "shaders/DistortionMap.hx",
							"enabled": false,
							"props": {
								"distortionDir": "Fx/DistortionMaps/waveNormal02.jpg",
								"intensity": 1
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
						"instScale": 28,
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
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5
					},
					"x": 5.35285,
					"y": 0.0719,
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
										"power": 48.48
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
										"sandBlend": 0.7,
										"sandColorSet": false,
										"envBlend": 0.5,
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
					"name": "Hit",
					"x": 4.85,
					"z": 2.60893,
					"scaleX": 6,
					"scaleY": 3.21,
					"scaleZ": 0.72,
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
									"blend": "Add",
									"shadows": false,
									"culling": "None",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 10
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
								"progress": 0.5,
								"saturation": 1,
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
									1.5
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
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.377246958729634,
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
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.4510914176802323,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6945100967772306,
												"dt": 0.039068936136667565
											}
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5862699663203573,
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
								"envBlend": 0.3,
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
							"enabled": false,
							"props": {
								"amount": 1,
								"color": [
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.43147286719102707,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.4686791505927568,
											"value": 0.5333333333333333,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.3306083530766246,
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
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								},
								{
									"time": 0.9174774742103238,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": 6.5,
					"y": -0.15,
					"z": 1.21,
					"scaleX": 12,
					"scaleY": 15,
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
									"emissive": 0.3,
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
											"time": 0.3769326198227188,
											"value": 0.8948601617813111,
											"mode": 1
										},
										{
											"time": 0.3769326198227188,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.8948601617813111,
												"dt": 0.3747861301772835
											}
										},
										{
											"time": 1.2117187500000028,
											"value": -0.014914336029688502,
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
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.5108180010444903,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.5108180010444903,
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
									"time": 1.5567187500000037,
									"value": 1.814904036521913,
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
									"time": 0.39929687500000005,
									"value": 0,
									"mode": 0
								},
								{
									"time": 0.4384700571346446,
									"value": 0.30368433086838276,
									"mode": 0,
									"prevHandle": {
										"dv": -0.016028464643291065,
										"dt": -0.005770247271584787
									},
									"nextHandle": {
										"dv": 0.1564039476153437,
										"dt": 0.055631220125320624
									}
								},
								{
									"time": 1.3317187500000043,
									"value": 0.8743206007304851,
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
						"warmUpTime": -0.3,
						"emitType": "Burst",
						"instScale": 15,
						"instRotation_rand": [
							0,
							0,
							360
						]
					},
					"x": 2.31401,
					"y": -0.45767,
					"z": 0.36115,
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
										"saturation": 0,
										"width": 0.33,
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
				}
			]
		}
	]
}