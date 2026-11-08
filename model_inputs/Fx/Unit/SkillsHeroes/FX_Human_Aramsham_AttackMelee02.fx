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
									"animation": "Anim/Male01/Aramsham/Anim_Male01_Aramsham_AttackMelee02.fbx"
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
					"name": "AttackMelee",
					"x": 0.8187249999999999,
					"y": -0.32222333333333325,
					"z": 0.6573549999999998,
					"children": [
						{
							"type": "object",
							"name": "Slash",
							"x": -0.30237499999999995,
							"y": 0.27725333333333324,
							"z": 0.5387149999999999,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"children": [
								{
									"type": "polygon",
									"name": "SlashBlack",
									"scaleX": 3.1,
									"scaleY": 3.0999999999999996,
									"scaleZ": 3.1,
									"rotationX": 168.9,
									"rotationY": -14.5,
									"rotationZ": -61.79999999999999,
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
													"emissive": 4,
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
												"scale": 5
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
															"time": 0.15616089689676937,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.2334327787935868,
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
															"time": 0.014279621130818043,
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
															"time": 0.5364716782360686,
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
															"time": 1.3170589313396863,
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
									"type": "polygon",
									"name": "Slash",
									"scaleX": 3.1,
									"scaleY": 3.0999999999999996,
									"scaleZ": 3.1,
									"rotationX": 168.9,
									"rotationY": -14.5,
									"rotationZ": -61.79999999999999,
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
															"time": 0.15616089689676937,
															"value": -2.425986213684083,
															"mode": 2
														},
														{
															"time": 1.2334327787935868,
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
															"time": 0.06330228283762085,
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
															"time": 0.5854943399428714,
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
															"time": 1.3660815930464891,
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
															"time": 0.4466964048811853,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9966964048811853,
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
								"instSpeed": [
									50,
									0,
									0
								]
							},
							"x": 0.9727449999999997,
							"y": -0.029776666666666673,
							"z": -0.6675449999999998,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.01,
							"rotationZ": -9.199999999999996,
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
												"range": 5,
												"power": 0.8
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
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"x": 0.03640499999999991,
							"y": -0.31479666666666667,
							"z": 0.9008949999999999,
							"scaleX": 0.7,
							"scaleY": 1.17,
							"scaleZ": 0.7,
							"rotationX": 103.90000000000003,
							"rotationY": -7.599999999999998,
							"rotationZ": -19.6,
							"time": 0.1152,
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
													"time": 0.5326762649248232,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5990566037735849,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.9988207547169812,
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
							"type": "object",
							"name": "StepRound",
							"x": -0.469325,
							"y": 0.032873333333333254,
							"z": -0.6573549999999998,
							"scaleX": 0.9999999999999999,
							"scaleY": 0.9999999999999999,
							"scaleZ": 0.9999999999999999,
							"rotationZ": 84.3,
							"children": [
								{
									"type": "object",
									"name": "Step1",
									"x": 0.23019499999999998,
									"y": 0.153605,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"rotationZ": 57.60000000000001,
									"children": [
										{
											"type": "polygon",
											"name": "Back_Sand_Stylised1",
											"z": 0.3,
											"scaleX": 5,
											"scaleY": 5.56,
											"scaleZ": 0.06,
											"rotationX": -12,
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
																	"time": -0.20520759550410034,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.5337762368520101,
																		"dt": 0.42926778498909995
																	}
																},
																{
																	"time": 0.6807189631257489,
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
															"time": -0.06905179003130657,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.3304553822970073,
															"value": 3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4665023907761046
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4665023907761046
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
															"time": -0.04478960583363201,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -3.216730645116172,
																"dt": -0.5298503198629724
															},
															"nextHandle": {
																"dv": 0.9,
																"dt": 0.14824532747268693
															}
														},
														{
															"time": 1.1407235136713967,
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
														"range": 1.5,
														"power": 0.8
													}
												}
											]
										},
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
													5,
													0,
													0
												]
											},
											"z": 0.26608,
											"scaleX": 0.9999999999999999,
											"scaleY": 0.9999999999999999,
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
												},
												{
													"type": "curve",
													"name": "position.x",
													"keys": [
														{
															"time": 0.1424731182795699,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5456989247311828,
															"value": 3.543997192382814,
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
									"name": "Step1-2",
									"x": -0.23019499999999993,
									"y": -0.15360500000000005,
									"scaleX": 0.4999999999999999,
									"scaleY": 0.4999999999999999,
									"scaleZ": 0.5,
									"rotationZ": 179.2,
									"children": [
										{
											"type": "polygon",
											"name": "Back_Sand_Stylised1",
											"z": 0.3,
											"scaleX": 5,
											"scaleY": 5.56,
											"scaleZ": 0.06,
											"rotationX": -12,
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
													},
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keys": [
																{
																	"time": 0.125,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.1693548387096774,
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
																	"time": -0.20520759550410034,
																	"value": 0.8948601617813111,
																	"mode": 1,
																	"prevHandle": {
																		"dv": -0.22616915345191968,
																		"dt": -0.039999999999999925
																	},
																	"nextHandle": {
																		"dv": -0.5337762368520101,
																		"dt": 0.42926778498909995
																	}
																},
																{
																	"time": 0.9965356352428664,
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
															"time": -0.06905179003130657,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.2221971555573115,
															"value": 3,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.4665023907761046
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.4665023907761046
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
															"time": -0.04478960583363201,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -3.216730645116172,
																"dt": -0.5298503198629724
															},
															"nextHandle": {
																"dv": 0.9,
																"dt": 0.14824532747268693
															}
														},
														{
															"time": 2.032465286931701,
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
														"range": 1.5,
														"power": 0.8
													}
												}
											]
										},
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
												"burstDelay": 0.8,
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
												],
												"warmUpTime": -0.15
											},
											"z": 0.26608,
											"scaleX": 0.9999999999999999,
											"scaleY": 0.9999999999999999,
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
												},
												{
													"type": "curve",
													"name": "position.x",
													"enabled": false,
													"keys": [
														{
															"time": 0.1424731182795699,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5456989247311828,
															"value": 3.543997192382814,
															"mode": 2
														}
													]
												}
											]
										}
									]
								},
								{
									"type": "polygon",
									"name": "SlashFoot",
									"x": 0.02697,
									"y": -0.1359,
									"z": 0.1146,
									"scaleX": 0.8,
									"scaleY": 0.8,
									"scaleZ": 0.8,
									"rotationX": 180,
									"rotationZ": 85.1,
									"kind": 1,
									"args": [
										24,
										316.36,
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
													"colorMask": 255
												}
											},
											"diffuseMap": "Fx/Alphas/T_Dust_02.png"
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
												"alpha": 5,
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													1,
													1
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
															"time": 0,
															"value": -0.3297719421386718,
															"mode": 0,
															"prevHandle": {
																"dv": 0.13258465162870775,
																"dt": -0.49999565977873545
															},
															"nextHandle": {
																"dv": -0.058228174209594696,
																"dt": 0.21958676229862867
															}
														},
														{
															"time": 0.5037353069711903,
															"value": 1.067704238891602,
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
															"time": 0,
															"value": 0,
															"mode": 1,
															"prevHandle": {
																"dv": 0.12898350993794783,
																"dt": -0.4998174849364267
															},
															"nextHandle": {
																"dv": 0.02907755692715791,
																"dt": 0.12119947235397059
															}
														},
														{
															"time": 0.21399281837497935,
															"value": 1.0416666666666667,
															"mode": 1,
															"prevHandle": {
																"dv": -0.9895833333333335,
																"dt": -0.04999999999999993
															},
															"nextHandle": {
																"dv": -0.18081948388205515,
																"dt": 0.09525853852892269
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
												"progress": 1,
												"saturation": 0.5,
												"width": 0.64,
												"uvScaleX": 1,
												"uvScaleY": 0.25,
												"texture": "Fx/noise/T_Noise_Grunge_01.png",
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
															"time": -0.20520759550410034,
															"value": 0.8948601617813111,
															"mode": 1,
															"prevHandle": {
																"dv": -0.22616915345191968,
																"dt": -0.039999999999999925
															},
															"nextHandle": {
																"dv": -0.5337762368520101,
																"dt": 0.42926778498909995
															}
														},
														{
															"time": 0.6807189631257489,
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
							"type": "polygon",
							"name": "Hit",
							"x": 0.76,
							"z": 0.5426450000000002,
							"scaleX": 2.4999999999999996,
							"scaleY": 1.34,
							"scaleZ": 0.29999999999999993,
							"rotationX": 5.04846739755607e-15,
							"rotationY": 19.090000000000007,
							"rotationZ": 70.91000000000001,
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
											"emissive": 10,
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
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
													"value": 0.01416666666666666,
													"mode": 1
												},
												{
													"time": 0.5239853546681795,
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
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
													"value": 0.9419580650329591,
													"mode": 1
												},
												{
													"time": 0.5978298136187778,
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
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.7330083622589029,
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
									"type": "curve",
									"name": "position.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
											"value": 0.1,
											"mode": 0
										},
										{
											"time": 0.47734674901517016,
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
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										},
										{
											"time": 1.0642158701488693,
											"value": 5,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Step2",
							"x": -0.8187249999999999,
							"y": 0.32222333333333325,
							"z": -0.6573549999999998,
							"scaleX": 0.49999999999999994,
							"scaleY": 0.49999999999999994,
							"scaleZ": 0.49999999999999994,
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
											10,
											0,
											0
										]
									},
									"x": 2.71394,
									"y": 0.55405,
									"z": 0.26608,
									"scaleX": 0.9999999999999997,
									"scaleY": 0.9999999999999997,
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
								},
								{
									"type": "polygon",
									"name": "Round_Sand_Stylised",
									"x": 3.26509,
									"y": 0.29869,
									"z": 0.3,
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 0.1,
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
															"time": 0.4098010135589636,
															"value": 0.8948601617813111,
															"mode": 1
														},
														{
															"time": 0.4098010135589636,
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
															"time": 1.2360031593612455,
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
													"time": 0.46133845087088954,
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
													"time": 0.4956125343612453,
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
													"time": 1.3645871437362491,
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
	]
}