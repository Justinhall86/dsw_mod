{
	"type": "fx",
	"duration": 3,
	"cullingRadius": 15,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "model",
					"name": "Siren",
					"source": "Vehicle/Ecaz/Siren/Siren.fbx",
					"editorOnly": true,
					"scaleX": 1.4,
					"scaleY": 1.4,
					"scaleZ": 1.4,
					"rotationZ": 89.99999999999999,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Siren/Anim_Siren_AttackRange.fbx"
						}
					]
				},
				{
					"type": "object",
					"name": "MagneticField",
					"x": -0.01139,
					"y": 0.3966,
					"z": 1.69856,
					"scaleX": 2.75,
					"scaleY": 2.75,
					"scaleZ": 2.75,
					"rotationX": -90,
					"rotationZ": 90,
					"children": [
						{
							"type": "object",
							"name": "Test",
							"x": -0.058540000000000036,
							"y": -0.018135000000000012,
							"z": -0.042745000000000005,
							"children": [
								{
									"type": "emitter",
									"name": "Distort",
									"props": {
										"instScale_rand": 0.5,
										"maxCount": 10,
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
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"spriteSheet": "Fx/Alphas/T_Dust_16x16_01.png",
										"instScale": 7,
										"burstDelay": 0.15,
										"instStretch_rand": [
											0.3,
											0.1,
											0
										],
										"burstParticleCount": 4,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"lifeTimeRand": 0.2,
										"alignMode": "Screen",
										"emitAngle": 0,
										"instSpeed": [
											12,
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
											1,
											0,
											0
										],
										"instAcceleration": [
											-5,
											0,
											0
										],
										"instAcceleration_rand": [
											1,
											0,
											0
										],
										"warmUpTime": -0.05,
										"speedFactor": 1.1,
										"instStretch": [
											1.5,
											1,
											1
										],
										"emitRate": 2,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
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
									"x": -0.058539999999999946,
									"y": -0.19015499999999996,
									"z": -0.04274499999999999,
									"scaleX": 3.0000000000000004,
									"scaleY": 3.0000000000000004,
									"scaleZ": 3,
									"rotationX": 1.883266687168067e-30,
									"rotationZ": -89.99999999999999,
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
															"depthTest": "Less",
															"colorMask": 15,
															"enableStencil": false,
															"culling": "None"
														}
													},
													"diffuseMap": "Fx/noise/causticTexture_03-2.png"
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
														"alpha": 4,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 0,
														"texture": "Fx/Alphas/TS_Dust_02.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "DistortionMap",
													"source": "shaders/DistortionMap.hx",
													"props": {
														"distortionDir": "Fx/DistortionMaps/sand-normal.png",
														"intensity": 0.005
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "intensity",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.015,
																	"value": 0.004242424242424159
																},
																{
																	"time": 0.25,
																	"value": 0.9810407921993373,
																	"prevHandle": {
																		"dv": -0.05004195689377786,
																		"dt": -0.13015089404560723
																	},
																	"nextHandle": {
																		"dv": 0.04806148015802558,
																		"dt": 0.125
																	}
																},
																{
																	"time": 1,
																	"value": 0.004242424242424214,
																	"prevHandle": {
																		"dv": 0.7124602270877725,
																		"dt": -0.6799999999999999
																	},
																	"nextHandle": {
																		"dv": -0.7124602270877725,
																		"dt": 0.6799999999999999
																	}
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVTransform",
													"source": "shaders/UVTransform.hx",
													"props": {
														"scaleX": 0.5,
														"scaleY": 0.5,
														"shiftX": 0,
														"shiftY": 0,
														"shiftSpeedX": 0,
														"shiftSpeedY": -0.01
													},
													"isInstance": true
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
													"value": 0.25,
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
													"value": 1,
													"prevHandle": {
														"dv": -0.10160322425525758,
														"dt": -0.8228125
													},
													"nextHandle": {
														"dv": 0.03291356561287428,
														"dt": 0.2664930238157777
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.05,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.888111124199107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Fireball_Screen",
									"props": {
										"instScale_rand": 0,
										"maxCount": 30,
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
											0.4392156862745098,
											0.3529411764705882,
											1
										],
										"emitRate": 25,
										"instRotation_rand": [
											0,
											0,
											0
										],
										"frameCount": 32,
										"frameDivisionX": 8,
										"frameDivisionY": 8,
										"instScale": 0.12,
										"burstDelay": 0.2,
										"emitShape": "Cone",
										"emitRad1": 0.83,
										"emitSurface": true,
										"emitAngle": 0,
										"instSpeed": [
											12,
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
											0,
											0,
											0
										],
										"instAcceleration": [
											-4,
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
										"emitType": "Burst",
										"burstCount": 11,
										"animationLoop": false,
										"animationBlendBetweenFrames": false,
										"instRotation": [
											0,
											90,
											0
										],
										"lifeTime": 0.95,
										"randomGradient": {
											"stops": [
												{
													"position": 0,
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
									"x": 0.058540000000000064,
									"y": 0.19015500000000007,
									"z": 0.042745000000000005,
									"scaleX": 3.0000000000000004,
									"scaleY": 3.0000000000000004,
									"scaleZ": 3,
									"rotationX": 1.883266687168067e-30,
									"rotationZ": -89.99999999999999,
									"children": [
										{
											"type": "model",
											"name": "Ring_2",
											"source": "Fx/Meshes_Common/Ring_4.fbx",
											"scaleZ": 2.5,
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
															"colorMask": 255,
															"depthTest": "LessEqual",
															"alphaKill": false,
															"enableStencil": false,
															"parallax": 0,
															"textureWrap": true,
															"emissive": 1
														}
													},
													"wrapRepeat": true,
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.8431372549019608,
															0.6549019607843137
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
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804
														]
													},
													"children": [
														{
															"type": "curve",
															"name": "amount",
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.005617977528090012,
																		"dt": -0.3623271889400921
																	},
																	"nextHandle": {
																		"dv": -0.008707766441588155,
																		"dt": 0.49999433116216824
																	}
																}
															]
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
																	"time": 0,
																	"value": 1,
																	"prevHandle": {
																		"dv": 0.014927271500159258,
																		"dt": -0.49998334110747855
																	},
																	"nextHandle": {
																		"dv": -0.011235955056179692,
																		"dt": 0.3771121351766513
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
													"name": "VertexDisplacement",
													"source": "shaders/VertexDisplacement.hx",
													"props": {
														"X": true,
														"Y": true,
														"Z": true,
														"texScaleX": 1,
														"texScaleY": 1,
														"tex": "Fx/noise/clouds_Dissolve.png",
														"intensity": 0.15,
														"scrollSpeed": [
															1,
															1
														]
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
														"progress": 0.3,
														"saturation": 1,
														"width": 1,
														"uvScaleX": 0.1,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Water_04.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															0.1
														]
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instScale",
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.7,
													"mode": 2
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
											},
											"isInstance": true
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "SCAN",
							"y": -0.67977,
							"rotationX": -90,
							"children": [
								{
									"type": "object",
									"name": "Scan",
									"scaleX": 2,
									"scaleY": 2,
									"scaleZ": 2.5,
									"children": [
										{
											"type": "model",
											"name": "CylinderRayLarge",
											"source": "Fx/Vehicle/Ornithopter/CylinderRay_large_02.fbx",
											"scaleX": 0.85,
											"scaleY": 0.75,
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
															"emissive": 0.75
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
														"vOffset": -0.015,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
														"onDecal": false
													},
													"isInstance": true
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"props": {
														"amount": 1,
														"color": [
															1,
															0.7843137254901961,
															0.5254901960784314
														]
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
														"progress": 0.43,
														"saturation": 0.5,
														"width": 0.7,
														"uvScaleX": 1,
														"uvScaleY": 2,
														"texture": "Fx/Gradients/Cyl13u_A.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															-2
														],
														"uvScaleSpeed": [
															0,
															0
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
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Gradients/vGrad_inv.jpg",
														"uvShift": [
															0,
															-0.02
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
															"keys": [
																{
																	"time": 0.05,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.31654325447141124
																	}
																},
																{
																	"time": 0.9,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 2.25,
																	"value": 0.5,
																	"mode": 2
																},
																{
																	"time": 3,
																	"value": 1,
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
														"amount": 0.75,
														"ATTENUATE": true,
														"emissiveMap": null
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
														"REVERSE": true,
														"bias": -0.4,
														"scale": 1,
														"power": 1,
														"color": [
															1,
															0,
															0
														]
													}
												},
												{
													"type": "shader",
													"name": "MaskColorAlpha",
													"source": "hrt.shader.MaskColorAlpha",
													"props": {
														"UVScale": [
															1,
															1
														],
														"alpha": 1,
														"MULTIPLY": false,
														"color": [
															0.9529411764705882,
															0.32156862745098036,
															0.615686274509804,
															1
														],
														"mask": "Fx/Gradients/vGrad.png",
														"UVOffset": [
															0,
															0
														]
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
							"name": "FlareStar2_NoPhotosensitive",
							"props": {
								"emitRate": 1,
								"maxCount": 30,
								"lifeTime": 0.15,
								"frameDivisionY": 0,
								"animationSpeed": 0,
								"instScale": 1.4,
								"emitType": "Burst",
								"instScale_rand": 0.25,
								"frameDivisionX": 0,
								"alignMode": "Screen",
								"instRotation_rand": [
									0,
									0,
									0
								],
								"lifeTimeRand": 0.02,
								"useRandomColor": true,
								"randomColor1": [
									0.8549019607843137,
									0.8549019607843137,
									0.8549019607843137,
									1
								],
								"instRotation": [
									0,
									0,
									180
								],
								"alignLockAxis": "Z",
								"warmUpTime": -0.05,
								"burstCount": 11,
								"burstDelay": 0.2,
								"randomGradient": {
									"stops": [
										{
											"position": 0,
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
							"y": -1.2,
							"scaleX": 0.01,
							"scaleY": 0.01,
							"scaleZ": 0.01,
							"children": [
								{
									"type": "model",
									"name": "PlanePivBot_NoVrtx",
									"source": "Fx/Meshes_Common/PlanePivCenter_NoVrtx.fbx",
									"rotationY": 90,
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
													"emissive": 0.75
												}
											},
											"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
												"texture": "Fx/Alphas/T_Flare07_512.png",
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
															"value": 0.43333333333333335,
															"mode": 2
														},
														{
															"time": 0.2610256091340131,
															"value": 3,
															"prevHandle": {
																"dv": 0,
																"dt": -0.0864952927985753
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.011804602326868493
															}
														},
														{
															"time": 0.2948996853763314,
															"value": 0.7544444444444445
														},
														{
															"time": 0.72,
															"value": 1,
															"prevHandle": {
																"dv": 0.022847819119101713,
																"dt": -0.2399021007505667
															},
															"nextHandle": {
																"dv": -0.016666666666666607,
																"dt": 0.17499999999999993
															}
														},
														{
															"time": 1,
															"value": 0.7,
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
												"useScale": true,
												"wrap": true,
												"progress": 0.5,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 0.5,
												"uvScaleY": 0.5,
												"texture": "Fx/noise/causticTexture_03-2-Blured.png",
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
															"prevHandle": {
																"dv": 1.1462494082799496e-16,
																"dt": -0.500118692076805
															},
															"nextHandle": {
																"dv": -0.0002777777777778212,
																"dt": 0.7424137395426957
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
													0.7764705882352941,
													0.5058823529411764
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
													0.9529411764705882,
													0.32156862745098036,
													0.615686274509804
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 1,
															"value": 1,
															"prevHandle": {
																"dv": -0.358485083301046,
																"dt": -0.35714528664478506
															},
															"nextHandle": {
																"dv": 0.46578092246160857,
																"dt": 0.4642442721580395
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
									"name": "instScale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0.7,
											"mode": 2
										},
										{
											"time": 0.3917535652877765,
											"value": 0.07441510915756222,
											"prevHandle": {
												"dv": 0,
												"dt": -0.08666666666666667
											},
											"nextHandle": {
												"dv": 0,
												"dt": 0.05000000000000001
											}
										},
										{
											"time": 0.5367535652877765,
											"value": 1.3,
											"prevHandle": {
												"dv": -0.016666666666666607,
												"dt": -0.14
											},
											"nextHandle": {
												"dv": 0.04420191197517367,
												"dt": 0.37129606059146064
											}
										}
									]
								}
							]
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.MagneticField",
					"target": "FXAnimation.FXRoot.Siren.root.B_ROOTJ"
				}
			]
		}
	]
}