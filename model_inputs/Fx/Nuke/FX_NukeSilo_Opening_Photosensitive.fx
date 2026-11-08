{
	"type": "fx",
	"duration": 18,
	"cullingRadius": 200,
	"blendFactor": 1,
	"children": [
		{
			"type": "polygon",
			"name": "Floor",
			"editorOnly": true,
			"locked": true,
			"z": -0.5,
			"scaleX": 1000,
			"scaleY": 1000,
			"scaleZ": 1000,
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
			"scaleX": 8,
			"scaleY": 8,
			"scaleZ": 8,
			"rotationZ": 80,
			"children": [
				{
					"type": "model",
					"name": "NukeSilo",
					"source": "Structure/Buildings/NukeSilo/NukeSilo.fbx",
					"editorOnly": true,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Structure/Buildings/NukeSilo/Anim_NukeSilo_Opening.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "TopLights",
					"z": 0.15247,
					"children": [
						{
							"type": "polygon",
							"name": "polygon",
							"y": 0.62888,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
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
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
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
											0.21176470588235294,
											0.21176470588235294
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "frequency",
											"keys": [
												{
													"time": 2.99,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4.01,
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
							"type": "polygon",
							"name": "polygon",
							"x": 0.54498,
							"y": -0.31363,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": -120,
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
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
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
											0.21176470588235294,
											0.21176470588235294
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "frequency",
											"keys": [
												{
													"time": 2.99,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4.01,
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
							"type": "polygon",
							"name": "polygon",
							"x": -0.54771,
							"y": -0.3162,
							"scaleX": 0.34,
							"scaleY": 0.34,
							"scaleZ": 0.34,
							"rotationZ": 120,
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
											"emissive": 1,
											"alphaKill": true,
											"drawOrder": "100"
										}
									},
									"diffuseMap": "Fx/Alphas/NukeSilo_Lights.png"
								},
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 1
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
											0.21176470588235294,
											0.21176470588235294
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaCycle",
									"source": "shaders/AlphaCycle.hx",
									"enabled": false,
									"props": {
										"minAlpha": 0,
										"maxAlpha": 1,
										"frequency": 1
									},
									"children": [
										{
											"type": "curve",
											"name": "frequency",
											"enabled": false,
											"keys": [
												{
													"time": 2.99,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 3,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "frequency",
											"keys": [
												{
													"time": 2.99,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4,
													"value": 3,
													"mode": 2
												},
												{
													"time": 4.01,
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
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.5
							},
							"children": [
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0
										},
										{
											"time": 0.6687666101335888,
											"value": 1,
											"mode": 0
										},
										{
											"time": 4,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 4.079225330621559e-17,
												"dt": -0.05762613271233638
											},
											"nextHandle": {
												"dv": -4.079225330621559e-17,
												"dt": 0.05762613271233638
											}
										},
										{
											"time": 8.989235638806644,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.023464007015963004,
												"dt": -0.08822429066642856
											},
											"nextHandle": {
												"dv": 0.023464007015963004,
												"dt": 0.08822429066642856
											}
										}
									]
								}
							]
						},
						{
							"type": "shader",
							"name": "AlphaKill",
							"source": "shaders/AlphaKill.hx",
							"props": {
								"threshold": 0.5,
								"useRGB": false
							}
						}
					]
				},
				{
					"type": "object",
					"name": "SmokeSlow_Silo",
					"z": 0.010750000000000003,
					"children": [
						{
							"type": "model",
							"name": "NukeSilo_SmokeMesh",
							"source": "Fx/Meshes_Common/NukeSilo_SmokeMesh01.fbx",
							"z": -0.010750000000000003,
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
									"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
									"children": [
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.19,
												"saturation": 0.5,
												"width": 1,
												"uvScaleX": 2,
												"uvScaleY": 1,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0.5,
													1
												],
												"uvShiftSpeed": [
													0,
													0.4
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "saturation",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.24680184423432472,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00618505545406564,
																"dt": -0.4999952741690807
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 1.347320914318935
															}
														},
														{
															"time": 4.25947500209724,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.666502038392164
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.666502038392164
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
												"progress": 0.51,
												"saturation": 1,
												"width": 0.43,
												"uvScaleX": 1,
												"uvScaleY": 1,
												"texture": "Fx/Gradients/Gradient_Spotlight.png",
												"uvShift": [
													0,
													0.01
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
															"time": 0.45890731329533807,
															"value": 2,
															"mode": 0
														},
														{
															"time": 0.45890731329533807,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 1.063654079282624,
																"dt": -0.34442016191378355
															},
															"nextHandle": {
																"dv": -1.0343723052307716,
																"dt": 0.33390127007034476
															}
														},
														{
															"time": 1.4781848745627064,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.0028994942050044456,
																"dt": -0.10579810398020523
															},
															"nextHandle": {
																"dv": 0.0028994942050044456,
																"dt": 0.10579810398020523
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "saturation",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.24680184423432472,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.00618505545406564,
																"dt": -0.4999952741690807
															},
															"nextHandle": {
																"dv": -0.01666666666666672,
																"dt": 1.347320914318935
															}
														},
														{
															"time": 4.25947500209724,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.666502038392164
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.666502038392164
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
												"range": 1,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7725490196078432,
													0.7725490196078432,
													0.7725490196078432
												]
											},
											"isInstance": true
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
										},
										{
											"type": "shader",
											"name": "AlphaMult",
											"source": "shaders/AlphaMult.hx",
											"props": {
												"alpha": 1.5
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 0,
													"keys": [
														{
															"time": 0.45890731329533807,
															"value": 0,
															"mode": 0
														},
														{
															"time": 0.45890731329533807,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.009836558895743931,
																"dt": -0.4999868562075995
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.8612767531568415
															}
														},
														{
															"time": 2.9879983599743976,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 8.959394879628422e-17,
																"dt": -0.6665160995961867
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.8263128916174907
															}
														},
														{
															"time": 5.993888925697145,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.8813888888888889,
																"dt": -0.8799236845093317
															},
															"nextHandle": {
																"dv": -1.2726163369686092,
																"dt": 1.2709012995876028
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
							"name": "SmokeHole",
							"z": 0.11595,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 1.25,
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
									"name": "AnimatedTexture",
									"source": "h3d.shader.AnimatedTexture",
									"props": {
										"startFrame": 0,
										"texture": "Fx/Alphas/T_Smoke_4x4_07.png",
										"speed": 0.5,
										"frameDivision": [
											4,
											4
										],
										"totalFrames": 16,
										"startTime": 0,
										"loop": true,
										"useSourceUVs": true,
										"blendBetweenFrames": true
									}
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
													"time": 0,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.050795843676229066,
														"dt": -0.49984765386605534
													},
													"nextHandle": {
														"dv": -0.033626229993214296,
														"dt": 0.3308930604165608
													}
												},
												{
													"time": 2.0139540590785736,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.10890490517981988,
														"dt": -0.498382140380499
													},
													"nextHandle": {
														"dv": 0.10890490517981988,
														"dt": 0.498382140380499
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
											0.7725490196078432,
											0.7725490196078432,
											0.7725490196078432
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
										"range": 2,
										"power": 0.8
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topBrighten": true,
									"topIntensity": 0.73,
									"dirIntensity": 0.68,
									"dirSpan": 0.75,
									"envBlend": 0.5,
									"envColorSet": true
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
										"texture": "Fx/Gradients/circGrad3.jpg",
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
													"time": 0.2696165677468273,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0.009836558895743931,
														"dt": -0.4999868562075995
													},
													"nextHandle": {
														"dv": -0.016666666666666663,
														"dt": 0.8612767531568415
													}
												},
												{
													"time": 2.067060352725676,
													"value": 0.75,
													"mode": 0,
													"prevHandle": {
														"dv": 2.634010154822866e-17,
														"dt": -0.6665270135238968
													},
													"nextHandle": {
														"dv": 0.002820231119791683,
														"dt": 2.350792623963379
													}
												},
												{
													"time": 7.99184639603301,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.005555555555555536,
														"dt": -2.19654387456466
													},
													"nextHandle": {
														"dv": -0.001480591169906224,
														"dt": 0.7317412796231624
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
					"name": "advancedDecal_red",
					"enabled": false,
					"scaleX": 2.75,
					"scaleY": 2.75,
					"scaleZ": 2.2,
					"albedoMap": "Fx/Gradients/circGrad02.jpg",
					"renderMode": "BeforeTonemapping",
					"children": [
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
							}
						},
						{
							"type": "shader",
							"name": "AlphaCycle",
							"source": "shaders/AlphaCycle.hx",
							"props": {
								"minAlpha": 0,
								"maxAlpha": 1,
								"frequency": 1
							},
							"children": [
								{
									"type": "curve",
									"name": "frequency",
									"keys": [
										{
											"time": 2.99,
											"value": 1,
											"mode": 2
										},
										{
											"time": 3,
											"value": 3,
											"mode": 2
										},
										{
											"time": 4,
											"value": 3,
											"mode": 2
										},
										{
											"time": 4.01,
											"value": 0,
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
								"amount": 0.7,
								"ATTENUATE": true,
								"emissiveMap": null
							}
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
									"enabled": false,
									"keyMode": 1,
									"keys": [
										{
											"time": 4.014381273728578,
											"value": 0.8579819444444443,
											"mode": 0,
											"prevHandle": {
												"dv": 4.079225330621559e-17,
												"dt": -0.05762613271233638
											},
											"nextHandle": {
												"dv": -4.079225330621559e-17,
												"dt": 0.05762613271233638
											}
										},
										{
											"time": 6.998357520408404,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.023464007015963004,
												"dt": -0.08822429066642856
											},
											"nextHandle": {
												"dv": 0.023464007015963004,
												"dt": 0.08822429066642856
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "alpha",
									"keyMode": 1,
									"keys": [
										{
											"time": 4,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 4.079225330621559e-17,
												"dt": -0.05762613271233638
											},
											"nextHandle": {
												"dv": -4.079225330621559e-17,
												"dt": 0.05762613271233638
											}
										},
										{
											"time": 8.989235638806644,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.023464007015963004,
												"dt": -0.08822429066642856
											},
											"nextHandle": {
												"dv": 0.023464007015963004,
												"dt": 0.08822429066642856
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
					"name": "MissileLaunch",
					"scaleX": 0.05,
					"scaleY": 0.05,
					"scaleZ": 0.05,
					"children": [
						{
							"type": "subFX",
							"name": "FX_ProjectileTravel_Flare_Nuke",
							"source": "Fx/Projectiles/FX_ProjectileTravel_Flare_Nuke_Photosensitive.fx",
							"z": 1,
							"scaleX": 3.3000000000000003,
							"scaleY": 3.3000000000000003,
							"scaleZ": 3.3000000000000003,
							"rotationY": -89.99999999999999,
							"children": [
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 0.052076250971580196,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.062076250971580205,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.01,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "trails",
							"name": "trails_Big",
							"z": -5.02419,
							"startWidth": 2.5,
							"endWidth": 20,
							"lifetime": 3,
							"minSpeed": 0.01,
							"uvMode": "ELifetime",
							"uvRepeat": "ENone",
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
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
										"alpha": 0.4,
										"uScale": 6,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_RaysMask04.png"
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
										"progress": 0.8,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0.10546875,
														"color": -16777216
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
										},
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
											0.9803921568627451,
											0.9686274509803922,
											0.9686274509803922
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
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "trails",
							"name": "trails-Base",
							"z": -3.15549,
							"endWidth": 4,
							"lifetime": 0.4,
							"minSpeed": 0.001,
							"uvRepeat": "ENone",
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
											"drawOrder": "110",
											"emissive": 1
										}
									},
									"wrapRepeat": true,
									"diffuseMap": "Fx/Gradients/uGrad_inv.png"
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
										"alpha": 0.75,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Gradients/Cyl05u_A.jpg"
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
										"progress": 0.83,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.5,
										"texture": "Fx/noise/Smoke2-2.png",
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
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": false,
										"wrap": true,
										"progress": 0.7,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": {
											"type": "gradient",
											"data": {
												"stops": [
													{
														"position": 0,
														"color": -1
													},
													{
														"position": 1,
														"color": -16777216
													}
												],
												"resolution": 64,
												"isVertical": false,
												"interpolation": "Linear",
												"colorMode": 0
											}
										},
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
											1,
											0.4235294117647059,
											0.0784313725490196
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
								},
								{
									"type": "shader",
									"name": "DepthBlend",
									"source": "shaders/DepthBlend.hx",
									"props": {
										"REVERSE": false,
										"range": 3,
										"power": 0.8
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "emitter",
							"name": "Fireparticles",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"instScale_rand": 5,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									0.7215686274509804
								],
								"randomColor2": [
									1,
									1,
									1,
									0.25098039215686274
								],
								"useRandomColor": true,
								"instScale": 25,
								"speedFactor": 0.5,
								"frameCount": 16,
								"frameDivisionX": 8,
								"frameDivisionY": 8,
								"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
								"emitRate": 45,
								"emitRateMax": 10,
								"emitRateChangeDelay": 0.01,
								"emitShape": "Cone",
								"emitAngle": 5,
								"emitOrientation": "Normal",
								"lifeTime": 0.7,
								"simulationSpace": "World"
							},
							"z": -5.60965,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationY": 90,
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
													"textureWrap": true,
													"emissive": 12,
													"drawOrder": "100"
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
													"keyMode": 1,
													"keys": [
														{
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 1,
															"prevHandle": {
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -1.133678958897165,
																"dt": 0.11539410765966314
															}
														},
														{
															"time": 0.8711734693877551,
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
													0.45098039215686275,
													0.2901960784313725
												]
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "color.h",
													"keys": [
														{
															"time": 0,
															"value": 0.23721049502243374,
															"mode": 2
														},
														{
															"time": 0.4785549863120926,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1.0034217454930974,
															"value": 0,
															"mode": 2
														}
													]
												},
												{
													"type": "curve",
													"name": "color.s",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.18537414965986396
															}
														},
														{
															"time": 0.4785549863120926,
															"value": 0.038461538461538464,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16156462585034012
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16156462585034012
															}
														},
														{
															"time": 1.0034217454930974,
															"value": 0,
															"mode": 0
														}
													]
												},
												{
													"type": "curve",
													"name": "color.l",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0.6450980392156862,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.5
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.18537414965986396
															}
														},
														{
															"time": 0.4785549863120926,
															"value": 0.10196078431372549,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.16156462585034012
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.16156462585034012
															}
														},
														{
															"time": 1.0034217454930974,
															"value": 0.0392156862745098,
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
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
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
															"time": 0.8227040816326531,
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
												}
											]
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
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.3,
											"mode": 1,
											"prevHandle": {
												"dv": 0.04688100506692539,
												"dt": -0.3750480405353989
											},
											"nextHandle": {
												"dv": 0.7612500000000001,
												"dt": 0.2698950290930991
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.42874999999999996,
												"dt": -0.48474585354953803
											},
											"nextHandle": {
												"dv": 0.17500000000000004,
												"dt": -0.050000000000000044
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.4545454545454546,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.8,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.81,
											"value": 0.25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.00020188078094173295,
												"dt": -0.003332906748569197
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.5497267111803588
											}
										},
										{
											"time": 2.9882465273707397,
											"value": 1.2,
											"mode": 2
										},
										{
											"time": 3.4515405626220175,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "SmokeParticles",
							"props": {
								"lifeTime": 3,
								"alignMode": "Screen",
								"instScale_rand": 10,
								"maxCount": 100,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"simulationSpace": "World",
								"instStretch_rand": [
									0.1,
									0.1,
									0.1
								],
								"animationSpeed": 0.3,
								"randomColor1": [
									1,
									1,
									1,
									0.7215686274509804
								],
								"randomColor2": [
									1,
									1,
									1,
									0.25098039215686274
								],
								"useRandomColor": true,
								"instScale": 60,
								"speedFactor": 0.5,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Smoke_4x4_07.png",
								"emitRate": 30,
								"emitRateMin": 15,
								"emitRateMax": 20,
								"emitRateChangeDelay": 0.01,
								"instWorldAcceleration": [
									0,
									0,
									-5
								],
								"instWorldAcceleration_rand": [
									0,
									0,
									-0.25
								],
								"instWorldSpeed": [
									0,
									0,
									-2
								],
								"instWorldSpeed_rand": [
									0,
									0,
									-0.5
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"instSpeed_rand": [
									20,
									20,
									0
								]
							},
							"z": -5.38302,
							"scaleX": 0.5000000000000001,
							"scaleY": 0.5000000000000001,
							"scaleZ": 0.5,
							"rotationZ": 89.99999999999999,
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
													"textureWrap": true,
													"drawOrder": "110"
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
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.21240174849860172,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.008026215200176767,
																"dt": -0.14282186536974945
															},
															"nextHandle": {
																"dv": 0.008026215200176767,
																"dt": 0.14282186536974945
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7725490196078432,
													0.7725490196078432,
													0.7725490196078432
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
												"range": 1,
												"power": 0.8
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
												"progress": 0.5,
												"saturation": 1,
												"width": 0.5,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/perlin2.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0.01,
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
																"dv": 0.9543682199021406,
																"dt": -0.3946635495835917
															},
															"nextHandle": {
																"dv": -1.209090909090909,
																"dt": 0.5
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
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.5,
											"dirIntensity": 0.68,
											"dirSpan": 0.75,
											"envBlend": 0.5,
											"envColorSet": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.4,
											"mode": 1,
											"prevHandle": {
												"dv": 0.04688100506692539,
												"dt": -0.3750480405353989
											},
											"nextHandle": {
												"dv": 0.8604166666666668,
												"dt": 0.1134602018566169
											}
										},
										{
											"time": 1,
											"value": 1.5,
											"mode": 1,
											"prevHandle": {
												"dv": -0.032981262207031126,
												"dt": -0.6589060964056812
											},
											"nextHandle": {
												"dv": 0.17500000000000004,
												"dt": -0.050000000000000044
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1,
											"value": 0.4545454545454546,
											"mode": 2
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
												"dv": 2.2410254230966986,
												"dt": -0.4807619738204115
											},
											"nextHandle": {
												"dv": -1,
												"dt": 0.2145276750837054
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7364374277543048
											},
											"nextHandle": {
												"dv": -1.3320002637867279e-15,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instSpeed.y",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 2.2410254230966986,
												"dt": -0.4807619738204115
											},
											"nextHandle": {
												"dv": -1,
												"dt": 0.2145276750837054
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7364374277543048
											},
											"nextHandle": {
												"dv": -1.3320002637867279e-15,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "emitRate",
									"keyMode": 0,
									"keys": [
										{
											"time": 1.8,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.81,
											"value": 0.25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.00020188078094173295,
												"dt": -0.003332906748569197
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.5497267111803588
											}
										},
										{
											"time": 2.9882465273707397,
											"value": 1.2,
											"mode": 2
										},
										{
											"time": 3.4515405626220175,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "model",
							"name": "AirResistanceMesh",
							"source": "Fx/Meshes_Common/CylinderCone_StraightUV.fbx",
							"enabled": false,
							"z": 11.79352,
							"scaleX": 1.25,
							"scaleY": 1.25,
							"scaleZ": 4,
							"rotationX": 180,
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
											"drawOrder": "110",
											"emissive": 1,
											"alphaKill": true
										}
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
										"uvScaleY": 0.8,
										"texture": "Fx/noise/T_Noise_Water_04.png",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											1,
											0
										]
									}
								},
								{
									"type": "shader",
									"name": "DissolveMap_gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": true,
										"useScale": true,
										"wrap": true,
										"progress": 0.21,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.8,
										"texture": "Fx/Gradients/Cyl05u_A.jpg",
										"uvShift": [
											0,
											0
										],
										"uvShiftSpeed": [
											0.1,
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
											1,
											0.8980392156862745,
											0.5843137254901961
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "color.h",
											"keys": [
												{
													"time": 4.268252269562775,
													"value": 0.23721049502243374,
													"mode": 2
												},
												{
													"time": 5.268252269562775,
													"value": 0.7853981633974483,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.s",
											"keys": [
												{
													"time": 4.268252269562775,
													"value": 1,
													"mode": 2
												},
												{
													"time": 5.268252269562775,
													"value": 0.8947368421052632,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "color.l",
											"keys": [
												{
													"time": 4.268252269562775,
													"value": 0.6450980392156862,
													"mode": 2
												},
												{
													"time": 5.268252269562775,
													"value": 0.8509803921568627,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.z",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0.5,
											"mode": 2
										},
										{
											"time": 0.05,
											"value": 1.5,
											"mode": 2
										},
										{
											"time": 0.1,
											"value": 0.5,
											"mode": 2
										}
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
											"keyMode": 0,
											"keys": [
												{
													"time": 3.2720888898683747,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.8537390160511498
													}
												},
												{
													"time": 7.991447865640069,
													"value": 1,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "Fresnel",
									"source": "shaders/Fresnel.hx",
									"props": {
										"RGB": false,
										"ALPHA": true,
										"REVERSE": true,
										"bias": 0,
										"scale": 0.61,
										"power": 1,
										"color": [
											1,
											0,
											0
										]
									}
								},
								{
									"type": "curve",
									"name": "visibility",
									"keys": [
										{
											"time": 1.1070762509715804,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.1170762509715804,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7,
											"value": 1,
											"mode": 2
										},
										{
											"time": 7.01,
											"value": 0,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "FlareColored_side",
							"enabled": false,
							"props": {
								"alignMode": "Screen",
								"alignLockAxis": "Z",
								"burstDelay": 0.05,
								"instScale": 90,
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
								"randomColor1": [
									0.48627450980392156,
									0.48627450980392156,
									0.48627450980392156,
									1
								],
								"emitType": "Burst",
								"instRotation": [
									-35,
									90,
									0
								],
								"lifeTime": 2,
								"warmUpTime": -4
							},
							"z": -6,
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivBot_NoVrtx.fbx",
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
													"colorMask": 255,
													"depthTest": "LessEqual",
													"drawOrder": "100",
													"emissive": 0.5
												}
											},
											"diffuseMap": "Fx/Gradients/T_circleGradient_color04.png"
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
												"texture": "Fx/Alphas/T_Boquet_straight_circle02.png"
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
																"dv": 0.13831140421273472,
																"dt": -0.4997534846094124
															},
															"nextHandle": {
																"dv": -0.016666666666666663,
																"dt": 0.061224489795918366
															}
														},
														{
															"time": 0.07312925170068027,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9994830486111846,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.0002777777777778767,
																"dt": -0.3787347492914568
															},
															"nextHandle": {
																"dv": -7.535310263240957e-16,
																"dt": 0.30878459897016813
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
												"range": 10,
												"power": 0.8
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 0.7,
												"color": [
													1,
													0.6980392156862745,
													0.6980392156862745
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.95,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24752260216006414,
												"dt": -0.4084304599834715
											},
											"nextHandle": {
												"dv": 0.07502654127000485,
												"dt": 0.12414965986394558
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.7589285714285714
											},
											"nextHandle": {
												"dv": -1.0668034339239163e-16,
												"dt": 0.3333333333333333
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"enabled": false,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1,
											"value": 2,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "instStretch.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 9.981460469115423e-16,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0.0019819182719487127,
												"dt": 0.6683673469387755
											}
										},
										{
											"time": 1,
											"value": 1.25,
											"mode": 0,
											"prevHandle": {
												"dv": -0.24583333333333335,
												"dt": -0.25237344661537464
											},
											"nextHandle": {
												"dv": 0.2679703736077761,
												"dt": 0.27587786660960656
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.x",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 15,
											"mode": 0,
											"prevHandle": {
												"dv": 0.2765057500272305,
												"dt": -0.49999627320396384
											},
											"nextHandle": {
												"dv": -0.4166666666666661,
												"dt": 0.7534446588584357
											}
										},
										{
											"time": 1,
											"value": -20,
											"mode": 2
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "DirectionalExplo",
							"enabled": false,
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 25,
							"children": [
								{
									"type": "emitter",
									"name": "Fireball_Screen",
									"props": {
										"instScale_rand": 0.6,
										"maxCount": 5,
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
										"instScale": 2.25,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 3,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.5,
										"alignMode": "Screen",
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
											0.2,
											0.05,
											0.05
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -4.3,
										"lifeTime": 1.75,
										"burstDelay": 0.15,
										"instSpeed": [
											1,
											0,
											0
										]
									},
									"rotationY": 90,
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
															"textureWrap": true,
															"emissive": 12,
															"drawOrder": "120"
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
																	"time": 0.039999999999999994,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.002592191728735997,
																		"dt": -0.03499458833793611
																	},
																	"nextHandle": {
																		"dv": -0.06666666666666665,
																		"dt": 0.8999999999999999
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.45098039215686275,
															0.2901960784313725
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
														"range": 1.5,
														"power": 0.8
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
														"progress": 0.5,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_02.png",
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
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.05166666666666666
													}
												},
												{
													"time": 0.05499999999999999,
													"value": -0.509348731270885,
													"mode": 0,
													"prevHandle": {
														"dv": -0.6178478332448459,
														"dt": -0.024810868515554432
													},
													"nextHandle": {
														"dv": 0.8715807006116155,
														"dt": 0.03500000000000003
													}
												},
												{
													"time": 0.09499999999999999,
													"value": 0.3,
													"mode": 0,
													"prevHandle": {
														"dv": -0.07664157271676325,
														"dt": -0.059883603739303806
													},
													"nextHandle": {
														"dv": 0.07664157271676325,
														"dt": 0.059883603739303806
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.1819155871944269,
														"dt": -0.38
													},
													"nextHandle": {
														"dv": 0.12673911289324527,
														"dt": 0.2647429153388605
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
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
													"time": 0.05499999999999999,
													"value": -0.1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.8443206213014296,
														"dt": -0.029951523016929625
													},
													"nextHandle": {
														"dv": 0.18449230897139407,
														"dt": 0.008456141690444938
													}
												},
												{
													"time": 0.09499999999999999,
													"value": 0.11,
													"mode": 0,
													"prevHandle": {
														"dv": -0.025098634056240913,
														"dt": -0.03366778512128249
													},
													"nextHandle": {
														"dv": 0.0943321220257726,
														"dt": 0.1258951788926143
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.15684030085262413,
														"dt": -0.3092003969818111
													},
													"nextHandle": {
														"dv": 0.15684030085262413,
														"dt": 0.3092003969818111
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
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
													"time": 0.05499999999999999,
													"value": -0.1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.8443206213014296,
														"dt": -0.029951523016929625
													},
													"nextHandle": {
														"dv": 0.18449230897139407,
														"dt": 0.008456141690444938
													}
												},
												{
													"time": 0.09499999999999999,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 1.6201384320482378e-17,
														"dt": -0.03429054953860402
													},
													"nextHandle": {
														"dv": 0.016971607377006523,
														"dt": 0.25400877929744714
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.15684030085262413,
														"dt": -0.3092003969818111
													},
													"nextHandle": {
														"dv": 0.15684030085262413,
														"dt": 0.3092003969818111
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": -0.01922277967023303,
														"dt": 0.023378578517532344
													}
												},
												{
													"time": 0.026718375448608393,
													"value": -0.1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.8443206213014296,
														"dt": -0.029951523016929625
													},
													"nextHandle": {
														"dv": 0.18449230897139407,
														"dt": 0.008456141690444938
													}
												},
												{
													"time": 0.03673776624183654,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 1.6201384320482378e-17,
														"dt": -0.03429054953860402
													},
													"nextHandle": {
														"dv": 0.016971607377006523,
														"dt": 0.25400877929744714
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.15684030085262413,
														"dt": -0.3092003969818111
													},
													"nextHandle": {
														"dv": 0.15684030085262413,
														"dt": 0.3092003969818111
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keyMode": 1,
											"keys": [
												{
													"time": 0.08852400946674345,
													"value": 0,
													"mode": 0
												},
												{
													"time": 0.09852400946674345,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.003333333333333332
													},
													"nextHandle": {
														"dv": -1.0697547013700803,
														"dt": 0.07180563401813506
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.0011663786468388282,
														"dt": -0.8079616764631272
													},
													"nextHandle": {
														"dv": -1.3836255747969965e-15,
														"dt": 0.7980750042703325
													}
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "DirectionalSmoke_Screen",
									"props": {
										"instScale_rand": 0.75,
										"maxCount": 5,
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
										"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
										"instScale": 9,
										"emitType": "Burst",
										"instStretch_rand": [
											0,
											0,
											0
										],
										"burstParticleCount": 3,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.3,
										"alignMode": "Screen",
										"instSpeed": [
											1,
											0,
											0
										],
										"instWorldSpeed_rand": [
											0,
											0,
											0
										],
										"instWorldAcceleration_rand": [
											0.2,
											0.2,
											0
										],
										"instSpeed_rand": [
											0.1,
											0,
											0
										],
										"instAcceleration_rand": [
											0,
											0,
											0
										],
										"warmUpTime": -4.5,
										"lifeTime": 5
									},
									"z": -0.1,
									"rotationY": 90,
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
															"textureWrap": true,
															"drawOrder": "110"
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
														"scale": 2
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.6
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
																		"dv": 0.029812589848475162,
																		"dt": -0.03384131820637717
																	},
																	"nextHandle": {
																		"dv": -0.6166666666666667,
																		"dt": 0.7
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
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															0.18823529411764706,
															0.18823529411764706,
															0.18823529411764706
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.45769096393974473,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.45769096393974473,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.8941176470588235,
																	"mode": 2
																},
																{
																	"time": 0.45769096393974473,
																	"value": 0.18823529411764706,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.028431372549019618,
																		"dt": -0.2844407120529487
																	},
																	"nextHandle": {
																		"dv": -0.028431372549019618,
																		"dt": 0.2844407120529487
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
															0.8823529411764706,
															0.8823529411764706,
															0.8823529411764706
														]
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "color.h",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8951757027112968,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.s",
															"enabled": false,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.8951757027112968,
																	"value": 0,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "color.l",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.4156862745098039,
																	"mode": 2
																},
																{
																	"time": 0.8951757027112968,
																	"value": 0.8823529411764706,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.310676295230481
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.310676295230481
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
														"range": 3,
														"power": 0.8
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
														"progress": 0.5,
														"saturation": 0.1,
														"width": 1,
														"uvScaleX": 0.5,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/causticTexture_03-2-Blured.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0.05,
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
																		"dv": 0.17597127610376737,
																		"dt": -0.6268976711196711
																	},
																	"nextHandle": {
																		"dv": -0.1333333333333333,
																		"dt": 0.47500000000000003
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.009090909090909038,
																		"dt": -0.4642857142857143
																	},
																	"nextHandle": {
																		"dv": 0.008539703073546545,
																		"dt": 0.4361348355418391
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
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.2,
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
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
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
													"time": 0.05499999999999999,
													"value": -0.509348731270885,
													"mode": 0,
													"prevHandle": {
														"dv": -0.6178478332448459,
														"dt": -0.024810868515554432
													},
													"nextHandle": {
														"dv": 0.8715807006116155,
														"dt": 0.03500000000000003
													}
												},
												{
													"time": 0.09499999999999999,
													"value": 0.3300049349567332,
													"mode": 0,
													"prevHandle": {
														"dv": -0.09186223587130012,
														"dt": -0.05987522403665296
													},
													"nextHandle": {
														"dv": 0.636704555180494,
														"dt": 0.4140681559183458
													}
												},
												{
													"time": 1,
													"value": 1.01469963255798,
													"mode": 0,
													"prevHandle": {
														"dv": -0.1819155871944269,
														"dt": -0.38
													},
													"nextHandle": {
														"dv": 0.12673911289324527,
														"dt": 0.2647429153388605
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
														"dv": 9.844611217620471,
														"dt": -1.115599254899861
													},
													"nextHandle": {
														"dv": -1.0137212958304187,
														"dt": 0.11377628482117949
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.013721295830418673,
														"dt": -0.7155592879470513
													},
													"nextHandle": {
														"dv": 0.013721295830418673,
														"dt": 0.7155592879470513
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
													"time": 0.006564640132450452,
													"value": -0.02994592132461371,
													"mode": 0,
													"prevHandle": {
														"dv": -0.13096657557957922,
														"dt": -0.4999039108283623
													},
													"nextHandle": {
														"dv": 0.0292370656248509,
														"dt": 0.11159888225165769
													}
												},
												{
													"time": 0.10284602874172374,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.3297348902657158,
														"dt": -0.011217552453336404
													},
													"nextHandle": {
														"dv": -0.9714717900749119,
														"dt": 0.03282320066225225
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.05776527554993893,
														"dt": -0.7943079425165525
													},
													"nextHandle": {
														"dv": -0.05267529339841443,
														"dt": 0.7155491642992251
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
													"mode": 0,
													"prevHandle": {
														"dv": -0.24133283225696386,
														"dt": -0.49865381264516817
													},
													"nextHandle": {
														"dv": 0.0850991555437805,
														"dt": 0.17583607654182284
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00014240352623484664,
														"dt": -0.7284884112221853
													},
													"nextHandle": {
														"dv": -4.309282354444261e-16,
														"dt": 0.2673055213584389
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0.012707392165911546,
													"mode": 1,
													"prevHandle": {
														"dv": 8.26940216559601e-16,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0.04534643709761499,
														"dt": 0.16982163526046534
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.00014240352623484664,
														"dt": -0.7284884112221853
													},
													"nextHandle": {
														"dv": -4.309282354444261e-16,
														"dt": 0.2673055213584389
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instAcceleration.x",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.006564640132450452,
													"value": -0.02994592132461371,
													"mode": 0,
													"prevHandle": {
														"dv": -0.13096657557957922,
														"dt": -0.4999039108283623
													},
													"nextHandle": {
														"dv": 0.0292370656248509,
														"dt": 0.11159888225165769
													}
												},
												{
													"time": 0.10284602874172374,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.3297348902657158,
														"dt": -0.011217552453336404
													},
													"nextHandle": {
														"dv": -0.9714717900749119,
														"dt": 0.03282320066225225
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.05776527554993893,
														"dt": -0.7943079425165525
													},
													"nextHandle": {
														"dv": -0.05267529339841443,
														"dt": 0.7155491642992251
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instAcceleration.y",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.006564640132450452,
													"value": -0.02994592132461371,
													"mode": 0,
													"prevHandle": {
														"dv": -0.13096657557957922,
														"dt": -0.4999039108283623
													},
													"nextHandle": {
														"dv": 0.0292370656248509,
														"dt": 0.11159888225165769
													}
												},
												{
													"time": 0.10284602874172374,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.3297348902657158,
														"dt": -0.011217552453336404
													},
													"nextHandle": {
														"dv": -0.9714717900749119,
														"dt": 0.03282320066225225
													}
												},
												{
													"time": 1,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.05776527554993893,
														"dt": -0.7943079425165525
													},
													"nextHandle": {
														"dv": -0.05267529339841443,
														"dt": 0.7155491642992251
													}
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"enabled": false,
							"keyMode": 1,
							"keys": [
								{
									"time": 0.7477,
									"value": -0.3,
									"mode": 0
								},
								{
									"time": 2.987875537196106,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.09784745413959905,
										"dt": -0.7565684674946427
									},
									"nextHandle": {
										"dv": 0.000445165785363244,
										"dt": 3.3596327021829433
									}
								},
								{
									"time": 6.987875537196106,
									"value": 15,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1
									}
								}
							]
						},
						{
							"type": "curve",
							"name": "position.z",
							"keyMode": 1,
							"keys": [
								{
									"time": 0.7477,
									"value": -0.4,
									"mode": 0
								},
								{
									"time": 2.987875537196106,
									"value": 0,
									"mode": 1,
									"prevHandle": {
										"dv": -0.09784745413959905,
										"dt": -0.7565684674946427
									},
									"nextHandle": {
										"dv": 0.000445165785363244,
										"dt": 3.3596327021829433
									}
								},
								{
									"time": 6.987875537196106,
									"value": 19,
									"mode": 0,
									"prevHandle": {
										"dv": 0,
										"dt": -1
									},
									"nextHandle": {
										"dv": 0,
										"dt": 1
									}
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "DustCloud01",
					"z": -0.4,
					"scaleX": 0.65,
					"scaleY": 0.65,
					"scaleZ": 0.65,
					"children": [
						{
							"type": "emitter",
							"name": "Dust_L",
							"props": {
								"instScale_rand": 3,
								"animationSpeed": 0.01,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 12,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 7,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 30,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									20,
									0,
									0
								],
								"seedGroup": 2,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitAngle": 180,
								"warmUpTime": -5.2,
								"emitDuration": 50,
								"burstDelay": 1.5,
								"speedFactor": 1.5
							},
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
												"alpha": 0.35
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
																"dv": -3.0422716342761236,
																"dt": -0.34988109631104786
															},
															"nextHandle": {
																"dv": 0.23722222222222222,
																"dt": 0.027998637832460843
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323237,
																"dt": -0.09131785224377817
															},
															"nextHandle": {
																"dv": 0.009064468553733966,
																"dt": 0.050212252590299336
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323293,
																"dt": -0.3893833383964368
															},
															"nextHandle": {
																"dv": 0.009046803712101453,
																"dt": 0.21392254723381063
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
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 0.75,
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
												"range": 4,
												"power": 0.8
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
													0.8549019607843137,
													0.8156862745098039,
													0.7764705882352941
												]
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.45,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.4,
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
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0036283420503460395,
												"dt": -0.6998431890792185
											},
											"nextHandle": {
												"dv": -8.705943411311192e-16,
												"dt": 0.6028384422753759
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0027065579383954708,
												"dt": -0.6592770655829049
											},
											"nextHandle": {
												"dv": -0.00247773272334058,
												"dt": 0.6028416630865135
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 1,
											"prevHandle": {
												"dv": 0.01248450392811181,
												"dt": -0.098262780692611
											},
											"nextHandle": {
												"dv": -0.09132161958898322,
												"dt": 0.8380236580990013
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.356918913737165,
												"dt": 0
											},
											"nextHandle": {
												"dv": 2.1033187541742975,
												"dt": 0.00013315261651293732
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 221.9013970026372,
												"dt": -3.3553253116370656
											},
											"nextHandle": {
												"dv": -14.166666666666666,
												"dt": 0.21421124828532234
											}
										},
										{
											"time": 1,
											"value": -15,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust_R",
							"props": {
								"instScale_rand": 3,
								"animationSpeed": 0.01,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 2,
								"emitSurface": true,
								"instSpeed_rand": [
									2,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 12,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 7,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 30,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									20,
									0,
									0
								],
								"seedGroup": 2,
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"emitAngle": 180,
								"warmUpTime": -5.2,
								"speedFactor": 1.5
							},
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
												"alpha": 0.35
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
																"dv": -3.0422716342761236,
																"dt": -0.34988109631104786
															},
															"nextHandle": {
																"dv": 0.23722222222222222,
																"dt": 0.027998637832460843
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323237,
																"dt": -0.09131785224377817
															},
															"nextHandle": {
																"dv": 0.009064468553733966,
																"dt": 0.050212252590299336
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016482323232323293,
																"dt": -0.3893833383964368
															},
															"nextHandle": {
																"dv": 0.009046803712101453,
																"dt": 0.21392254723381063
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
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 0.75,
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
												"range": 4,
												"power": 0.8
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
													0.8549019607843137,
													0.8156862745098039,
													0.7764705882352941
												]
											},
											"isInstance": true
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.45,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.4,
											"envBlend": 0.5
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
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.01666666666666672,
												"dt": -0.6387434616680792
											},
											"nextHandle": {
												"dv": 0.015718886330311054,
												"dt": 0.6028325475085824
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
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0036283420503460395,
												"dt": -0.6998431890792185
											},
											"nextHandle": {
												"dv": -8.705943411311192e-16,
												"dt": 0.6028384422753759
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 0.0027065579383954708,
												"dt": -0.6592770655829049
											},
											"nextHandle": {
												"dv": -0.00247773272334058,
												"dt": 0.6028416630865135
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.8,
											"mode": 1,
											"prevHandle": {
												"dv": 0.01248450392811181,
												"dt": -0.098262780692611
											},
											"nextHandle": {
												"dv": -0.09132161958898322,
												"dt": 0.8380236580990013
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.356918913737165,
												"dt": 0
											},
											"nextHandle": {
												"dv": 2.1033187541742975,
												"dt": 0.00013315261651293732
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -153.9279819373795,
												"dt": -3.3948624322805303
											},
											"nextHandle": {
												"dv": 9.900544932515597,
												"dt": 0.22407796635277202
											}
										},
										{
											"time": 1,
											"value": 15,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "model",
					"name": "SmokeFloor_mesh",
					"source": "Fx/Meshes_Common/DiskFlatStraight01.fbx",
					"z": 0.30000000000000004,
					"scaleX": 5,
					"scaleY": 5,
					"scaleZ": 5,
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
									"colorMask": 255
								}
							},
							"diffuseMap": "Fx/Gradients/z_FillWhite.jpg",
							"children": [
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
										"texture": "Fx/Gradients/Cyl01u_A.jpg"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 5.172398522980192,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.235927256545748,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.954671027308636
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.954671027308636
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
										"progress": 0.36,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 0.25,
										"texture": "Fx/noise/T_Fire.png",
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
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
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
													"time": 3.775789835619424,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.003508648383247387,
														"dt": -0.4999936232216757
													},
													"nextHandle": {
														"dv": 0.008383268754121598,
														"dt": 1.1965899333409389
													}
												},
												{
													"time": 6.674786607697283,
													"value": 0.5,
													"mode": 2
												},
												{
													"time": 12.025805262117945,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0023910182595263674,
														"dt": -1.013391874636774
													},
													"nextHandle": {
														"dv": -1.6650746572083001e-16,
														"dt": 0.6627252119324963
													}
												}
											]
										}
									]
								},
								{
									"type": "shader",
									"name": "DissolveMap_Gradient",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.55,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 0.5,
										"texture": "Fx/Gradients/vGrad_inv.jpg",
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
											0.8549019607843137,
											0.8156862745098039,
											0.7764705882352941
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.2,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
									},
									"isInstance": true
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
									"time": 3.4512505878936466,
									"value": 0.25,
									"mode": 0,
									"prevHandle": {
										"dv": 1.600205150885875e-15,
										"dt": -0.5
									},
									"nextHandle": {
										"dv": 0,
										"dt": 0.6262755102040817
									}
								},
								{
									"time": 4.451250587893647,
									"value": 1,
									"mode": 0,
									"prevHandle": {
										"dv": -0.7359630417310866,
										"dt": -0.23224452400300633
									},
									"nextHandle": {
										"dv": 0.9649157694683523,
										"dt": 0.3022684430246276
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
					"name": "SmokeCloud",
					"z": 0.36,
					"scaleX": 0.7,
					"scaleY": 0.7,
					"scaleZ": 0.7,
					"children": [
						{
							"type": "emitter",
							"name": "Dust_R",
							"props": {
								"instScale_rand": 2,
								"animationSpeed": 0.01,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitSurface": true,
								"instSpeed_rand": [
									0.2,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 7,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 8,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									8,
									0,
									0
								],
								"seedGroup": 2,
								"instAcceleration": [
									0,
									0,
									0.5
								],
								"instAcceleration_rand": [
									0,
									0,
									0.1
								],
								"emitAngle": 150,
								"warmUpTime": -3.7,
								"emitDuration": 50,
								"burstDelay": 1.5,
								"speedFactor": 0.7
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": 90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -23.189889242182407,
																"dt": -0.28977503660331055
															},
															"nextHandle": {
																"dv": 1.1326797123854366,
																"dt": 0.014304442805171833
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 1,
															"prevHandle": {
																"dv": 0.009064468553734106,
																"dt": -0.12276957500670424
															},
															"nextHandle": {
																"dv": -0.05827345639241999,
																"dt": 0.25322009210623775
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05527291324696937,
																"dt": -0.6747448979591837
															},
															"nextHandle": {
																"dv": -0.05527291324696937,
																"dt": 0.6747448979591837
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -21.71788833045742,
																"dt": -1.0703742298131396
															},
															"nextHandle": {
																"dv": 0.9175302479731284,
																"dt": 0.04485923833819242
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 1,
															"prevHandle": {
																"dv": -0.05455370624347011,
																"dt": -0.08412795297914331
															},
															"nextHandle": {
																"dv": -0.05827345639241999,
																"dt": 0.25322009210623775
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05527291324696937,
																"dt": -0.6747448979591837
															},
															"nextHandle": {
																"dv": -0.05527291324696937,
																"dt": 0.6747448979591837
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
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 0.75,
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
												"range": 3,
												"power": 0.8
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
													0.8549019607843137,
													0.8156862745098039,
													0.7764705882352941
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													0.5
												],
												"alpha": 0.5,
												"MULTIPLY": true,
												"color": [
													0.6549019607843137,
													0.615686274509804,
													0.5686274509803921,
													1
												],
												"mask": "Fx/noise/Water_03.png",
												"UVOffset": [
													0,
													0
												]
											}
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.25,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.2,
											"envBlend": 0.5,
											"children": [
												{
													"type": "curve",
													"name": "sandBlend",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 1.951642717035785e-16,
																"dt": -0.5000466393279532
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.7466729480869408
															}
														},
														{
															"time": 0.9987244897959183,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.8703703703703703,
																"dt": -0.1852286708685119
															},
															"nextHandle": {
																"dv": 1.0073932782131654,
																"dt": 0.21521484192810764
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "sandBlend",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.7185579310857965,
																"dt": -0.43124811440283806
															},
															"nextHandle": {
																"dv": 0.9033269751959244,
																"dt": 0.5421386890181691
															}
														},
														{
															"time": 0.9987244897959183,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.029759915530303438,
																"dt": -0.5272995428235974
															},
															"nextHandle": {
																"dv": 0.029759915530303438,
																"dt": 0.5272995428235974
															}
														}
													]
												}
											]
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
												"dv": 2.2520656034216806,
												"dt": -0.3772293706598522
											},
											"nextHandle": {
												"dv": -0.828861737794305,
												"dt": 0.13904685383861598
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.015213416891424247,
												"dt": -0.515953146161384
											},
											"nextHandle": {
												"dv": 0.019107491596054956,
												"dt": 0.5819152448582862
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.1158193827784832,
												"dt": -0.07764119888199704
											},
											"nextHandle": {
												"dv": -0.97754863929894,
												"dt": 0.024242297509352445
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02853471978328992,
												"dt": -0.602201709020346
											},
											"nextHandle": {
												"dv": 0.02853471978328992,
												"dt": 0.602201709020346
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 1,
											"prevHandle": {
												"dv": 0.01248450392811181,
												"dt": -0.098262780692611
											},
											"nextHandle": {
												"dv": 0.3955237012855743,
												"dt": 0.14027147110519406
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04662014920911317,
												"dt": -0.72947644858284
											},
											"nextHandle": {
												"dv": 0.04662014920911317,
												"dt": 0.72947644858284
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 221.9013970026372,
												"dt": -3.3553253116370656
											},
											"nextHandle": {
												"dv": -14.166666666666666,
												"dt": 0.21421124828532234
											}
										},
										{
											"time": 1,
											"value": -18,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								}
							]
						},
						{
							"type": "emitter",
							"name": "Dust_L",
							"props": {
								"instScale_rand": 2,
								"animationSpeed": 0.01,
								"randomColor1": [
									1,
									1,
									1,
									1
								],
								"enableSort": false,
								"instRotation_rand": [
									0,
									0,
									360
								],
								"lifeTimeRand": 1,
								"emitSurface": true,
								"instSpeed_rand": [
									0.2,
									0,
									0
								],
								"alignMode": "Screen",
								"lifeTime": 7,
								"frameCount": 16,
								"frameDivisionX": 4,
								"frameDivisionY": 4,
								"spriteSheet": "Fx/Alphas/T_Dust_4x4_01.png",
								"instScale": 8,
								"useRandomColor": true,
								"randomColor2": [
									0.7215686274509804,
									0.7215686274509804,
									0.7215686274509804,
									1
								],
								"emitRate": 3,
								"maxCount": 50,
								"emitShape": "Cylinder",
								"emitType": "Burst",
								"burstParticleCount": 20,
								"emitOrientation": "Normal",
								"emitRad2": 0.89,
								"instSpeed": [
									8,
									0,
									0
								],
								"seedGroup": 2,
								"instAcceleration": [
									0,
									0,
									0.5
								],
								"instAcceleration_rand": [
									0,
									0,
									0.1
								],
								"emitAngle": 150,
								"warmUpTime": -3.7,
								"emitDuration": 50,
								"burstDelay": 1.5,
								"speedFactor": 0.7
							},
							"scaleX": 0.1,
							"scaleY": 0.1,
							"scaleZ": 0.1,
							"rotationZ": -90,
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"z": 0.1,
									"scaleX": 0.9,
									"scaleY": 0.9,
									"scaleZ": 0.9,
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
													"drawOrder": "100"
												}
											},
											"wrapRepeat": true,
											"diffuseMap": "Fx/Structure/Smoke/white.png",
											"color": [
												0.6509803921568628,
												0.6509803921568628,
												0.6509803921568628,
												0.7294117647058823
											]
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
													"enabled": false,
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -23.189889242182407,
																"dt": -0.28977503660331055
															},
															"nextHandle": {
																"dv": 1.1326797123854366,
																"dt": 0.014304442805171833
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 1,
															"prevHandle": {
																"dv": 0.009064468553734106,
																"dt": -0.12276957500670424
															},
															"nextHandle": {
																"dv": 0.009064468553734106,
																"dt": 0.3787350440007705
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.012065011699184947,
																"dt": -0.47561849150104063
															},
															"nextHandle": {
																"dv": 0.012065011699184947,
																"dt": 0.47561849150104063
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "alpha",
													"keyMode": 1,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -21.71788833045742,
																"dt": -1.0703742298131396
															},
															"nextHandle": {
																"dv": 0.9175302479731284,
																"dt": 0.04485923833819242
															}
														},
														{
															"time": 0.13325949973049692,
															"value": 0.9889393939393939,
															"mode": 1,
															"prevHandle": {
																"dv": -0.05455370624347011,
																"dt": -0.08412795297914331
															},
															"nextHandle": {
																"dv": -0.05827345639241999,
																"dt": 0.25322009210623775
															}
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": 0.05527291324696937,
																"dt": -0.6747448979591837
															},
															"nextHandle": {
																"dv": -0.05527291324696937,
																"dt": 0.6747448979591837
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
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 3,
												"uvScaleY": 3,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 0.75,
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
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"enabled": false,
											"props": {
												"useSourceUVs": true,
												"useScale": true,
												"wrap": true,
												"progress": 1,
												"saturation": 1,
												"width": 0.6,
												"uvScaleX": 1.5,
												"uvScaleY": 1.5,
												"texture": "Fx/noise/Wave_01.jpg",
												"uvShift": [
													0,
													0
												],
												"uvShiftSpeed": [
													0,
													0.05
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
															"value": 0.75,
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
												"range": 3,
												"power": 0.8
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
													0.8549019607843137,
													0.8156862745098039,
													0.7764705882352941
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "MaskColorAlpha",
											"source": "hrt.shader.MaskColorAlpha",
											"props": {
												"UVScale": [
													0.5,
													0.5
												],
												"alpha": 0.5,
												"MULTIPLY": true,
												"color": [
													0.6549019607843137,
													0.615686274509804,
													0.5686274509803921,
													1
												],
												"mask": "Fx/noise/Water_03.png",
												"UVOffset": [
													0,
													0
												]
											}
										},
										{
											"type": "fakeLight",
											"name": "FakeLight",
											"normalMap": "Fx/DistortionMaps/SphereClean.png",
											"topBrighten": true,
											"topIntensity": 0.25,
											"topSpan": 0.35,
											"dirIntensity": 0.22,
											"dirSpan": 0.76,
											"sandBlend": 0.2,
											"envBlend": 0.5,
											"children": [
												{
													"type": "curve",
													"name": "sandBlend",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.7185579310857965,
																"dt": -0.43124811440283806
															},
															"nextHandle": {
																"dv": 0.9033269751959244,
																"dt": 0.5421386890181691
															}
														},
														{
															"time": 0.9987244897959183,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": -0.029759915530303438,
																"dt": -0.5272995428235974
															},
															"nextHandle": {
																"dv": 0.029759915530303438,
																"dt": 0.5272995428235974
															}
														}
													]
												}
											]
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
												"dv": 2.2520656034216806,
												"dt": -0.3772293706598522
											},
											"nextHandle": {
												"dv": -0.828861737794305,
												"dt": 0.13904685383861598
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.015213416891424247,
												"dt": -0.515953146161384
											},
											"nextHandle": {
												"dv": 0.019107491596054956,
												"dt": 0.5819152448582862
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"enabled": false,
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.160888030384762,
												"dt": -0.006058712602162857
											},
											"nextHandle": {
												"dv": -1.0166666666666666,
												"dt": 0.002615486322407691
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.004097655612708362,
												"dt": -0.702568660523737
											},
											"nextHandle": {
												"dv": 0.004097655612708362,
												"dt": 0.702568660523737
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instScale",
									"keyMode": 1,
									"keys": [
										{
											"time": 0,
											"value": 0.2,
											"mode": 1,
											"prevHandle": {
												"dv": 0.01248450392811181,
												"dt": -0.098262780692611
											},
											"nextHandle": {
												"dv": 0.3955237012855743,
												"dt": 0.14027147110519406
											}
										},
										{
											"time": 1,
											"value": 2,
											"mode": 0,
											"prevHandle": {
												"dv": -0.04662014920911317,
												"dt": -0.72947644858284
											},
											"nextHandle": {
												"dv": 0.04662014920911317,
												"dt": 0.72947644858284
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instRotation.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 221.9013970026372,
												"dt": -3.3553253116370656
											},
											"nextHandle": {
												"dv": -14.166666666666666,
												"dt": 0.21421124828532234
											}
										},
										{
											"time": 1,
											"value": -18,
											"mode": 0,
											"prevHandle": {
												"dv": -1.413276791572569,
												"dt": -0.4062824095242934
											},
											"nextHandle": {
												"dv": 1.413276791572569,
												"dt": 0.4062824095242934
											}
										}
									]
								},
								{
									"type": "curve",
									"name": "instAcceleration.z",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 3.1158193827784832,
												"dt": -0.07764119888199704
											},
											"nextHandle": {
												"dv": -0.97754863929894,
												"dt": 0.024242297509352445
											}
										},
										{
											"time": 0.6549999999999999,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.02853471978328992,
												"dt": -0.602201709020346
											},
											"nextHandle": {
												"dv": 0.02853471978328992,
												"dt": 0.602201709020346
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
					"name": "LightDecals",
					"enabled": false,
					"children": [
						{
							"type": "advancedDecal",
							"name": "insidelight",
							"scaleX": 2.5,
							"scaleY": 2.5,
							"scaleZ": 2,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.8
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 1,
											"keys": [
												{
													"time": 1.0075672681415797,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 1.3304317392718035e-17,
														"dt": -0.12903913743552134
													},
													"nextHandle": {
														"dv": -0.006847298580563599,
														"dt": 0.41238733337903866
													}
												},
												{
													"time": 4.106078824538226,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.0022609850698382663,
														"dt": -0.057606213196045565
													},
													"nextHandle": {
														"dv": -0.04079518846101471,
														"dt": 0.8799755007364478
													}
												},
												{
													"time": 8.990043867663038,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.014458051989935605,
														"dt": -0.7514618715010526
													},
													"nextHandle": {
														"dv": -0.0019990838418632896,
														"dt": 0.08964277857832537
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
											1,
											0.5607843137254902,
											0.34509803921568627
										]
									}
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
							"type": "advancedDecal",
							"name": "FlashTest",
							"scaleX": 25,
							"scaleY": 25,
							"scaleZ": 3,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.3
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 6.158219584138115,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6.815660104923888,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.2083132341890821,
														"dt": -0.16965560966955984
													},
													"nextHandle": {
														"dv": -0.04079518846101471,
														"dt": 0.8799755007364478
													}
												},
												{
													"time": 9.700446023241778,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.014458051989935605,
														"dt": -0.7514618715010526
													},
													"nextHandle": {
														"dv": -0.0019990838418632896,
														"dt": 0.08964277857832537
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
											1,
											0.5607843137254902,
											0.34509803921568627
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.6,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Flash",
							"scaleX": 20,
							"scaleY": 20,
							"scaleZ": 3.6,
							"albedoMap": "Fx/Alphas/T_circle2.png",
							"fadePower": 3,
							"emissive": 1,
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 0.25
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"keys": [
												{
													"time": 3.625424958582242,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.7717885155355795,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.2083132341890821,
														"dt": -0.16965560966955984
													},
													"nextHandle": {
														"dv": -0.4174996182674431,
														"dt": 0.2208706510056877
													}
												},
												{
													"time": 4.346272100281882,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 4.458135395896185,
													"value": 1.0500999541920932,
													"mode": 2
												},
												{
													"time": 9.972769674667685,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.014458051989935605,
														"dt": -0.7514618715010526
													},
													"nextHandle": {
														"dv": -0.0019990838418632896,
														"dt": 0.08964277857832537
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keys": [
												{
													"time": 3.625424958582242,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.7717885155355795,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.2083132341890821,
														"dt": -0.16965560966955984
													},
													"nextHandle": {
														"dv": -0.04079518846101471,
														"dt": 0.8799755007364478
													}
												},
												{
													"time": 10.630672247640875,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0.014458051989935605,
														"dt": -0.7514618715010526
													},
													"nextHandle": {
														"dv": -0.0019990838418632896,
														"dt": 0.08964277857832537
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
											1,
											0.5607843137254902,
											0.34509803921568627
										]
									}
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.6,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "Flashexplo",
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 2.5,
							"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
							"fadePower": 3,
							"emissive": 10,
							"renderMode": "BeforeTonemapping",
							"autoAlpha": false,
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
									}
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
										"texture": "Fx/Alphas/T_circle.png"
									},
									"children": [
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keys": [
												{
													"time": 3.6195079942113537,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.6405523000421685,
													"value": 1,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5263278520958232,
														"dt": -0.055190607662997326
													},
													"nextHandle": {
														"dv": -0.9184991601883747,
														"dt": 0.605734719428713
													}
												},
												{
													"time": 6.4991794487254175,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.018699068572561095,
														"dt": -1.102979638362731
													},
													"nextHandle": {
														"dv": 0.00135731593230046,
														"dt": 0.08964629969995234
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 3.544779650381396,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.559290683313654,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 3.6195079942113537,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.6405523000421685,
													"value": 0.85,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5263278520958232,
														"dt": -0.055190607662997326
													},
													"nextHandle": {
														"dv": -0.9,
														"dt": 0.4484932756716571
													}
												},
												{
													"time": 4.5277488459827175,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0.033333333333333326,
														"dt": -0.38903874910637626
													},
													"nextHandle": {
														"dv": -0.033333333333333326,
														"dt": 0.1265690386019287
													}
												},
												{
													"time": 5.025660456069351,
													"value": 0.4,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.06163017281690397
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.35857555093471394
													}
												},
												{
													"time": 6.364236784126332,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3389659504929717
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3389659504929717
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "alpha",
											"keyMode": 0,
											"keys": [
												{
													"time": 3.544779650381396,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.559290683313654,
													"value": 0.2,
													"mode": 2
												},
												{
													"time": 3.6195079942113537,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3.6405523000421685,
													"value": 0.85,
													"mode": 1,
													"prevHandle": {
														"dv": -0.5263278520958232,
														"dt": -0.055190607662997326
													},
													"nextHandle": {
														"dv": -0.98,
														"dt": 0.25745330867161176
													}
												},
												{
													"time": 4.321241104336342,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": -0.009999999999999953,
														"dt": -0.1720973778681576
													},
													"nextHandle": {
														"dv": 0.23000000000000004,
														"dt": 0.15488764008134304
													}
												},
												{
													"time": 4.458919006630869,
													"value": 0.5,
													"mode": 0,
													"prevHandle": {
														"dv": 0.058944171709306575,
														"dt": -0.05152577722809969
													},
													"nextHandle": {
														"dv": -0.058944171709306575,
														"dt": 0.05152577722809969
													}
												},
												{
													"time": 6.008626961978165,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.3389659504929717
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.3389659504929717
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
											1,
											0.45098039215686275,
											0.2901960784313725
										]
									},
									"isInstance": true
								},
								{
									"type": "shader",
									"name": "NightEmissive",
									"source": "shaders/NightEmissive.hx",
									"props": {
										"amount": 0.6,
										"ATTENUATE": true,
										"emissiveMap": null
									}
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 5.020675685255218,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.6167809722887864
											}
										},
										{
											"time": 6.364236784126332,
											"value": 2,
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
					"name": "ExplosionLaunch",
					"enabled": false,
					"z": -0.2,
					"scaleX": 0.9,
					"scaleY": 0.9,
					"scaleZ": 0.9,
					"children": [
						{
							"type": "emitter",
							"name": "Fireball_Screen",
							"props": {
								"instScale_rand": 0.5,
								"maxCount": 5,
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
								"instScale": 2.25,
								"emitType": "Burst",
								"instStretch_rand": [
									0,
									0,
									0
								],
								"burstParticleCount": 3,
								"emitShape": "Cone",
								"emitRad1": 0.83,
								"emitSurface": true,
								"lifeTimeRand": 0.3,
								"alignMode": "Screen",
								"instSpeed": [
									7,
									0,
									0
								],
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
									0.2,
									0,
									0
								],
								"instAcceleration_rand": [
									0,
									0,
									0
								],
								"warmUpTime": -3.5,
								"lifeTime": 1.5,
								"burstDelay": 0.5
							},
							"rotationY": -89.99999999999999,
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
													"textureWrap": true,
													"emissive": 12,
													"drawOrder": "120"
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
															"time": -0.0050000000000000044,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.039999999999999994,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.002592191728735997,
																"dt": -0.03499458833793611
															},
															"nextHandle": {
																"dv": -0.06666666666666665,
																"dt": 0.8999999999999999
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
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													1,
													0.45098039215686275,
													0.2901960784313725
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
												"range": 1.5,
												"power": 0.8
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
												"progress": 0.5,
												"saturation": 0,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/T_Noise_Wave_02.png",
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
												"dv": 0,
												"dt": -0.5
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05166666666666666
											}
										},
										{
											"time": 0.05499999999999999,
											"value": -0.509348731270885,
											"mode": 0,
											"prevHandle": {
												"dv": -0.6178478332448459,
												"dt": -0.024810868515554432
											},
											"nextHandle": {
												"dv": 0.8715807006116155,
												"dt": 0.03500000000000003
											}
										},
										{
											"time": 0.09499999999999999,
											"value": 0.3300049349567332,
											"mode": 0,
											"prevHandle": {
												"dv": -0.07664157271676325,
												"dt": -0.059883603739303806
											},
											"nextHandle": {
												"dv": 0.07664157271676325,
												"dt": 0.059883603739303806
											}
										},
										{
											"time": 1,
											"value": 1.01469963255798,
											"mode": 0,
											"prevHandle": {
												"dv": -0.1819155871944269,
												"dt": -0.38
											},
											"nextHandle": {
												"dv": 0.12673911289324527,
												"dt": 0.2647429153388605
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
												"dv": 14.440723993255148,
												"dt": 3.0264736129859874e-16
											},
											"nextHandle": {
												"dv": -1.0531473456593288,
												"dt": 0
											}
										},
										{
											"time": 1,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -0.0020357480108519344,
												"dt": -0.9008679262353498
											},
											"nextHandle": {
												"dv": -9.13398276941183e-17,
												"dt": 0.12763988639211618
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "curve",
					"name": "shake_",
					"enabled": false,
					"keyMode": 1,
					"keys": [
						{
							"time": 0.2778706372134731,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": -0.01027948649355356,
								"dt": -0.508672266997072
							},
							"nextHandle": {
								"dv": 0.06198899336467023,
								"dt": 3.0459443760648734
							}
						},
						{
							"time": 3.6227852459781227,
							"value": 0.45,
							"mode": 1,
							"prevHandle": {
								"dv": -0.4766846158617142,
								"dt": -0.38938235059678705
							},
							"nextHandle": {
								"dv": 0.19167677807906014,
								"dt": 0.3073225294424695
							}
						},
						{
							"time": 4.213384211201492,
							"value": 0.65,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.1968663217411232
							},
							"nextHandle": {
								"dv": 0,
								"dt": 1.8121932709604556
							}
						},
						{
							"time": 9.994553987208214,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.0019877908975290404,
								"dt": -2.5368965332074955
							},
							"nextHandle": {
								"dv": -2.1078666753093614e-16,
								"dt": 1.0006821748602417
							}
						}
					]
				},
				{
					"type": "curve",
					"name": "shake",
					"keyMode": 1,
					"keys": [
						{
							"time": 0.2778706372134731,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": -0.006753229078739935,
								"dt": -0.508886874818316
							},
							"nextHandle": {
								"dv": 0.03465525237817635,
								"dt": 2.57114910003018
							}
						},
						{
							"time": 3.6227852459781227,
							"value": 0.025,
							"mode": 1,
							"prevHandle": {
								"dv": -0.017678488608317368,
								"dt": -0.5406275578372526
							},
							"nextHandle": {
								"dv": 0.04382242861129345,
								"dt": 0.391924245751615
							}
						},
						{
							"time": 4.213384211201492,
							"value": 0.15,
							"mode": 1,
							"prevHandle": {
								"dv": 0,
								"dt": -0.1968663217411232
							},
							"nextHandle": {
								"dv": 0,
								"dt": 1.8121932709604556
							}
						},
						{
							"time": 9.994553987208214,
							"value": 0,
							"mode": 0,
							"prevHandle": {
								"dv": 0.0019877908975290404,
								"dt": -2.5368965332074955
							},
							"nextHandle": {
								"dv": -2.1078666753093614e-16,
								"dt": 1.0006821748602417
							}
						}
					]
				}
			]
		}
	]
}