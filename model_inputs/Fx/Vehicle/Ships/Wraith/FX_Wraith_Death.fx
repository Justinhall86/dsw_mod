{
	"type": "fx",
	"duration": 20,
	"cullingRadius": 50,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"children": [
				{
					"type": "object",
					"name": "Death",
					"x": -4.09871,
					"y": -3.04898,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base_NoFlare",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": 3.54983,
							"y": 3.53734,
							"z": 1.60771,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"rotationY": -13,
							"time": -0.1
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_trails_Base_NoFlare",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_trails_Base_NoFlare.fx",
							"x": 3.50728,
							"y": 4.0088,
							"z": -1.9533,
							"scaleX": 0.2,
							"scaleY": 0.2,
							"scaleZ": 0.4,
							"rotationY": -169.9,
							"time": 0.2
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Medium",
							"source": "Fx/Explosion/FX_Directional_Explosion_Medium.fx",
							"x": 3.220689999999999,
							"y": 4.01974,
							"z": 1.6378500000000003,
							"scaleX": 1.1,
							"scaleY": 1.1,
							"scaleZ": 1.1,
							"rotationZ": -7.951386703658792e-16,
							"time": -0.4
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
							"x": 0.3112,
							"y": 4.58309,
							"z": 0.00341,
							"scaleX": 0.75,
							"scaleY": 0.75,
							"scaleZ": 0.75,
							"rotationY": -68.7
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_Low",
							"source": "Fx/Explosion/FX_Directional_Explosion_Low.fx",
							"x": 3.5928,
							"y": 4.05325,
							"z": -2.13306,
							"rotationY": -164.1
						},
						{
							"type": "subFX",
							"name": "FX_Directional_Explosion_High_Sparkles",
							"source": "Fx/Explosion/BasesExplosions/FX_Directional_Explosion_High_Sparkles.fx",
							"x": 5.77404,
							"y": 5.55037,
							"z": 0.22191,
							"scaleX": 0.4,
							"scaleY": 0.4,
							"scaleZ": 0.4,
							"rotationX": -88.7,
							"rotationY": -82.7,
							"rotationZ": -12.4
						},
						{
							"type": "shader",
							"name": "DepthBlend",
							"source": "shaders/DepthBlend.hx",
							"props": {
								"REVERSE": false,
								"range": 1.75,
								"power": 0.8
							}
						},
						{
							"type": "object",
							"name": "Leaks",
							"children": [
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											10,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2,
											1,
											1
										],
										"instScale_rand": 0.15,
										"instSpeed_rand": [
											5,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.3,
										"maxCount": 10,
										"emitType": "Burst",
										"burstCount": 3,
										"warmUpTime": -0.9,
										"burstDelay": 2
									},
									"x": 3.66638,
									"y": 4.0367,
									"z": -2.33191,
									"rotationY": 103.3,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"textureWrap": true,
															"emissive": 50
														}
													},
													"wrapRepeat": true,
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
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 7.032384972302246,
													"value": -0.03333333333333333,
													"mode": 2
												},
												{
													"time": 7.042384972302246,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.204840759960939,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.214840759960939,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles02",
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											20,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2,
											1,
											1
										],
										"instScale_rand": 0.15,
										"instSpeed_rand": [
											7,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.3,
										"maxCount": 10,
										"emitType": "Burst",
										"burstCount": 12,
										"warmUpTime": -0.5
									},
									"x": 3.34262,
									"y": 4.0367,
									"z": 2.23632,
									"rotationY": -106.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"textureWrap": true,
															"emissive": 50
														}
													},
													"wrapRepeat": true,
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
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 7.032384972302246,
													"value": -0.03333333333333333,
													"mode": 2
												},
												{
													"time": 7.042384972302246,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.204840759960939,
													"value": 5,
													"mode": 2
												},
												{
													"time": 7.214840759960939,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "SparklesInfinity",
									"enabled": false,
									"props": {
										"burstParticleCount": 10,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 70,
										"instSpeed": [
											15,
											0,
											0
										],
										"lifeTime": 0.5,
										"instStretch": [
											2.5,
											1,
											1
										],
										"instScale_rand": 0.15,
										"instSpeed_rand": [
											5,
											0,
											0
										],
										"speedFactor": 2,
										"instStretch_rand": [
											0.25,
											0,
											0
										],
										"useRandomColor": true,
										"randomColor1": [
											1,
											0.5882352941176471,
											0,
											1
										],
										"randomColor2": [
											0,
											0.7294117647058823,
											1,
											1
										],
										"lifeTimeRand": 0.2,
										"emitDuration": 50,
										"emitRate": 10,
										"instScale": 0.5,
										"maxCount": 10,
										"burstCount": 2,
										"warmUpTime": -0.2
									},
									"x": 3.34262,
									"y": 4.0367,
									"z": 2.23632,
									"rotationY": -106.5,
									"children": [
										{
											"type": "polygon",
											"name": "polygon",
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
															"textureWrap": true,
															"emissive": 50
														}
													},
													"wrapRepeat": true,
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
														"texture": "Fx/Alphas/Spark.png",
														"onDecal": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 1.3450505427640504,
																		"dt": -0.2952549971921085
																	},
																	"nextHandle": {
																		"dv": -0.6833333333333333,
																		"dt": 0.15000000000000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
																	"time": 0,
																	"value": 0.9666666666666667,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.02352170282676526,
																		"dt": -0.6051452312104698
																	},
																	"nextHandle": {
																		"dv": 0.03222222222222226,
																		"dt": 0.8296093750000002
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.26
																	},
																	"nextHandle": {
																		"dv": -2.7214566023630135e-16,
																		"dt": 0.33333569371893157
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
														"amount": 0.9,
														"ATTENUATE": true,
														"emissiveMap": null
													},
													"isInstance": true
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.44831909179687623,
															"value": -0.06666666666666667,
															"mode": 2
														},
														{
															"time": 0.47234619140625134,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
															}
														}
													]
												}
											]
										},
										{
											"type": "curve",
											"name": "instSpeed.x",
											"keys": [
												{
													"time": 0.06,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1,
													"value": 0.325,
													"mode": 0,
													"prevHandle": {
														"dv": -0.0214444444444446,
														"dt": -0.44000000000000006
													},
													"nextHandle": {
														"dv": 0.0214444444444446,
														"dt": 0.44000000000000006
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "instStretch.x",
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
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.52
													},
													"nextHandle": {
														"dv": -5.442874662877125e-16,
														"dt": 0.33333333333333326
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
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -2.524747126051018,
														"dt": -0.08435811334917986
													},
													"nextHandle": {
														"dv": 1.1363636363636365,
														"dt": 0.038593750000000024
													}
												},
												{
													"time": 1,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0.015151515151515138,
														"dt": -0.6513281249999998
													},
													"nextHandle": {
														"dv": -0.007748222232672166,
														"dt": 0.333317624512036
													}
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRate",
											"keys": [
												{
													"time": 1.4418539526751322,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.4658810522845074,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 0,
														"dt": -0.003333333333333332
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.003333333333333332
													}
												},
												{
													"time": 7.573769679638372,
													"value": 1,
													"mode": 2
												},
												{
													"time": 8.973725855062531,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "SmokeBig",
									"x": 3.43796,
									"y": 3.58369,
									"z": 1.74823,
									"scaleX": 0.5,
									"scaleY": 0.5,
									"scaleZ": 0.5,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Continuous",
											"props": {
												"lifeTime": 5,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 24.55,
												"instSpeed": [
													3.5,
													0,
													0
												],
												"instSpeed_rand": [
													1.5,
													0,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"burstParticleCount": 5,
												"lifeTimeRand": 0.5,
												"emitShape": "Cone",
												"burstCount": 2,
												"burstDelay": 1.75,
												"simulationSpace": "World",
												"emitRate": 6
											},
											"scaleX": 0.7999999999999988,
											"scaleY": 0.7999999999999992,
											"scaleZ": 0.7999999999999999,
											"rotationX": 13.000000000000004,
											"rotationY": -124.3,
											"rotationZ": -15.600000000000014,
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 1.4058268495515969,
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
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.46078431372549017,
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
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.05,
															"topSpan": 0.1,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.875
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
																		}
																	]
																}
															]
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -1.7929952953638137,
																"dt": -0.40087293189028356
															},
															"nextHandle": {
																"dv": 1.2300000000000002,
																"dt": 0.275
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.71
															},
															"nextHandle": {
																"dv": -4.522676762219434e-16,
																"dt": 0.3077538196705844
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
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -3.0741117008196386,
																"dt": -0.020471332080930014
															},
															"nextHandle": {
																"dv": 1.5016666666666665,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.885
															},
															"nextHandle": {
																"dv": -4.2714365710452757e-16,
																"dt": 0.3077552339282316
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.44831909179687623,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.47234619140625134,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
															}
														},
														{
															"time": 4.452951821982862,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.026098452098669,
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
									"type": "object",
									"name": "SmokeSmall",
									"x": 5.57564,
									"y": 5.17274,
									"z": 0.50382,
									"scaleX": 0.25,
									"scaleY": 0.25,
									"scaleZ": 0.25,
									"rotationX": -77.4,
									"rotationY": 20.4,
									"rotationZ": -57.3,
									"children": [
										{
											"type": "emitter",
											"name": "Smoke_Continuous",
											"props": {
												"lifeTime": 2.25,
												"alignMode": "Screen",
												"instScale_rand": 0.5,
												"maxCount": 50,
												"instRotation_rand": [
													0,
													0,
													180
												],
												"instStretch_rand": [
													0.1,
													0.1,
													0.1
												],
												"frameCount": 16,
												"frameDivisionX": 4,
												"frameDivisionY": 4,
												"animationSpeed": 0,
												"randomColor1": [
													1,
													1,
													1,
													1
												],
												"emitAngle": 24.55,
												"instSpeed": [
													4,
													0,
													0
												],
												"instSpeed_rand": [
													1.5,
													0,
													0
												],
												"enableSort": false,
												"instScale": 3.25,
												"seedGroup": 2,
												"tag": null,
												"burstParticleCount": 5,
												"lifeTimeRand": 0.25,
												"emitShape": "Cone",
												"burstCount": 2,
												"burstDelay": 1.75,
												"simulationSpace": "World",
												"emitRate": 6,
												"instWorldSpeed": [
													0,
													0,
													1
												]
											},
											"x": 0.18264,
											"y": 0.0196,
											"z": 0.18713,
											"scaleX": 0.7999999999999988,
											"scaleY": 0.7999999999999992,
											"scaleZ": 0.7999999999999999,
											"rotationX": 21.1,
											"rotationY": -139.9,
											"rotationZ": -24.8,
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
															"isInstance": true,
															"children": [
																{
																	"type": "curve",
																	"name": "color.h",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.8573547202779161,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 1.4058268495515969,
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
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.31063829787234043,
																			"mode": 2
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "color.l",
																	"keys": [
																		{
																			"time": 0,
																			"value": 0.6647058823529411,
																			"mode": 2
																		},
																		{
																			"time": 0.9049999999999999,
																			"value": 0.46078431372549017,
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
																"texture": "Fx/noise/Wave_02.jpg.png",
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
																				"dv": 0.1614372094585777,
																				"dt": -0.537585907497062
																			},
																			"nextHandle": {
																				"dv": -0.16666666666666674,
																				"dt": 0.5549999999999999
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.8333333333333333,
																				"dt": -0.30000000000000004
																			},
																			"nextHandle": {
																				"dv": -0.7113159996271997,
																				"dt": 0.25607375986579195
																			}
																		}
																	]
																},
																{
																	"type": "curve",
																	"name": "width",
																	"keyMode": 0,
																	"keys": [
																		{
																			"time": 0,
																			"value": 1,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.44516906872488615,
																				"dt": -0.4813254700769495
																			},
																			"nextHandle": {
																				"dv": -0.30000000000000004,
																				"dt": 0.325048007965088
																			}
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0.36666666666666664,
																				"dt": -0.2694946861267089
																			},
																			"nextHandle": {
																				"dv": -0.36666666666666664,
																				"dt": 0.2694946861267089
																			}
																		}
																	]
																}
															]
														},
														{
															"type": "fakeLight",
															"name": "FakeLight",
															"props": {
																"tag": "WIP"
															},
															"normalMap": "Fx/DistortionMaps/SphereClean.png",
															"topBrighten": true,
															"topIntensity": 0.05,
															"topSpan": 0.1,
															"dirIntensity": 0.45,
															"dirSpan": 0.67,
															"sandBlend": 0.2,
															"envBlend": 0.3
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
																			"time": 0,
																			"value": 0,
																			"mode": 2
																		},
																		{
																			"time": 0.0313895804049744,
																			"value": 1,
																			"mode": 2
																		},
																		{
																			"time": 1,
																			"value": 0,
																			"mode": 0,
																			"prevHandle": {
																				"dv": 0,
																				"dt": -0.875
																			},
																			"nextHandle": {
																				"dv": -2.5581510915522486e-16,
																				"dt": 0.3133333333333333
																			}
																		}
																	]
																}
															]
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
																"texture": "Fx/Alphas/TS_Dust_01_1024.png"
															}
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
															"mode": 0
														},
														{
															"time": 1,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.026997755331088613,
																"dt": -0.7749999999999999
															},
															"nextHandle": {
																"dv": 0.012705940615832523,
																"dt": 0.3333055879251503
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
															"value": 0.3,
															"mode": 0,
															"prevHandle": {
																"dv": -3.0741117008196386,
																"dt": -0.020471332080930014
															},
															"nextHandle": {
																"dv": 1.5016666666666665,
																"dt": 0.009999999999999995
															}
														},
														{
															"time": 1,
															"value": 2,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.885
															},
															"nextHandle": {
																"dv": -4.2714365710452757e-16,
																"dt": 0.3077552339282316
															}
														}
													]
												},
												{
													"type": "curve",
													"name": "emitRate",
													"keys": [
														{
															"time": 0.5589363757474934,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.5829634753568685,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 0,
																"dt": -0.003333333333333332
															},
															"nextHandle": {
																"dv": 0,
																"dt": 0.003333333333333332
															}
														},
														{
															"time": 4.3836678882548,
															"value": 1,
															"mode": 2
														},
														{
															"time": 5.9568145183706065,
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
							"type": "object",
							"name": "Electricity",
							"scaleX": 0.5,
							"scaleY": 0.5,
							"scaleZ": 0.5,
							"children": [
								{
									"type": "object",
									"name": "Elec01",
									"x": 12.10983,
									"y": 11.36748,
									"z": -0.07379,
									"scaleX": 2,
									"scaleY": 2,
									"rotationX": 139.3,
									"rotationY": -26.5,
									"rotationZ": -51.5,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.6,
													1.2,
													1
												],
												"lifeTime": 0.15,
												"instScale": 1.2,
												"burstCount": 5,
												"burstDelay": 2.75
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
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
																	"culling": "None",
																	"colorMask": 255,
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec02",
									"x": 0.20873,
									"y": 13.4962,
									"z": -4.50157,
									"scaleX": 3,
									"scaleY": 3,
									"scaleZ": 3,
									"rotationX": 126.3,
									"rotationY": 53.5,
									"rotationZ": 16.6,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -4.1,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.5,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.2,
												"burstCount": 7,
												"burstDelay": 3
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
												}
											]
										}
									]
								},
								{
									"type": "object",
									"name": "Elec04",
									"x": 5.52552,
									"y": 12.70936,
									"z": 2.79142,
									"scaleX": 2.5,
									"scaleY": 2.5,
									"scaleZ": 2.5,
									"rotationX": 164.4,
									"rotationY": 34.8,
									"rotationZ": -51.5,
									"children": [
										{
											"type": "emitter",
											"name": "emitter",
											"props": {
												"emitRate": 1,
												"maxCount": 1,
												"frameCount": 4,
												"frameDivisionY": 4,
												"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
												"instScale_rand": 0,
												"warmUpTime": -5,
												"emitType": "Burst",
												"enableSort": false,
												"animationSpeed": 0.7,
												"instStretch": [
													1.45,
													0.95,
													1
												],
												"lifeTime": 0.1,
												"instScale": 1.5,
												"burstCount": 4,
												"burstDelay": 0.75
											},
											"scaleX": 0.1,
											"scaleY": 0.1,
											"scaleZ": 0.1,
											"rotationX": -49.1,
											"rotationY": 75.2,
											"rotationZ": -109.4,
											"children": [
												{
													"type": "polygon",
													"name": "polygon",
													"y": 0.25,
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
																	"depthTest": "Less",
																	"emissive": 10
																}
															},
															"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"name": "NightEmissive",
															"source": "shaders/NightEmissive.hx",
															"props": {
																"amount": 0.9,
																"ATTENUATE": true,
																"emissiveMap": null
															},
															"isInstance": true
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
													},
													"isInstance": true
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
							"children": [
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_01",
									"x": 5.75673,
									"y": 5.68558,
									"z": -0.05197,
									"scaleX": 4,
									"scaleY": 4.8,
									"scaleZ": 5,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 3.775733779020644,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 3.785733779020644,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.099709895201062,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.519608380779536,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.5296083807795355,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.914929254040034,
															"value": 0,
															"mode": 2
														},
														{
															"time": 9.259991417720487,
															"value": 0,
															"mode": 2
														},
														{
															"time": 9.269991417720487,
															"value": 1,
															"mode": 2
														},
														{
															"time": 9.573191177015163,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 12.057666488180644,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 12.067666488180643,
															"value": 1,
															"mode": 2
														},
														{
															"time": 12.34508410859859,
															"value": -0.016666666666666663,
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
													0.4666666666666667,
													0.8352941176470589,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_02",
									"x": 0.89705,
									"y": 6.42863,
									"z": -1.79825,
									"scaleX": 6,
									"scaleY": 6,
									"scaleZ": 4,
									"rotationY": 60,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 4.145656510239794,
															"value": 0,
															"mode": 2
														},
														{
															"time": 4.155656510239794,
															"value": 1,
															"mode": 2
														},
														{
															"time": 4.405514976062371,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.107462689710107,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.1174626897101065,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.340600640607324,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.134362276329208,
															"value": 0,
															"mode": 2
														},
														{
															"time": 10.144362276329208,
															"value": 1,
															"mode": 2
														},
														{
															"time": 10.401505170065008,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.131371615427712,
															"value": 0,
															"mode": 2
														},
														{
															"time": 13.141371615427712,
															"value": 1,
															"mode": 2
														},
														{
															"time": 13.439613415892097,
															"value": 0,
															"mode": 2
														},
														{
															"time": 16.11778895367246,
															"value": 0,
															"mode": 2
														},
														{
															"time": 16.12778895367246,
															"value": 1,
															"mode": 2
														},
														{
															"time": 16.439883776642652,
															"value": 0,
															"mode": 2
														},
														{
															"time": 19.13470557571762,
															"value": 0,
															"mode": 2
														},
														{
															"time": 19.144705575717623,
															"value": 1,
															"mode": 2
														},
														{
															"time": 19.45680039868781,
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
													0.4666666666666667,
													0.8352941176470589,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "ElectricitySmallLight_03",
									"x": 2.83205,
									"y": 5.29281,
									"z": 1.01842,
									"scaleX": 4,
									"scaleY": 4,
									"scaleZ": 2,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 3,
									"emissive": 45,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 0.5
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 5.0011305346611685,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.011130534661168,
															"value": 1.2,
															"mode": 2
														},
														{
															"time": 5.239294969095998,
															"value": -0.016666666666666663,
															"mode": 2
														},
														{
															"time": 5.82679531991924,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5.84991345495407,
															"value": 0.9830555555555555,
															"mode": 2
														},
														{
															"time": 6.098132209417077,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.662263191304579,
															"value": 0,
															"mode": 2
														},
														{
															"time": 6.6722631913045785,
															"value": 1,
															"mode": 2
														},
														{
															"time": 6.922121657127155,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.290597666566022,
															"value": 0,
															"mode": 2
														},
														{
															"time": 7.300597666566022,
															"value": 1,
															"mode": 2
														},
														{
															"time": 7.523735617463238,
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
													0.4666666666666667,
													0.8352941176470589,
													1
												]
											},
											"isInstance": true
										},
										{
											"type": "shader",
											"name": "DissolveMap",
											"source": "shaders/DissolveMap.hx",
											"props": {
												"useSourceUVs": false,
												"useScale": true,
												"wrap": true,
												"progress": 0.45,
												"saturation": 1,
												"width": 1,
												"uvScaleX": 3,
												"uvScaleY": 3.25,
												"texture": "Fx/noise/T_Fire.png",
												"uvShift": [
													0,
													-0.2
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
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.01,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5274218750000008,
													"value": 1,
													"mode": 2
												},
												{
													"time": 0.5374218750000006,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo01",
									"x": 3.38765,
									"y": 2.9002,
									"z": 2.01621,
									"scaleX": 6.75,
									"scaleY": 6.75,
									"scaleZ": 2.81,
									"rotationY": -22.9,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.060286413712068665,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.17404910478720237,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.5562534919013706,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0.4880929892510185,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.4980929892510185,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": 5.24624,
									"y": 4.60712,
									"z": 0.09716,
									"scaleX": 5.5,
									"scaleY": 5.5,
									"scaleZ": 2.81,
									"rotationX": 90,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.4485988381252106,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.5623615292003443,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2316224725808222,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0.5758696582113846,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5858696582113846,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": 3.37173,
									"y": 4.0993,
									"z": -1.99104,
									"scaleX": 4.5,
									"scaleY": 4.5,
									"scaleZ": 2.81,
									"rotationY": 20.6,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.4485988381252106,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.5623615292003443,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2316224725808222,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0.5758696582113846,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5858696582113846,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "advancedDecal",
									"name": "Explo02",
									"x": 0.00392,
									"y": 4.40195,
									"z": 0.01913,
									"scaleX": 3.5,
									"scaleY": 3.5,
									"scaleZ": 2,
									"rotationY": 95,
									"albedoMap": "Fx/Alphas/T_circle2.png",
									"albedoStrength": 2,
									"emissive": 40,
									"children": [
										{
											"type": "material",
											"name": "material",
											"props": {
												"PBR": {
													"mode": "AfterTonemapping",
													"blend": "Add",
													"shadows": false,
													"culling": "Back",
													"colorMask": 255,
													"emissive": 70
												}
											}
										},
										{
											"type": "shader",
											"name": "AutoAlpha",
											"source": "shaders/AutoAlpha.hx",
											"props": {
												"scale": 2
											},
											"isInstance": true,
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.4485988381252106,
															"value": -0.01666666666666672,
															"mode": 0
														},
														{
															"time": 0.5623615292003443,
															"value": 1,
															"mode": 2
														},
														{
															"time": 2.2316224725808222,
															"value": 0,
															"mode": 0,
															"prevHandle": {
																"dv": -0.016666666666666663,
																"dt": -1.3625240054869698
															},
															"nextHandle": {
																"dv": 0.004145123828510827,
																"dt": 0.33331459999053903
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
													0.8745098039215686,
													0.3803921568627451,
													0.22745098039215686
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "visibility",
											"enabled": false,
											"keys": [
												{
													"time": 0.5758696582113846,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5858696582113846,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5311090224236255,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.5479840224236256,
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
					"type": "model",
					"name": "Wraith",
					"source": "Vehicle/Smuggler/Wraith/Wraith.fbx",
					"editorOnly": true,
					"scaleX": 2,
					"scaleY": 2,
					"scaleZ": 2,
					"children": [
						{
							"type": "animEvent",
							"name": "animEvent",
							"animation": "Anim/Wraith/Anim_Wraith_Death.fbx"
						}
					]
				},
				{
					"type": "constraint",
					"name": "constraint",
					"object": "FXAnimation.FXRoot.Death",
					"target": "FXAnimation.FXRoot.Wraith.root.B_ROOT.B_Body"
				}
			]
		}
	]
}