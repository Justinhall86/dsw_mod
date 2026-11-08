{
	"type": "fx",
	"duration": 1.8,
	"cullingRadius": 15,
	"blendFactor": 1,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Character",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_Feydakin_Rework",
							"source": "Character/Fremen/Unit/Feydakin/Male01_Feydakin_Rework.fbx",
							"scaleX": 2,
							"scaleY": 2,
							"scaleZ": 2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"time": -0.1,
									"animation": "Anim/Male01/Fedaykin/Anim_Male01_Fedaykin_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Crysknife",
							"source": "Character/Fremen/Weapon/Crysknife/Crysknife.fbx",
							"y": -0.10565,
							"z": -0.07926,
							"rotationX": -68.18
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.Character.Crysknife",
							"target": "FXAnimation.FXRoot.Character.Male01_Feydakin_Rework.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon"
						}
					]
				},
				{
					"type": "object",
					"name": "Slash",
					"x": 2.56122,
					"y": 0.10023,
					"z": 2.198,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5,
					"rotationX": -157.8,
					"rotationY": 2.5,
					"rotationZ": 16.4,
					"children": [
						{
							"type": "polygon",
							"name": "Slash",
							"x": -0.27806,
							"y": 0.07659,
							"z": -0.0175,
							"scaleX": 4,
							"scaleY": 4,
							"scaleZ": 4,
							"rotationX": 3,
							"kind": 1,
							"args": [
								30,
								300,
								0.24,
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
											"depthTest": "LessEqual"
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.4
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
										"vOffset": 1,
										"texture": "Fx/Gradients/T_Square02.jpg",
										"onDecal": false
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
											0.7607843137254902,
											0.48627450980392156
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "UVTransform",
									"source": "shaders/UVTransform.hx",
									"props": {
										"scaleX": 0.73,
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
													"time": 0.1964052807700586,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.1897756802451507,
													"value": 2.0340441513061527,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"progress": 0.34,
										"saturation": 0,
										"width": 0.55,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
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
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashDistort",
							"z": -0.01750000000000007,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
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
									"name": "DistortionMap",
									"source": "shaders/DistortionMap.hx",
									"props": {
										"distortionDir": "Fx/DistortionMaps/waveNormal.jpg",
										"intensity": 0.006
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
													"time": 0.07917435044168866,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.2815124933399535,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"texture": "Fx/Gradients/dGrad02.png",
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
													"time": 0.07917435044168866,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 0.5176865988535746,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.0665124933399537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
							"name": "SlashImpact",
							"z": 0.13808,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
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
											"emissive": 8,
											"drawOrder": "100",
											"depthTest": "LessEqual",
											"parallax": 0
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 0.18917435044168893,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.469060023964639,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.507028773964639,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.551325648964639,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.1220899798342219,
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
											0.6980392156862745,
											0.34901960784313724
										]
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
													"time": 0.07917435044168866,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.2815124933399535,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"progress": 0.27,
										"saturation": 1,
										"width": 0.55,
										"uvScaleX": 1,
										"uvScaleY": 1,
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
									"isInstance": true
								}
							]
						},
						{
							"type": "polygon",
							"name": "SlashContraste",
							"y": -0.00535,
							"z": 0.10217,
							"scaleX": 3.5,
							"scaleY": 3.4999999999999996,
							"scaleZ": 3.4999999999999996,
							"rotationX": 3,
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
											"drawOrder": "110"
										}
									},
									"diffuseMap": "Fx/Alphas/T_Slash_blurry.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1.5
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
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.17917435044168886,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4690622552667649,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4940933432779203,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.016666666666666607,
														"dt": -0.060626897820058256
													},
													"nextHandle": {
														"dv": 0.015029727053590165,
														"dt": 0.0546723435804825
													}
												},
												{
													"time": 0.5222310088708466,
													"value": 0.016666666666666663,
													"mode": 2
												},
												{
													"time": 1.179174350441683,
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
													"time": 0.07917435044168866,
													"value": -2.500320053100587,
													"mode": 2
												},
												{
													"time": 1.2815124933399535,
													"value": 1.9597103118896493,
													"mode": 0,
													"prevHandle": {
														"dv": 0.06757621765136723,
														"dt": -0.5199999999999998
													},
													"nextHandle": {
														"dv": -0.04309950544713704,
														"dt": 0.3316513355058816
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
										"progress": 0.5,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/dGrad02.png",
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
													"time": 0.07917435044168866,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.021541150644896954,
														"dt": -0.499702636528235
													},
													"nextHandle": {
														"dv": 0.018518518518518517,
														"dt": 0.4288562596073172
													}
												},
												{
													"time": 0.5176865988535746,
													"value": 1.0416666666666667,
													"mode": 1,
													"prevHandle": {
														"dv": -1.0046296296296298,
														"dt": -0.06620842174634933
													},
													"nextHandle": {
														"dv": -0.9305555555555556,
														"dt": 0.0650646813536665
													}
												},
												{
													"time": 1.0665124933399537,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.41025012804053784
													},
													"nextHandle": {
														"dv": -5.653469652661062e-16,
														"dt": 0.1919166956729
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
						}
					]
				},
				{
					"type": "object",
					"name": "Step1",
					"z": 0.15,
					"rotationZ": 9.1,
					"children": [
						{
							"type": "emitter",
							"name": "Sand_Floor1",
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
								"emitOrientation": "Normal",
								"instSpeed_rand": [
									1,
									0,
									0
								],
								"seedGroup": 2,
								"lifeTime": 1.5,
								"burstDelay": 0.45,
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
									10,
									0,
									0
								],
								"warmUpTime": -0.45,
								"emitAngle": 45
							},
							"x": 3.1221,
							"y": 0.91326,
							"z": 0.26608,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.01,
							"rotationZ": 60,
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
				}
			]
		}
	]
}