{
	"type": "fx",
	"cullingRadius": 35,
	"markers": [
		{
			"t": 0
		}
	],
	"children": [
		{
			"type": "polygon",
			"name": "Ground",
			"editorOnly": true,
			"x": 1.59326,
			"y": 0.05298,
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
			"name": "FXRoot",
			"children": [
				{
					"type": "reference",
					"name": "Prefab_MissileBattery",
					"source": "Structure/Buildings/MissileBattery/Prefab_MissileBattery.prefab",
					"editorOnly": true,
					"scaleX": 1.5,
					"scaleY": 1.5,
					"scaleZ": 1.5
				},
				{
					"type": "object",
					"name": "Sabotage",
					"scaleX": 0.55,
					"scaleY": 0.55,
					"scaleZ": 0.55,
					"children": [
						{
							"type": "object",
							"name": "Electricity",
							"x": -0.02170666666666667,
							"y": -3.851859888774472e-34,
							"z": -0.8333333333333333,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_ElecRound",
									"props": {
										"emitRate": 1,
										"maxCount": 8,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.3,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											90,
											90,
											360
										],
										"emitType": "InfinityRandom",
										"emitRateMin": 1,
										"emitRateChangeDelay": 0.1,
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
									"z": 3.25,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Swirl",
											"source": "Fx/Event/Swirl.fbx",
											"scaleX": 5,
											"scaleY": 5,
											"scaleZ": 4.5,
											"rotationX": 25.4,
											"rotationZ": -94.4,
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
															"parallax": 0,
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
												},
												{
													"type": "shader",
													"name": "AnimatedTexture",
													"source": "h3d.shader.AnimatedTexture",
													"props": {
														"startFrame": 0,
														"texture": "Fx/Alphas/T_ElectricArc_1x4_04.png",
														"speed": 20,
														"frameDivision": [
															1,
															4
														],
														"totalFrames": 4,
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
													}
												},
												{
													"type": "curve",
													"name": "rotation.z",
													"keys": [
														{
															"time": 0,
															"value": 0,
															"mode": 2
														},
														{
															"time": 5,
															"value": 1,
															"mode": 2
														}
													],
													"loop": true
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
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
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
													0.33725490196078434,
													0.5137254901960784,
													0.996078431372549
												]
											},
											"isInstance": true
										},
										{
											"type": "curve",
											"name": "emitRateMax",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.291448756023153,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Elec2",
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.5,
										"enableSort": false,
										"animationSpeed": 0.7,
										"lifeTime": 0.15,
										"burstDelay": 2.2,
										"instRotation_rand": [
											0,
											0,
											360
										],
										"emitType": "InfinityRandom",
										"emitRateMin": 1,
										"emitRateChangeDelay": 0.1,
										"lifeTimeRand": 0.05,
										"warmUpTime": -0.6,
										"seedGroup": 1,
										"instRotation": [
											90,
											0,
											90
										],
										"instScale": 1.5,
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
									"z": 0.25,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Overlord_Electricity_02",
											"source": "Fx/Meshes_Common/ElectricityCarthag.fbx",
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
															"emissive": 20
														}
													},
													"diffuseMap": "Fx/Gradients/z_FillWhite.jpg"
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
															"keyMode": 0,
															"keys": [
																{
																	"time": 0,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.5
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
																	}
																},
																{
																	"time": 0.5,
																	"value": 1,
																	"prevHandle": {
																		"dv": 1.3267006990762992e-16,
																		"dt": -0.325
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.345
																	}
																},
																{
																	"time": 1,
																	"value": 0,
																	"prevHandle": {
																		"dv": 0,
																		"dt": -0.16666666666666666
																	},
																	"nextHandle": {
																		"dv": 0,
																		"dt": 0.16666666666666666
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
													"type": "shader",
													"name": "ColorSet",
													"source": "shaders/ColorSet.hx",
													"enabled": false,
													"props": {
														"amount": 1,
														"color": [
															1,
															0.2,
															0.2
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
														"progress": 0.5,
														"saturation": 0,
														"width": 0.45,
														"uvScaleX": 2,
														"uvScaleY": 2,
														"texture": "Fx/noise/T_Fire.png",
														"uvShift": [
															0,
															0
														],
														"uvShiftSpeed": [
															0,
															3
														]
													}
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
														"progress": 0.36,
														"saturation": 0,
														"width": 1,
														"uvScaleX": 1,
														"uvScaleY": 0.5,
														"texture": "Fx/noise/T_Noise_Wave_03.png",
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
															0.33725490196078434,
															0.5137254901960784,
															0.996078431372549
														]
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
										},
										{
											"type": "curve",
											"name": "emitRateMax",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 5,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 5,
													"mode": 2
												},
												{
													"time": 2.0564487560231535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"keys": [
												{
													"time": 1.0536837056690689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.067352352154107,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1643843841681167,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.3957684605092169,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.895856625504498,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9107846304297302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.000352659981124,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.0564487560231535,
													"value": 0,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											],
											"loop": true
										}
									]
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Glitch",
							"locked": true,
							"scaleX": 15,
							"scaleY": 15,
							"scaleZ": 8.07,
							"rotationZ": 90,
							"albedoMap": "Fx/Alphas/T_SpiceAlpha.png",
							"fadePower": 1.64,
							"emissive": 4,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "DissolveMap",
									"source": "shaders/DissolveMap.hx",
									"props": {
										"useSourceUVs": false,
										"useScale": true,
										"wrap": true,
										"progress": 0.75,
										"saturation": 1,
										"width": 0.49,
										"uvScaleX": 1.5,
										"uvScaleY": 4.5,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
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
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
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
										"progress": 0.4,
										"saturation": 1,
										"width": 0.34,
										"uvScaleX": 1.5,
										"uvScaleY": 4.5,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
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
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0057082608281362,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.7479888421662009,
													"value": 0.6632480621337892,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.940717495120302,
													"value": 1,
													"mode": 2
												},
												{
													"time": 2.995,
													"value": 1,
													"mode": 2
												}
											],
											"loop": true
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
										"progress": 0.62,
										"saturation": 1,
										"width": 0.17,
										"uvScaleX": 3,
										"uvScaleY": 4.5,
										"texture": "Fx/noise/N_AnisotropicPixel.png",
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
											0.4980392156862745,
											0.788235294117647,
											0.9725490196078431
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
										"useScale": false,
										"wrap": true,
										"progress": 0.8,
										"saturation": 0,
										"width": 1,
										"uvScaleX": 3,
										"uvScaleY": 4.5,
										"texture": "Fx/Alphas/T_circle2.png",
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
										"useSourceUVs": false,
										"useScale": false,
										"wrap": true,
										"progress": 0.4,
										"saturation": 1,
										"width": 0.75,
										"uvScaleX": 5,
										"uvScaleY": 3,
										"texture": "Fx/Gradients/ShieldMask.png",
										"uvShift": [
											0,
											0.1
										],
										"uvShiftSpeed": [
											0,
											0.1
										]
									}
								},
								{
									"type": "shader",
									"name": "AlphaMult",
									"source": "shaders/AlphaMult.hx",
									"props": {
										"alpha": 2
									}
								},
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
											"emissive": 5
										}
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