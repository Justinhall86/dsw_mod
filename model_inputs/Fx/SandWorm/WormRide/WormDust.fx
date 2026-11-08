{
	"type": "fx",
	"cullingRadius": 3,
	"children": [
		{
			"type": "polygon",
			"name": "polygon",
			"editorOnly": true,
			"locked": true,
			"z": 0.05,
			"scaleX": 10000,
			"scaleY": 10000,
			"scaleZ": 5,
			"color": -14869219,
			"kind": 0,
			"args": [
				0
			]
		},
		{
			"type": "object",
			"name": "FXRoot",
			"y": 8.86,
			"scaleX": 5,
			"scaleY": 5,
			"scaleZ": 5,
			"rotationZ": 90,
			"children": [
				{
					"type": "object",
					"name": "SmokeGroup",
					"x": 0.90606,
					"y": 0.58875,
					"z": 0.94937,
					"children": [
						{
							"type": "object",
							"name": "Smoke",
							"z": 0.10590999999999995,
							"scaleX": 1.3999999999999997,
							"scaleY": 1.4000000000000008,
							"scaleZ": 1.4000000000000004,
							"rotationX": 90,
							"rotationY": -30.000000000000004,
							"children": [
								{
									"type": "emitter",
									"name": "Fireball_Screen",
									"props": {
										"instScale_rand": 1,
										"maxCount": 200,
										"simulationSpace": "World",
										"animationSpeed": 0,
										"randomColor1": [
											1,
											1,
											1,
											1
										],
										"randomColor2": [
											1,
											0.24313725490196078,
											0.10980392156862745,
											1
										],
										"emitRate": 50,
										"instRotation_rand": [
											0,
											0,
											180
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
										"instScale": 9,
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.1,
											0.1,
											0.1
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.5,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instWorldAcceleration_rand": [
											0,
											0,
											0
										],
										"instSpeed_rand": [
											0,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"lifeTime": 1.5
									},
									"x": 0.01853,
									"y": -0.79386,
									"z": -0.01361,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationZ": 131.1,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"alphaKill": true,
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
														"alpha": 2
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0050000000000000044,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.039999999999999994,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.03710452735505736,
																		"dt": -0.03411451044810665
																	},
																	"nextHandle": {
																		"dv": -0.18333333333333335,
																		"dt": 0.16907950549334172
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.32
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.32
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
														"amount": 0.8,
														"color": [
															0.8823529411764706,
															0.8823529411764706,
															0.8823529411764706
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
														"progress": 0.25,
														"saturation": 0,
														"width": 0.4,
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
													"isInstance": true,
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
																		"dv": 0.4501476276915423,
																		"dt": -0.6144515117989549
																	},
																	"nextHandle": {
																		"dv": -0.33333333333333337,
																		"dt": 0.455
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2833333333333333,
																		"dt": -0.29500000000000004
																	},
																	"nextHandle": {
																		"dv": -0.40250763363430087,
																		"dt": 0.41908147737218393
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "width",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.0520769766684747,
																		"dt": -0.49993897601734766
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.6399999999999999
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
														"power": 0.5
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.7,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "fakeLight",
											"name": "fakeLight",
											"props": {},
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topIntensity": 0.42,
											"dirBrighten": true,
											"dirIntensity": 0.22
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
														"dv": -0.7952595244854048,
														"dt": -0.4182858537877781
													},
													"nextHandle": {
														"dv": 0.25666666666666665,
														"dt": 0.135
													}
												},
												{
													"time": 1,
													"value": 0.7,
													"mode": 0,
													"prevHandle": {
														"dv": 0.023333333333333317,
														"dt": -0.20500000000000007
													},
													"nextHandle": {
														"dv": -0.03059224177730227,
														"dt": 0.26877469561486866
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
					"type": "advancedDecal",
					"name": "advancedDecalSandFloor",
					"x": 0.06478,
					"y": 0.07709,
					"scaleX": 13,
					"scaleY": 15,
					"rotationZ": 90,
					"albedoMap": "Fx/Alphas/sand_gaussian.png",
					"normalMap": "Fx/DistortionMaps/sand-normal.png",
					"pbrMap": "Fx/DistortionMaps/SphereClean.png",
					"pbrStrength": 0,
					"fadeEnd": 0.32,
					"children": [
						{
							"type": "shader",
							"name": "AutoAlpha",
							"source": "shaders/AutoAlpha.hx",
							"props": {
								"scale": 3
							},
							"isInstance": true
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
								"texture": "Fx/Gradients/GradientSpice_2.png",
								"onDecal": true
							},
							"isInstance": true
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
								"texture": "Fx/Alphas/Spark.png",
								"onDecal": true
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "DissolveMap",
							"source": "shaders/DissolveMap.hx",
							"props": {
								"useSourceUVs": false,
								"useScale": false,
								"wrap": true,
								"progress": 0.59,
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/Alphas/sand.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									0
								]
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "WorldUV",
							"source": "shaders/WorldUV.hx",
							"props": {
								"useNormalMap": true,
								"onDecal": true,
								"scale": 0.02,
								"rotation": 0
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
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.2,
								"envColorSet": false
							},
							"isInstance": true
						},
						{
							"type": "shader",
							"name": "Fresnel",
							"source": "shaders/Fresnel.hx",
							"props": {
								"RGB": false,
								"ALPHA": true,
								"REVERSE": false,
								"bias": 0.74,
								"scale": 1,
								"power": 1,
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
					"type": "model",
					"name": "Sandworm",
					"source": "Character/Creatures/Sandworm/Sandworm.fbx",
					"scaleX": 0.3,
					"scaleY": 0.3,
					"scaleZ": 0.3,
					"rotationZ": 90,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Character/Creatures/Sandworm/Anim_SandWorm_Idle.fbx",
							"offset": 0.1
						}
					]
				},
				{
					"type": "advancedDecal",
					"name": "advancedDecal_WormSandBlend",
					"x": -0.07,
					"y": 0.19697,
					"scaleX": 10,
					"scaleY": 8,
					"scaleZ": 2,
					"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
					"fadePower": 0.5,
					"fadeEnd": 0.59,
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
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/T_circle.png"
							}
						},
						{
							"type": "shader",
							"name": "ColorSet",
							"source": "shaders/ColorSet.hx",
							"props": {
								"amount": 1,
								"color": [
									0.8823529411764706,
									0.8196078431372549,
									0.7568627450980392
								]
							}
						},
						{
							"type": "shader",
							"name": "EnvColorMult",
							"source": "shaders/EnvColorMult.hx",
							"props": {
								"sandBlend": 1,
								"sandColorSet": false,
								"envBlend": 1,
								"envColorSet": false
							}
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.advancedDecal_WhiteFlames",
					"target": "FXAnimation.FXRoot.Sandworm.root.Root",
					"positionOnly": true
				},
				{
					"type": "constraint",
					"name": "constraint",
					"enabled": false,
					"object": "FXAnimation.FXRoot.advancedDecalSandFloor",
					"target": "FXAnimation.FXRoot.Sandworm.root.Root.B_Spine06",
					"positionOnly": true
				},
				{
					"type": "curve",
					"name": "position.y",
					"enabled": false,
					"loop": true,
					"keys": [
						{
							"time": 0,
							"value": -50,
							"mode": 2
						},
						{
							"time": 3,
							"value": 20,
							"mode": 2
						}
					]
				}
			]
		}
	]
}