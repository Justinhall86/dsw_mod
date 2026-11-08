{
	"type": "fx",
	"duration": 1,
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
					"name": "Chara",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"y": -0.95
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": 0.67,
							"y": 0.97
						},
						{
							"type": "model",
							"name": "Male01_AtreideSoldier",
							"source": "Character/Atreide/Unit/Soldier/Male01_AtreideSoldier.fbx",
							"x": -0.99
						}
					]
				},
				{
					"type": "object",
					"name": "ImpactsSandColor",
					"z": 0.1,
					"children": [
						{
							"type": "emitter",
							"name": "emitterImpacts2",
							"props": {
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instScale": 2.7,
								"instScale_rand": 1,
								"seedGroup": 3,
								"lifeTime": 0.35,
								"lifeTimeRand": 0.1,
								"simulationSpace": "World",
								"maxCount": 10,
								"alignAxis": [
									90,
									0,
									0
								],
								"speedFactor": 1.2,
								"emitRate": 6,
								"instStretch": [
									1,
									1,
									1.6
								],
								"instStretch_rand": [
									0.5,
									0.4,
									0.5
								]
							},
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 0.1,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Impact",
									"source": "Fx/Meshes_Common/Impact03.fbx",
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": 90,
									"rotationZ": 180,
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
											"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2204263403814648,
																"dt": -0.49444719279844607
															},
															"nextHandle": {
																"dv": -0.18792866941015085,
																"dt": 0.4260057278230321
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7843137254901961,
													0.7176470588235294,
													0.6666666666666666
												]
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
												"texture": "Fx/Alphas/T_Impacts_Dust04.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"recursiveApply": false,
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.5816985852179943,
												"dt": -0.3312869411015146
											},
											"nextHandle": {
												"dv": 0.8125000000000001,
												"dt": 0.16950523200129458
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.010416666666666519,
												"dt": -0.7861004514141738
											},
											"nextHandle": {
												"dv": 0.004413384053992263,
												"dt": 0.33334082602539855
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7762275586565581,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7862275586565581,
											"value": 0,
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
							"type": "emitter",
							"name": "emitterImpacts",
							"props": {
								"frameDivisionX": 0,
								"frameDivisionY": 0,
								"animationSpeed": 0,
								"instScale": 1.95,
								"instScale_rand": 0.75,
								"instStretch_rand": [
									0.5,
									0.4,
									0.65
								],
								"seedGroup": 1,
								"lifeTime": 0.25,
								"lifeTimeRand": 0.1,
								"simulationSpace": "World",
								"maxCount": 10,
								"alignAxis": [
									90,
									0,
									0
								],
								"emitRate": 6,
								"speedFactor": 1.2,
								"burstParticleCount": 2,
								"instStretch": [
									1,
									1,
									1.3
								]
							},
							"scaleX": 11,
							"scaleY": 11,
							"scaleZ": 0.1,
							"children": [
								{
									"type": "model",
									"name": "Impact",
									"source": "Fx/Meshes_Common/Impact01.fbx",
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": 90,
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
											"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2204263403814648,
																"dt": -0.49444719279844607
															},
															"nextHandle": {
																"dv": -0.18792866941015085,
																"dt": 0.4260057278230321
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7843137254901961,
													0.7176470588235294,
													0.6666666666666666
												]
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
												"texture": "Fx/Alphas/T_Impacts_Dust04.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"recursiveApply": false,
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.5816985852179943,
												"dt": -0.3312869411015146
											},
											"nextHandle": {
												"dv": 0.8125000000000001,
												"dt": 0.16950523200129458
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.010416666666666519,
												"dt": -0.7861004514141738
											},
											"nextHandle": {
												"dv": 0.004413384053992263,
												"dt": 0.33334082602539855
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7762275586565581,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7862275586565581,
											"value": 0,
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
						}
					]
				},
				{
					"type": "lookAt",
					"name": "lookAt",
					"enabled": false,
					"target": "camera",
					"lockAxis": [
						0,
						0,
						0
					],
					"children": [
						{
							"type": "object",
							"name": "ImpactsSandColor",
							"x": -10,
							"z": 3,
							"scaleX": 1.0000000000000002,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationY": 90,
							"children": [
								{
									"type": "emitter",
									"name": "emitterImpacts2",
									"props": {
										"frameCount": 4,
										"frameDivisionX": 2,
										"frameDivisionY": 2,
										"animationSpeed": 0,
										"instScale": 2.7,
										"instScale_rand": 1,
										"seedGroup": 3,
										"lifeTime": 0.35,
										"lifeTimeRand": 0.1,
										"simulationSpace": "World",
										"maxCount": 10,
										"alignAxis": [
											90,
											0,
											0
										],
										"speedFactor": 1.2,
										"emitRate": 6,
										"instStretch": [
											1,
											1,
											1.6
										],
										"instStretch_rand": [
											0.5,
											0.4,
											0.5
										]
									},
									"scaleX": 10,
									"scaleY": 10,
									"scaleZ": 0.1,
									"rotationZ": 180,
									"children": [
										{
											"type": "model",
											"name": "Impact",
											"source": "Fx/Meshes_Common/Impact03.fbx",
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": 90,
											"rotationZ": 180,
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
													"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2204263403814648,
																		"dt": -0.49444719279844607
																	},
																	"nextHandle": {
																		"dv": -0.18792866941015085,
																		"dt": 0.4260057278230321
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7843137254901961,
															0.7176470588235294,
															0.6666666666666666
														]
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
														"texture": "Fx/Alphas/T_Impacts_Dust04.png",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"recursiveApply": false,
													"isInstance": true
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.5816985852179943,
														"dt": -0.3312869411015146
													},
													"nextHandle": {
														"dv": 0.8125000000000001,
														"dt": 0.16950523200129458
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.010416666666666519,
														"dt": -0.7861004514141738
													},
													"nextHandle": {
														"dv": 0.004413384053992263,
														"dt": 0.33334082602539855
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7762275586565581,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7862275586565581,
													"value": 0,
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
									"type": "emitter",
									"name": "emitterImpacts",
									"props": {
										"frameDivisionX": 0,
										"frameDivisionY": 0,
										"animationSpeed": 0,
										"instScale": 1.95,
										"instScale_rand": 0.75,
										"instStretch_rand": [
											0.5,
											0.4,
											0.65
										],
										"seedGroup": 1,
										"lifeTime": 0.25,
										"lifeTimeRand": 0.1,
										"simulationSpace": "World",
										"maxCount": 10,
										"alignAxis": [
											90,
											0,
											0
										],
										"emitRate": 6,
										"speedFactor": 1.2,
										"burstParticleCount": 2,
										"instStretch": [
											1,
											1,
											1.3
										]
									},
									"scaleX": 11,
									"scaleY": 11,
									"scaleZ": 0.1,
									"children": [
										{
											"type": "model",
											"name": "Impact",
											"source": "Fx/Meshes_Common/Impact01.fbx",
											"scaleX": 0.75,
											"scaleY": 0.75,
											"scaleZ": 0.75,
											"rotationX": 90,
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
													"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
																	"time": 0,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.2204263403814648,
																		"dt": -0.49444719279844607
																	},
																	"nextHandle": {
																		"dv": -0.18792866941015085,
																		"dt": 0.4260057278230321
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
													"name": "ColorMult",
													"source": "shaders/ColorMult.hx",
													"props": {
														"amount": 1,
														"color": [
															0.7843137254901961,
															0.7176470588235294,
															0.6666666666666666
														]
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
														"texture": "Fx/Alphas/T_Impacts_Dust04.png",
														"onDecal": false
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "EnvColorMult",
													"source": "shaders/EnvColorMult.hx",
													"props": {
														"sandBlend": 0.5,
														"sandColorSet": false,
														"envBlend": 0.7,
														"envColorSet": false
													},
													"recursiveApply": false,
													"isInstance": true
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -1.5816985852179943,
														"dt": -0.3312869411015146
													},
													"nextHandle": {
														"dv": 0.8125000000000001,
														"dt": 0.16950523200129458
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -0.010416666666666519,
														"dt": -0.7861004514141738
													},
													"nextHandle": {
														"dv": 0.004413384053992263,
														"dt": 0.33334082602539855
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
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7762275586565581,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.7862275586565581,
													"value": 0,
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
								}
							]
						}
					]
				},
				{
					"type": "object",
					"name": "ImpactsSandColor",
					"enabled": false,
					"x": -10,
					"z": 3,
					"scaleX": 0.5,
					"scaleY": 0.5,
					"scaleZ": 0.5,
					"rotationY": 90,
					"children": [
						{
							"type": "emitter",
							"name": "emitterImpacts2",
							"props": {
								"frameCount": 4,
								"frameDivisionX": 2,
								"frameDivisionY": 2,
								"animationSpeed": 0,
								"instScale": 2.7,
								"instScale_rand": 1,
								"seedGroup": 3,
								"lifeTime": 0.35,
								"lifeTimeRand": 0.1,
								"simulationSpace": "World",
								"maxCount": 10,
								"alignAxis": [
									90,
									0,
									0
								],
								"speedFactor": 1.2,
								"emitRate": 6,
								"instStretch": [
									1,
									1,
									1.6
								],
								"instStretch_rand": [
									0.5,
									0.4,
									0.5
								]
							},
							"scaleX": 10,
							"scaleY": 10,
							"scaleZ": 10,
							"rotationZ": 180,
							"children": [
								{
									"type": "model",
									"name": "Impact",
									"source": "Fx/Meshes_Common/Impact03.fbx",
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": 90,
									"rotationZ": 180,
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
											"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2204263403814648,
																"dt": -0.49444719279844607
															},
															"nextHandle": {
																"dv": -0.18792866941015085,
																"dt": 0.4260057278230321
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7843137254901961,
													0.7176470588235294,
													0.6666666666666666
												]
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
												"texture": "Fx/Alphas/T_Impacts_Dust04.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"recursiveApply": false,
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.5816985852179943,
												"dt": -0.3312869411015146
											},
											"nextHandle": {
												"dv": 0.8125000000000001,
												"dt": 0.16950523200129458
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.010416666666666519,
												"dt": -0.7861004514141738
											},
											"nextHandle": {
												"dv": 0.004413384053992263,
												"dt": 0.33334082602539855
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7762275586565581,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7862275586565581,
											"value": 0,
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
							"type": "emitter",
							"name": "emitterImpacts",
							"props": {
								"frameDivisionX": 0,
								"frameDivisionY": 0,
								"animationSpeed": 0,
								"instScale": 1.95,
								"instScale_rand": 0.75,
								"instStretch_rand": [
									0.5,
									0.4,
									0.65
								],
								"seedGroup": 1,
								"lifeTime": 0.25,
								"lifeTimeRand": 0.1,
								"simulationSpace": "World",
								"maxCount": 10,
								"alignAxis": [
									90,
									0,
									0
								],
								"emitRate": 6,
								"speedFactor": 1.2,
								"burstParticleCount": 2,
								"instStretch": [
									1,
									1,
									1.3
								]
							},
							"scaleX": 11,
							"scaleY": 11,
							"scaleZ": 11,
							"children": [
								{
									"type": "model",
									"name": "Impact",
									"source": "Fx/Meshes_Common/Impact01.fbx",
									"scaleX": 0.75,
									"scaleY": 0.75,
									"scaleZ": 0.75,
									"rotationX": 90,
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
											"diffuseMap": "Fx/Gradients/ContrastGradientImpact02.png"
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
												"uvScaleX": 2,
												"uvScaleY": 2,
												"texture": "Fx/noise/T_Noise_Grunge_04.png",
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
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0.2204263403814648,
																"dt": -0.49444719279844607
															},
															"nextHandle": {
																"dv": -0.18792866941015085,
																"dt": 0.4260057278230321
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
											"name": "ColorMult",
											"source": "shaders/ColorMult.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7843137254901961,
													0.7176470588235294,
													0.6666666666666666
												]
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
												"texture": "Fx/Alphas/T_Impacts_Dust04.png",
												"onDecal": false
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "EnvColorMult",
											"source": "shaders/EnvColorMult.hx",
											"props": {
												"sandBlend": 0.5,
												"sandColorSet": false,
												"envBlend": 0.7,
												"envColorSet": false
											},
											"recursiveApply": false,
											"isInstance": true
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
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": -1.5816985852179943,
												"dt": -0.3312869411015146
											},
											"nextHandle": {
												"dv": 0.8125000000000001,
												"dt": 0.16950523200129458
											}
										},
										{
											"time": 1,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": -0.010416666666666519,
												"dt": -0.7861004514141738
											},
											"nextHandle": {
												"dv": 0.004413384053992263,
												"dt": 0.33334082602539855
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
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7762275586565581,
											"value": 1,
											"mode": 2
										},
										{
											"time": 0.7862275586565581,
											"value": 0,
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
						}
					]
				}
			]
		}
	]
}