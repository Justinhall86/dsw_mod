{
	"type": "fx",
	"markers": [
		{
			"t": 0
		}
	],
	"cullingRadius": 150,
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
			"scaleX": 1.2,
			"scaleY": 1.2,
			"scaleZ": 1.2,
			"rotationZ": 90,
			"children": [
				{
					"type": "model",
					"name": "BaseArrakeen",
					"source": "Structure/Base/Arrakeen/BaseArrakeen.fbx",
					"editorOnly": true,
					"z": -0.15,
					"scaleX": 1.0000000000000002,
					"scaleY": 1.0000000000000002,
					"rotationZ": 25.999999999999996
				},
				{
					"type": "object",
					"name": "Sabotage",
					"children": [
						{
							"type": "advancedDecal",
							"name": "advancedDecal_Glitch",
							"locked": true,
							"scaleX": 65,
							"scaleY": 65,
							"scaleZ": 35,
							"rotationZ": -155,
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
										"progress": 1,
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
											-0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
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
										"progress": 1,
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
											0.25
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "progress",
											"loop": true,
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
											0.5
										]
									}
								},
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"enabled": false,
									"props": {
										"amount": 1,
										"color": [
											0.7333333333333333,
											0.7411764705882353,
											1
										]
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
										"progress": 0.35,
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
											1.5
										]
									}
								}
							]
						},
						{
							"type": "advancedDecal",
							"name": "FakeLight",
							"scaleX": 64,
							"scaleY": 64,
							"scaleZ": 40,
							"albedoMap": "Fx/Gradients/circGrad01.png",
							"renderMode": "BeforeTonemapping",
							"blendMode": 2,
							"children": [
								{
									"type": "shader",
									"name": "AutoAlpha",
									"source": "shaders/AutoAlpha.hx",
									"props": {
										"scale": 0.25
									},
									"isInstance": true,
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"loop": true,
											"keys": [
												{
													"time": 1.0057082608281362,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0157082608281363,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.1545351473922905,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.178027615839122,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.6062152177460347,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.616215217746035,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.704637188208617,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.7379888421662009,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.995,
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
											0.4627450980392157,
											0.4196078431372549,
											0.984313725490196
										]
									},
									"isInstance": true
								}
							]
						},
						{
							"type": "lookAt",
							"name": "lookAt_Flare",
							"z": 5,
							"scaleX": 50,
							"scaleY": 38.89,
							"scaleZ": 6.96,
							"rotationY": -15.5,
							"rotationZ": 117.6,
							"lockAxis": [
								0,
								0,
								0
							],
							"children": [
								{
									"type": "polygon",
									"name": "polygon",
									"scaleX": 4.25,
									"scaleY": 4.25,
									"scaleZ": 4.25,
									"rotationX": 90,
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
													"culling": "Back",
													"colorMask": 255,
													"emissive": 4
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
												"onDecal": false,
												"wrap": true,
												"invert": false,
												"replace": false,
												"alpha": 0.05,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare08.png"
											},
											"children": [
												{
													"type": "curve",
													"name": "alpha",
													"loop": true,
													"keys": [
														{
															"time": 0,
															"value": 0.1,
															"mode": 2
														},
														{
															"time": 0.042091836734693876,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.1568877551020408,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.28188775510204084,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.32142857142857145,
															"value": 0.1,
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
													0.5843137254901961,
													0.596078431372549,
													0.9764705882352941
												]
											},
											"isInstance": true
										}
									]
								},
								{
									"type": "curve",
									"name": "scale.y",
									"loop": true,
									"keys": [
										{
											"time": 0,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.04193765992712713,
											"value": 1.0666666666666667,
											"mode": 2
										},
										{
											"time": 0.15726622472672672,
											"value": 0.2,
											"mode": 2
										},
										{
											"time": 0.2830792045081081,
											"value": 1.1,
											"mode": 2
										},
										{
											"time": 0.3197746569443443,
											"value": 0,
											"mode": 2
										}
									]
								},
								{
									"type": "curve",
									"name": "visibility",
									"loop": true,
									"keys": [
										{
											"time": 0.9464988181272047,
											"value": 0,
											"mode": 2
										},
										{
											"time": 0.9989208930361138,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2751460059681115,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2961148359316745,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6326050911521808,
											"value": 0,
											"mode": 2
										},
										{
											"time": 1.6426050911521808,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.8774672209883105,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.9508581258607829,
											"value": 0,
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
							"type": "object",
							"name": "Electricity",
							"x": -0.02170666666666667,
							"y": -3.851859888774472e-34,
							"z": -0.8333333333333333,
							"children": [
								{
									"type": "emitter",
									"name": "emitter_Elec1",
									"props": {
										"emitRate": 1,
										"maxCount": 8,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 1,
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
										"instRotation": [
											90,
											0,
											90
										],
										"instScale": 6
									},
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
											"loop": true,
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
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"loop": true,
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
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_Elec2",
									"enabled": false,
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 1,
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
										"instScale": 6
									},
									"x": 0.02170666666666667,
									"y": 7.703719777548943e-34,
									"z": 0.8333333333333333,
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
																	"mode": 0,
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
																	"mode": 0,
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
																	"mode": 0,
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
											"name": "emitRate",
											"enabled": false,
											"loop": true,
											"keys": [
												{
													"time": 0,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0560130294488403,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0660130294488404,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.166605823484578,
													"value": 2,
													"mode": 2
												},
												{
													"time": 1.3894939279714689,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9004040015519283,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.9104040015519286,
													"value": 3,
													"mode": 2
												},
												{
													"time": 2.006564579229347,
													"value": 3,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 2.3,
													"value": 0,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 2.3011061688409944,
													"value": 0.03333333333333333,
													"mode": 2
												},
												{
													"time": 3,
													"value": 0,
													"mode": 2
												}
											]
										},
										{
											"type": "curve",
											"name": "emitRateMax",
											"loop": true,
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
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"loop": true,
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
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"enabled": false,
											"keys": [
												{
													"time": 0.09960194232692691,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "emitter_center",
									"props": {
										"emitRate": 1,
										"maxCount": 5,
										"frameCount": 4,
										"frameDivisionY": 4,
										"spriteSheet": "Fx/Alphas/T_ElectricArc_1x4_03.png",
										"instScale_rand": 0.3,
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
										"instScale": 0.9
									},
									"x": -0.043413333333333345,
									"y": -2.311115933264683e-33,
									"z": -1.6666666666666667,
									"scaleX": 0.01,
									"scaleY": 0.01,
									"scaleZ": 0.010000000000000002,
									"children": [
										{
											"type": "model",
											"name": "Mesh_ElectricityBig",
											"source": "Fx/Structure/CorrinoBase/Mesh_ElectricityBig02.fbx",
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
												},
												{
													"type": "shader",
													"name": "DissolveMap",
													"source": "shaders/DissolveMap.hx",
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
											"loop": true,
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
											]
										},
										{
											"type": "curve",
											"name": "emitRateMin",
											"loop": true,
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
											]
										}
									]
								}
							]
						},
						{
							"type": "object",
							"name": "Sparks",
							"children": [
								{
									"type": "emitter",
									"name": "Sparkles02",
									"props": {
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											18,
											0,
											0
										],
										"lifeTime": 0.55,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.7,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											12,
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
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"burstDelay": 1.5,
										"warmUpTime": -1.4,
										"emitDuration": 100,
										"emitRate": 15
									},
									"x": -1.85766,
									"y": 2.2542,
									"z": 6.58267,
									"scaleX": 1.200000000000001,
									"scaleY": 1.2000000000000004,
									"scaleZ": 1.2000000000000006,
									"rotationX": 18.7,
									"rotationY": -148.9,
									"rotationZ": -28.6,
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
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles03",
									"props": {
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											18,
											0,
											0
										],
										"lifeTime": 0.45,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.7,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											12,
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
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"burstDelay": 1.5,
										"warmUpTime": -2.2,
										"emitDuration": 100,
										"emitRate": 15
									},
									"x": 5.17549,
									"y": 5.60503,
									"z": 3.40208,
									"scaleX": 1.2000000000000006,
									"scaleY": 1.2000000000000002,
									"scaleZ": 1.2000000000000002,
									"rotationX": -58.9,
									"rotationY": -52.8,
									"rotationZ": 64.3,
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
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6,
													"value": 0,
													"mode": 2
												}
											]
										}
									]
								},
								{
									"type": "emitter",
									"name": "Sparkles01",
									"props": {
										"burstParticleCount": 15,
										"emitOrientation": "Speed",
										"emitShape": "Cone",
										"emitAngle": 57.27,
										"instSpeed": [
											18,
											0,
											0
										],
										"lifeTime": 0.45,
										"emitSurface": true,
										"instStretch": [
											2.2,
											1,
											1
										],
										"instScale": 0.7,
										"instScale_rand": 0.3,
										"instSpeed_rand": [
											6,
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
											0.10196078431372549,
											0.3411764705882353,
											1,
											1
										],
										"randomColor2": [
											0.7137254901960784,
											0.17254901960784313,
											0.17254901960784313,
											1
										],
										"lifeTimeRand": 0.2,
										"burstCount": 2,
										"burstDelay": 1.5,
										"warmUpTime": -1,
										"emitDuration": 100,
										"emitRate": 15
									},
									"x": 17.18223,
									"y": 1.60216,
									"z": 3.09127,
									"scaleX": 1.2000000000000006,
									"scaleY": 1.2000000000000002,
									"scaleZ": 1.2000000000000002,
									"rotationY": -63.6,
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
											"name": "emitRate",
											"loop": true,
											"keys": [
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.94828390484374,
													"value": 0,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 4.95828390484374,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.009390681303911,
													"value": 15,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 5.019390681303911,
													"value": 0,
													"mode": 2
												},
												{
													"time": 6,
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
				}
			]
		}
	]
}