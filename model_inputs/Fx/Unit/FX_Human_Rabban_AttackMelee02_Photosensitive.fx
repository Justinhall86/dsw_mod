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
					"type": "model",
					"name": "Male01_HarkonnenRabban",
					"source": "Character/Harkonnen/Unit/Rabban/Male01_HarkonnenRabban.fbx",
					"editorOnly": true,
					"scaleX": 2.8,
					"scaleY": 2.8,
					"scaleZ": 2.8,
					"animation": "Anim/Male01/Anim_Male01_AttackMelee03.fbx",
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Male01/Rabban/Anim_Male01_Rabban_AttackMelee02.fbx"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 1.36156,
					"y": -1.76708,
					"z": -2.0123,
					"scaleX": 3.97,
					"scaleZ": 3.87,
					"rotationX": -17.6,
					"rotationY": 10,
					"rotationZ": 1.4,
					"time": 0.245,
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
											"time": 0.5550000000000003,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7100000000000004,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.9004516601562502,
												"dt": -0.1200000000000001
											},
											"nextHandle": {
												"dv": -3.37047699629145,
												"dt": 0.4455894061747684
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
							"enabled": false,
							"props": {
								"useSourceUVs": true,
								"useScale": true,
								"wrap": true,
								"progress": 0.58,
								"saturation": 5,
								"width": 0.08,
								"uvScaleX": 0.1,
								"uvScaleY": 0.1,
								"texture": "Fx/noise/bluenoise_raw.png",
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
									0.2392156862745098,
									0.06666666666666667
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.6499999999999999,
											"value": 0.9466666666666667,
											"mode": 2
										},
										{
											"time": 0.69,
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
						"instScale": 10,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 2,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -1,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"speedFactor": 1.5
					},
					"x": 12.91602,
					"y": 1.41271,
					"z": 3.85493,
					"scaleX": 3,
					"scaleY": 3,
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
											0.7137254901960784,
											0.7137254901960784,
											0.7137254901960784
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
										"saturation": 1,
										"width": 1,
										"uvScaleX": 0.5,
										"uvScaleY": 1,
										"texture": "Fx/noise/T_Noise_Grunge_01.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.07,
											-0.05
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
					"name": "emitter",
					"enabled": false,
					"props": {
						"emitType": "Burst",
						"alignMode": "Screen",
						"instScale": 1.3,
						"instScale_rand": 0.3,
						"instRotation_rand": [
							0,
							0,
							180
						]
					},
					"x": 13.01063,
					"y": 1.08533,
					"z": 3.55738,
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
											"blend": "Add",
											"shadows": false,
											"culling": "None",
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
										"progress": 0.5,
										"saturation": 1,
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
											0,
											0
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