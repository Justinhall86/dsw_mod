{
	"type": "fx",
	"duration": 90,
	"cullingRadius": 5000,
	"children": [
		{
			"type": "object",
			"name": "FXRoot",
			"scaleX": 0.8,
			"scaleY": 0.8,
			"scaleZ": 0.8,
			"rotationZ": 90,
			"children": [
				{
					"type": "polygon",
					"name": "Ground",
					"editorOnly": true,
					"z": 0.02,
					"scaleX": 4000,
					"scaleY": 4000,
					"scaleZ": 2,
					"color": -14869219,
					"kind": 0,
					"args": [
						0
					]
				},
				{
					"type": "object",
					"name": "LeaveOrder",
					"scaleX": 0.25,
					"scaleY": 0.25,
					"scaleZ": 0.25,
					"children": [
						{
							"type": "object",
							"name": "Center",
							"x": 1.0765799026668183e-15,
							"y": -8.758115402030107e-47,
							"children": [
								{
									"type": "advancedDecal",
									"name": "Solari",
									"x": -1.0765799026668185e-15,
									"scaleX": 220,
									"scaleY": 220,
									"scaleZ": 150,
									"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
									"fadePower": 0.52,
									"emissive": 1,
									"renderMode": "BeforeTonemapping",
									"children": [
										{
											"type": "shader",
											"name": "AlphaMap",
											"source": "shaders/AlphaMap.hx",
											"props": {
												"useSourceUVs": false,
												"onDecal": true,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.1,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 1,
												"texture": "Fx/Alphas/T_Logo_Solari.png"
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
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.46,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.9949999999999999,
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
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
									"name": "Countdown",
									"x": -1.0765799026668185e-15,
									"scaleX": 1.1,
									"scaleY": 1.1,
									"scaleZ": 1.1,
									"children": [
										{
											"type": "advancedDecal",
											"name": "dizaine",
											"x": -22.232449999999996,
											"y": 5.787918690870729e-31,
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 100,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 1,
														"texture": "Fx/Alphas/T_Countdown.png",
														"speed": 0,
														"frameDivision": [
															16,
															1
														],
														"totalFrames": 10,
														"startTime": 0,
														"loop": true,
														"useSourceUVs": false,
														"blendBetweenFrames": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "startFrame",
															"keys": [
																{
																	"time": -8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 11,
																	"value": 2,
																	"mode": 2
																},
																{
																	"time": 21,
																	"value": 3,
																	"mode": 2
																},
																{
																	"time": 31,
																	"value": 4,
																	"mode": 2
																},
																{
																	"time": 41,
																	"value": 5,
																	"mode": 2
																},
																{
																	"time": 51,
																	"value": 6,
																	"mode": 2
																},
																{
																	"time": 61,
																	"value": 7,
																	"mode": 2
																},
																{
																	"time": 71,
																	"value": 8,
																	"mode": 2
																},
																{
																	"time": 81,
																	"value": 9,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "unités",
											"x": 22.23245,
											"y": 7.888609052210118e-31,
											"scaleX": 60,
											"scaleY": 60,
											"scaleZ": 100,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 1,
														"texture": "Fx/Alphas/T_Countdown01.png",
														"speed": 0,
														"frameDivision": [
															16,
															1
														],
														"totalFrames": 10,
														"startTime": 1,
														"loop": false,
														"useSourceUVs": false,
														"blendBetweenFrames": false
													},
													"isInstance": true,
													"children": [
														{
															"type": "curve",
															"name": "startFrame",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 10,
																	"value": 10,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "AutoAlpha",
													"source": "shaders/AutoAlpha.hx",
													"props": {
														"scale": 1
													}
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
													1,
													1
												]
											}
										}
									]
								},
								{
									"type": "object",
									"name": "Circle",
									"x": 2.1531598053336366e-15,
									"y": -1.7516230804060213e-46,
									"children": [
										{
											"type": "advancedDecal",
											"name": "FadeCircle",
											"scaleX": 250,
											"scaleY": 250,
											"scaleZ": 150,
											"rotationZ": 14,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadeStart": 1,
											"emissive": 0.5,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 0.4
													}
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
													"props": {
														"useSourceUVs": false,
														"useScale": false,
														"wrap": true,
														"progress": 0.3,
														"saturation": 0.5,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 1,
														"texture": "Fx/Alphas/T-InnerGradient.png",
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
													"name": "AlphaMult",
													"source": "shaders/AlphaMult.hx",
													"props": {
														"alpha": 1
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
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -0.007005963280351968,
																		"dt": 0.25978568203747293
																	}
																},
																{
																	"time": 0.7419389685756203,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.7474082713866932,
																		"dt": -0.2930318751155044
																	},
																	"nextHandle": {
																		"dv": 0.7199976844389426,
																		"dt": 0.2782636400252929
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "InsideCircle",
											"scaleX": 170,
											"scaleY": 170,
											"scaleZ": 150,
											"rotationZ": 14,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 3,
											"emissive": 1,
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
														"texture": "Fx/Alphas/FloorScan_Round_12_1024_thick.png"
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
															"value": 1,
															"mode": 2
														},
														{
															"time": 1.4949999999999999,
															"value": 0.01,
															"mode": 0,
															"prevHandle": {
																"dv": 0.004397321428571419,
																"dt": -1.0511728395061728
															},
															"nextHandle": {
																"dv": -0.0007187892533181729,
																"dt": 0.1671095069447516
															}
														},
														{
															"time": 1.9999999999999998,
															"value": 0,
															"mode": 2
														},
														{
															"time": 2.5,
															"value": 0,
															"mode": 0
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
															"keyMode": 1,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 1,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": -0.007005963280351968,
																		"dt": 0.25978568203747293
																	}
																},
																{
																	"time": 0.7419389685756203,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.7474082713866932,
																		"dt": -0.2930318751155044
																	},
																	"nextHandle": {
																		"dv": 0.7199976844389426,
																		"dt": 0.2782636400252929
																	}
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Border",
											"x": -1.7763568394002505e-15,
											"scaleX": 225.00000000000003,
											"scaleY": 225.00000000000003,
											"scaleZ": 150,
											"rotationZ": 14,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 0,
														"vOffset": 1,
														"texture": "Fx/Alphas/FloorScan_Round_13_1024.png"
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
															"time": 2.5,
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
											"name": "NightEmissive",
											"source": "shaders/NightEmissive.hx",
											"props": {
												"amount": 0.75,
												"ATTENUATE": true,
												"emissiveMap": null
											},
											"isInstance": true
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
											"keyMode": 1,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 1,
													"prevHandle": {
														"dv": 0,
														"dt": -0.5
													},
													"nextHandle": {
														"dv": 0,
														"dt": 0.08333333333333333
													}
												},
												{
													"time": 0.25,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": -1.148563639322917,
														"dt": -0.11363636363636365
													},
													"nextHandle": {
														"dv": 0.5501284731878644,
														"dt": 0.0551831497059759
													}
												}
											]
										}
									]
								},
								{
									"type": "curve",
									"name": "scale",
									"keyMode": 0,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.10849004335087647,
											"value": 2,
											"mode": 0
										},
										{
											"time": 0.2524054069795902,
											"value": 1,
											"mode": 0,
											"prevHandle": {
												"dv": 0.01220930422611688,
												"dt": -0.15055761118080818
											},
											"nextHandle": {
												"dv": -0.01220930422611688,
												"dt": 0.15055761118080818
											}
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Sides",
							"children": [
								{
									"type": "object",
									"name": "Right",
									"rotationZ": 180,
									"children": [
										{
											"type": "advancedDecal",
											"name": "BorderSweep",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder03.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 1,
														"width": 0.2,
														"useU": true,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0032299653063652123,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 0.95,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8641666666666666,
																		"dt": -0.4726623559831007
																	},
																	"nextHandle": {
																		"dv": 0.9541164671079538,
																		"dt": 0.521373034295613
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2605488622810605,
																	"mode": 2
																},
																{
																	"time": 1.4949999999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.004397321428571419,
																		"dt": -1.0511728395061728
																	},
																	"nextHandle": {
																		"dv": -0.0007187892533181729,
																		"dt": 0.1671095069447516
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Border",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.35,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder03.png"
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "In Sweep",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder04.png"
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
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.6,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.46,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 1,
														"width": 0.22,
														"useU": true,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0032299653063652123,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 0.95,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8641666666666666,
																		"dt": -0.4726623559831007
																	},
																	"nextHandle": {
																		"dv": 0.9541164671079538,
																		"dt": 0.521373034295613
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2605488622810605,
																	"mode": 2
																},
																{
																	"time": 1.4949999999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.004397321428571419,
																		"dt": -1.0511728395061728
																	},
																	"nextHandle": {
																		"dv": -0.0007187892533181729,
																		"dt": 0.1671095069447516
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "in",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.05,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder04.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 0.5
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.46,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.5,
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
									"name": "Left",
									"children": [
										{
											"type": "advancedDecal",
											"name": "BorderSweep",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder03.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 1,
														"width": 0.2,
														"useU": true,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0032299653063652123,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 0.95,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8641666666666666,
																		"dt": -0.4726623559831007
																	},
																	"nextHandle": {
																		"dv": 0.9541164671079538,
																		"dt": 0.521373034295613
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2605488622810605,
																	"mode": 2
																},
																{
																	"time": 1.4949999999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.004397321428571419,
																		"dt": -1.0511728395061728
																	},
																	"nextHandle": {
																		"dv": -0.0007187892533181729,
																		"dt": 0.1671095069447516
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "Border",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 1,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.35,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder03.png"
													},
													"isInstance": true
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "In Sweep",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.1,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder04.png"
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
													"children": [
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.6,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.46,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 0,
																	"mode": 2
																}
															]
														}
													]
												},
												{
													"type": "shader",
													"name": "UVSweep",
													"source": "shaders/UVSweep.hx",
													"props": {
														"saturation": 1,
														"width": 0.22,
														"useU": true,
														"progress": 1
													},
													"children": [
														{
															"type": "curve",
															"name": "progress",
															"enabled": false,
															"keyMode": 0,
															"keys": [
																{
																	"time": -0.0032299653063652123,
																	"value": 0,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.3333333333333333
																	}
																},
																{
																	"time": 0.95,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": -0.8641666666666666,
																		"dt": -0.4726623559831007
																	},
																	"nextHandle": {
																		"dv": 0.9541164671079538,
																		"dt": 0.521373034295613
																	}
																}
															]
														},
														{
															"type": "curve",
															"name": "progress",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0.2605488622810605,
																	"mode": 2
																},
																{
																	"time": 1.4949999999999999,
																	"value": 1,
																	"mode": 0,
																	"prevHandle": {
																		"dv": 0.004397321428571419,
																		"dt": -1.0511728395061728
																	},
																	"nextHandle": {
																		"dv": -0.0007187892533181729,
																		"dt": 0.1671095069447516
																	}
																},
																{
																	"time": 1.9999999999999998,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 2.5,
																	"value": 1,
																	"mode": 0
																}
															]
														}
													]
												}
											]
										},
										{
											"type": "advancedDecal",
											"name": "in",
											"x": -197.32640000000004,
											"scaleX": 400,
											"scaleY": 400,
											"scaleZ": 200,
											"albedoMap": "Fx/Gradients/z_FillWhite.jpg",
											"fadePower": 0.52,
											"emissive": 2,
											"renderMode": "BeforeTonemapping",
											"children": [
												{
													"type": "shader",
													"name": "AlphaMap",
													"source": "shaders/AlphaMap.hx",
													"props": {
														"useSourceUVs": false,
														"onDecal": true,
														"wrap": true,
														"invert": false,
														"replace": false,
														"alpha": 0.05,
														"uScale": 1,
														"vScale": 1,
														"uOffset": 1.01,
														"vOffset": 1,
														"texture": "Fx/Alphas/T_CountdownBorder04.png"
													},
													"isInstance": true
												},
												{
													"type": "shader",
													"name": "AlphaCycle",
													"source": "shaders/AlphaCycle.hx",
													"props": {
														"minAlpha": 0.25,
														"maxAlpha": 1,
														"frequency": 0.5
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
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.3,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.9,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"enabled": false,
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.6,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.6,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 1.8,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2,
																	"value": 1,
																	"mode": 2
																}
															]
														},
														{
															"type": "curve",
															"name": "alpha",
															"loop": true,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 0.46,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 0.9949999999999999,
																	"value": 1,
																	"mode": 2
																},
																{
																	"time": 1.9999999999999998,
																	"value": 0,
																	"mode": 2
																},
																{
																	"time": 2.5,
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
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 1,
										"saturation": 1,
										"width": 1,
										"uvScaleX": 1,
										"uvScaleY": 1,
										"texture": "Fx/Gradients/uGrad_inv.png",
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
											"enabled": false,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 0.5,
													"value": 0.5,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"enabled": false,
											"keyMode": 0,
											"keys": [
												{
													"time": 0.25,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.029866557929799555,
														"dt": -0.4999202996727223
													},
													"nextHandle": {
														"dv": 0.008333333333333331,
														"dt": 0.13857148179752704
													}
												},
												{
													"time": 0.75,
													"value": 0.5,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "progress",
											"keyMode": 0,
											"keys": [
												{
													"time": 0.08253839666193186,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": -0.029866557929799555,
														"dt": -0.4999202996727223
													},
													"nextHandle": {
														"dv": 0.008333333333333331,
														"dt": 0.13857148179752704
													}
												},
												{
													"time": 0.5825383966619319,
													"value": 0.5,
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
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.8
							}
						}
					]
				}
			]
		}
	]
}