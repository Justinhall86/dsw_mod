{
	"type": "fx",
	"duration": 11,
	"cullingRadius": 200,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "lookAt",
					"name": "lookAt",
					"z": 140,
					"lockAxis": [
						0,
						0,
						0
					],
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"scaleX": 6,
							"scaleY": 6,
							"scaleZ": 6,
							"rotationX": 90,
							"rotationY": 180,
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
											"enableStencil": false,
											"textureWrap": true
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Alphas/SupplyDrop_test03albedo.png"
								},
								{
									"type": "shader",
									"name": "AlphaMap",
									"source": "shaders/AlphaMap.hx",
									"props": {
										"useSourceUVs": false,
										"wrap": true,
										"invert": false,
										"replace": false,
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/SupplyDrop_test03.png",
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
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 8.001025754429375e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.2372448979591837
													}
												},
												{
													"time": 0.5,
													"value": 1,
													"mode": 2
												},
												{
													"time": 9.247254013931531,
													"value": 1,
													"mode": 0
												},
												{
													"time": 10.368236922659706,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.016666666666666663,
														"dt": -1.3826976449715218
													},
													"nextHandle": {
														"dv": -0.012406274026611945,
														"dt": 1.0227749914107727
													}
												}
											]
										}
									]
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/Alphas/SupplyDrop_test03normal.png",
									"topBrighten": true,
									"topIntensity": 0.9,
									"topSpan": 0.33,
									"dirSpan": 0,
									"sandBlend": 0.05,
									"envBlend": 0.7
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 0.22,
										"color": [
											0.5215686274509804,
											0.3529411764705882,
											0.2549019607843137
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
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
													"time": 9.501326125773224,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 9.995529831140065,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.03333333333333344,
														"dt": -0.37886240829004514
													},
													"nextHandle": {
														"dv": -0.014527503975154689,
														"dt": 0.16468311302145025
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "rotation.x",
									"keyMode": 0,
									"loop": true,
									"keys": [
										{
											"time": 0.0049999999999999975,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.5,
											"value": 0.005,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3312135090049048
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33378649099509516
											}
										},
										{
											"time": 1.5,
											"value": -0.005,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.3333333333333333
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33152070268628603
											}
										},
										{
											"time": 2,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0.9333333333333333,
									"mode": 2
								},
								{
									"time": 10,
									"value": -145,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.y",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3312135090049048
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.33378649099509516
									}
								},
								{
									"time": 3,
									"value": -1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3333333333333333
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.33152070268628603
									}
								},
								{
									"time": 4.75,
									"value": 0,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"loop": true,
							"keys": [
								{
									"time": 0.0049999999999999975,
									"value": 0,
									"mode": 2
								},
								{
									"time": 1,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3312135090049048
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.33378649099509516
									}
								},
								{
									"time": 3,
									"value": -1,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -0.3333333333333333
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.33152070268628603
									}
								},
								{
									"time": 4.75,
									"value": 0,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "projection",
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "emitter",
							"name": "SandResiduel",
							"props": {
								"lifeTime": 2.4,
								"lifeTimeRand": 0.25,
								"speedFactor": 0.8,
								"warmUpTime": -7.5,
								"emitType": "Burst",
								"burstParticleCount": 3,
								"emitShape": "Cone",
								"emitAngle": 19.09,
								"emitSurface": true,
								"alignMode": "Screen",
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"animationSpeed": 0,
								"instScale": 30,
								"instSpeed": [
									15,
									0,
									0
								],
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instScale_rand": 5,
								"instSpeed_rand": [
									3,
									0,
									0
								],
								"instWorldSpeed": [
									0,
									0,
									-4
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-1
								],
								"randomColor1": [
									0.9803921568627451,
									0.9254901960784314,
									0.8980392156862745,
									1
								],
								"randomColor2": [
									0.7490196078431373,
									0.6705882352941176,
									0.6313725490196078,
									1
								]
							},
							"z": -2,
							"scaleX": 3,
							"scaleY": 10,
							"scaleZ": 10,
							"rotationY": -90,
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
													"textureWrap": true,
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true
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
															"value": 0.7,
															"mode": 2
														},
														{
															"time": 0.85,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.6533333333333333,
																"dt": -0.2350000000000001
															},
															"nextHandle": {
																"dv": -0.7068174305257382,
																"dt": 0.25423790230645144
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
													0.9764705882352941,
													0.9607843137254902,
													0.9490196078431372
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DepthBlend",
											"source": "shaders/DepthBlend.hx",
											"props": {
												"REVERSE": false,
												"range": 1.2,
												"power": 0.8
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
									"name": "instSpeed.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.9173338952643375,
												"dt": -0.34612783862841096
											},
											"nextHandle": {
												"dv": -1.1533247604966166,
												"dt": 0.1375675736137951
											}
										},
										{
											"time": 0.9903769144228197,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.012976087629794963,
												"dt": -0.6555012670999958
											},
											"nextHandle": {
												"dv": -0.012976087629794963,
												"dt": 0.6555012670999958
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "InstWorldSpeed.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -1.140345982142858,
												"dt": -0.13896948945309906
											},
											"nextHandle": {
												"dv": 0.7341459191045832,
												"dt": 0.08913588385340426
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
											"value": 0.012707392165911546,
											"mode": 0,
											"prevHandle": {
												"dv": -1.562544836391683,
												"dt": -0.057312053992565525
											},
											"nextHandle": {
												"dv": 0.8951335055594681,
												"dt": 0.03233660096897972
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.024099204996862578,
												"dt": -0.9873942064019231
											},
											"nextHandle": {
												"dv": 0.0055778337215589505,
												"dt": 0.265963721460112
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
					"name": "shadow",
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 20,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Gradients/circGrad05.jpg"
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
											0.32156862745098036,
											0.2,
											0.12549019607843137
										]
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1.5,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 3.1666666666666665
											}
										},
										{
											"time": 9.403192882379864,
											"value": 0.3,
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
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.75
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
												"dv": -0.06234950017576788,
												"dt": -0.49432963236550204
											},
											"nextHandle": {
												"dv": 0.4027852920818087,
												"dt": 3.246813631558181
											}
										},
										{
											"time": 9.10113501045984,
											"value": 0.7,
											"mode": 2
										},
										{
											"time": 9.258730421896376,
											"value": 0.7,
											"mode": 2
										},
										{
											"time": 10.243701743374713,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.006444156685378122,
												"dt": -0.6444983874665002
											},
											"nextHandle": {
												"dv": 0.006444156685378122,
												"dt": 0.6444983874665002
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
					"name": "logo",
					"enabled": false,
					"scaleX": 0.6,
					"scaleY": 0.6,
					"scaleZ": 0.6,
					"children": [
						{
							"type": "advancedDecal",
							"name": "logo",
							"scaleX": 12,
							"scaleY": 12,
							"scaleZ": 14.4,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Logo_SupplyDrop02.png"
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "outsidecircle",
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 20,
							"rotationZ": 90,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"renderMode": "BeforeTonemapping",
							"children": [
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 1,
										"vOffset": 1,
										"texture": "Fx/Alphas/T_Target1.png"
									},
									"isInstance": true
								},
								{
									"type": "curve",
									"name": "rotation.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.4949999999999999,
											"value": 0.99,
											"mode": 0,
											"prevHandle": {
												"dv": -0.125,
												"dt": -1.085
											},
											"nextHandle": {
												"dv": 0.0191555190995555,
												"dt": 0.1662699057841416
											}
										},
										{
											"time": 1.9999999999999998,
											"value": 1,
											"mode": 2
										},
										{
											"time": 4,
											"value": 1,
											"mode": 0
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
								"envBlend": 1,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "AlphaCycle",
							"source": "shaders/AlphaCycle.hx",
							"props": {
								"minAlpha": 0.3,
								"maxAlpha": 1,
								"frequency": 0.25
							}
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
												"dv": -0.04114912760556359,
												"dt": -0.49996190040761035
											},
											"nextHandle": {
												"dv": 0.03333333333333333,
												"dt": 0.405
											}
										},
										{
											"time": 0.5,
											"value": 1,
											"mode": 2
										},
										{
											"time": 9.273193858634004,
											"value": 1,
											"mode": 0
										},
										{
											"time": 9.983913095974566,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.33843773206693406
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.33843773206693406
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
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"scaleX": 4000,
			"scaleY": 4000,
			"scaleZ": 2,
			"color": -6127248,
			"kind": 0,
			"args": [
				0
			]
		}
	]
}