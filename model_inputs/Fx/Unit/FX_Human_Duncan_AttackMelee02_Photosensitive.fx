{
	"type": "fx",
	"duration": 5,
	"cullingRadius": 15,
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
					"name": "group",
					"enabled": false,
					"x": 2.63077,
					"y": 0.51747,
					"z": 3.08387,
					"children": [
						{
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"enabled": false,
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387,
							"time": 0.26752,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
											"blend": "Alpha",
											"shadows": false,
											"culling": "None",
											"colorMask": 255,
											"emissive": 2,
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
										"width": 0.33,
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
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.2545446777343758,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1333333333333333,
														"dt": -1.191087646484375
													},
													"nextHandle": {
														"dv": -0.6172737074886301,
														"dt": 0.6499597739869252
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
										"progress": 0.5,
										"saturation": 1,
										"width": 0.43,
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
											0.10196078431372549,
											0.16078431372549018,
											0.11372549019607843
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.815,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.8949999999999999,
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
							"type": "advancedDecal",
							"name": "advancedDecal",
							"enabled": false,
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387,
							"albedoMap": "Fx/Alphas/T_circle4.png",
							"fadePower": 1.05,
							"renderMode": "BeforeTonemapping",
							"children": [
								{
									"type": "shader",
									"name": "ColorSet",
									"source": "shaders/ColorSet.hx",
									"props": {
										"amount": 1,
										"color": [
											0.01568627450980392,
											0.13725490196078433,
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
											1,
											1
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 1.0095998591835813,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0243929678330472,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0456590592531891,
													"value": 0.017046333722095686,
													"mode": 2
												},
												{
													"time": 1.0995837910685489,
													"value": -0.0004975620255037727,
													"mode": 2
												},
												{
													"time": 1.1276854118737365,
													"value": 0.9946913580246914,
													"mode": 2
												},
												{
													"time": 1.14707895210171,
													"value": 1.0333333333333334,
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
									},
									"children": [
										{
											"type": "curve",
											"name": "scale",
											"keys": [
												{
													"time": 1.002704669573757,
													"value": 0,
													"mode": 2
												},
												{
													"time": 1.0212432404941163,
													"value": 0.9777777777777777,
													"mode": 2
												},
												{
													"time": 1.141086775358489,
													"value": 0.9777777777777777,
													"mode": 2
												},
												{
													"time": 1.1570411472636548,
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
							"type": "emitter",
							"name": "Flash_Stars",
							"enabled": false,
							"props": {
								"lifeTime": 0.05,
								"emitType": "Burst",
								"maxCount": 10,
								"alignMode": "Screen",
								"instScale": 3,
								"warmUpTime": -0.3,
								"burstCount": 5,
								"burstDelay": 0.05,
								"instScale_rand": 2
							},
							"scaleX": 5,
							"scaleY": 5,
							"scaleZ": 5,
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
													"emissive": 5,
													"depthTest": "Always"
												}
											}
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
												"alpha": 0.5,
												"uScale": 1,
												"vScale": 1,
												"uOffset": 0,
												"vOffset": 0,
												"texture": "Fx/Alphas/T_Flare06_512.png"
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.7803921568627451,
													1,
													0.7137254901960784
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"enabled": false,
													"keyMode": 0,
													"keys": [
														{
															"time": 0,
															"value": 1,
															"mode": 0,
															"prevHandle": {
																"dv": 2.3379300329638317,
																"dt": -0.26072500472698734
															},
															"nextHandle": {
																"dv": -0.9849817788097429,
																"dt": 0.11
															}
														},
														{
															"time": 0.5399999999999999,
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
							"name": "group",
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387,
							"children": [
								{
									"type": "model",
									"name": "Male01_HarkonnenRabban",
									"source": "Character/Atreide/Unit/Duncan/Male01_AtreidesDuncan.fbx",
									"scaleX": 2.2,
									"scaleY": 2.2,
									"scaleZ": 2.2,
									"children": [
										{
											"type": "animEvent",
											"name": "animEvent",
											"animation": "Anim/Male01/Duncan/Anim_Male01_Duncan_AttackMelee02.fbx"
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
													"depthTest": "Always",
													"emissive": 10
												}
											}
										},
										{
											"type": "shader",
											"name": "ColorSet",
											"source": "shaders/ColorSet.hx",
											"props": {
												"amount": 1,
												"color": [
													0.01568627450980392,
													0.13725490196078433,
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
													1,
													1
												]
											},
											"children": [
												{
													"type": "curve",
													"name": "amount",
													"keys": [
														{
															"time": 0.4095998591835808,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4243929678330467,
															"value": 1,
															"mode": 2
														},
														{
															"time": 0.4456590592531886,
															"value": 0.017046333722095686,
															"mode": 2
														},
														{
															"time": 0.49958379106854833,
															"value": -0.0004975620255037727,
															"mode": 2
														},
														{
															"time": 0.5276854118737359,
															"value": 0.9946913580246914,
															"mode": 2
														},
														{
															"time": 0.5470789521017095,
															"value": 1.0333333333333334,
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
												"scale": 10
											},
											"children": [
												{
													"type": "curve",
													"name": "scale",
													"keys": [
														{
															"time": 0.4027046695737563,
															"value": 0,
															"mode": 2
														},
														{
															"time": 0.4212432404941159,
															"value": 0.9777777777777777,
															"mode": 2
														},
														{
															"time": 0.5410867753584885,
															"value": 0.9777777777777777,
															"mode": 2
														},
														{
															"time": 0.5570411472636543,
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
							"type": "subFX",
							"name": "FX_Explosion_High_Cinematic_SietchTabr",
							"source": "Fx/Explosion/FX_Explosion_High_Cinematic_SietchTabr.fx",
							"enabled": false,
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387
						},
						{
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"enabled": false,
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387,
							"time": 0.19034,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
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
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0653364907863725,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1333333333333333,
														"dt": -1.191087646484375
													},
													"nextHandle": {
														"dv": -0.6172737074886301,
														"dt": 0.6499597739869252
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
											0.7764705882352941,
											1,
											0.8
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.815,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.8949999999999999,
													"value": 0.2,
													"mode": 2
												}
											]
										}
									]
								}
							]
						},
						{
							"type": "subFX",
							"name": "FX_Unit_CommonSlash",
							"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
							"enabled": false,
							"x": -2.63077,
							"y": -0.51747,
							"z": -3.08387,
							"time": 0.28,
							"children": [
								{
									"type": "material",
									"name": "material",
									"props": {
										"PBR": {
											"mode": "Distortion",
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
													"time": 0,
													"value": 1,
													"mode": 2
												},
												{
													"time": 1.0653364907863725,
													"value": 0,
													"mode": 0,
													"prevHandle": {
														"dv": 1.1333333333333333,
														"dt": -1.191087646484375
													},
													"nextHandle": {
														"dv": -0.6172737074886301,
														"dt": 0.6499597739869252
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
											0.7764705882352941,
											1,
											0.8
										]
									},
									"children": [
										{
											"type": "curve",
											"name": "amount",
											"keys": [
												{
													"time": 0.815,
													"value": 0.9,
													"mode": 2
												},
												{
													"time": 0.8949999999999999,
													"value": 0.2,
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
					"name": "group",
					"editorOnly": true,
					"children": [
						{
							"type": "model",
							"name": "Male01_HarkonnenRabban",
							"source": "Character/Atreide/Unit/Duncan/Male01_AtreidesDuncan.fbx",
							"scaleX": 2.2,
							"scaleY": 2.2,
							"scaleZ": 2.2,
							"children": [
								{
									"type": "animEvent",
									"name": "animEvent",
									"animation": "Anim/Male01/Duncan/Anim_Male01_Duncan_AttackMelee02.fbx"
								}
							]
						},
						{
							"type": "model",
							"name": "Atreide_Sword_01",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": -90
						},
						{
							"type": "model",
							"name": "Atreide_Sword_02",
							"source": "Character/Atreide/Unit/Weapons/Atreide_Sword_01.fbx",
							"x": -0.04327,
							"y": -0.02477,
							"z": 0.1927,
							"scaleY": 1.0000000000000002,
							"scaleZ": 1.0000000000000002,
							"rotationX": 180
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_01",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_rClavicleJ.B_rShoulderJ.B_rElbowJ.B_rWristJ.B_Weapon.B_Whip01J"
						},
						{
							"type": "constraint",
							"name": "constraint",
							"object": "FXAnimation.FXRoot.group.Atreide_Sword_02",
							"target": "FXAnimation.FXRoot.group.Male01_HarkonnenRabban.root.B_ROOTJ.B_Spine01J.B_Spine02J.B_SpineTopJ.B_lClavicleJ.B_lShoulderJ.B_lElbowJ.B_lWristJ.B_lPalmJ.B_lFinger1J1"
						}
					]
				},
				{
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"enabled": false,
					"x": 3.20979,
					"y": -0.17726,
					"z": 3.22846,
					"scaleX": 0.8,
					"scaleY": 0.72,
					"scaleZ": 1.02,
					"rotationX": -60,
					"rotationY": -8.2,
					"rotationZ": -163.64,
					"time": -0.2,
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
									"emissive": 1,
									"depthTest": "LessEqual"
								}
							}
						},
						{
							"type": "shader",
							"name": "AlphaMult",
							"source": "shaders/AlphaMult.hx",
							"props": {
								"alpha": 0.11
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
											"time": 0,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.2545446777343758,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1333333333333333,
												"dt": -1.191087646484375
											},
											"nextHandle": {
												"dv": -0.6172737074886301,
												"dt": 0.6499597739869252
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
								"progress": 0.53,
								"saturation": 0,
								"width": 1,
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
									0.8431372549019608,
									1,
									0.8588235294117647
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.815,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.8949999999999999,
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
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 1.03601,
					"y": 0.01711,
					"z": 2.7105,
					"scaleX": 1.52,
					"scaleZ": 1.29,
					"rotationX": -31.3,
					"rotationY": 10,
					"rotationZ": -0.9,
					"time": 0.15,
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
											"time": 0.1499999999999999,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.4045446777343757,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1333333333333333,
												"dt": -1.191087646484375
											},
											"nextHandle": {
												"dv": -0.6172737074886301,
												"dt": 0.6499597739869252
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
								"progress": 0.65,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 2,
								"texture": "Fx/noise/Wave_01.jpg",
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
									0.42745098039215684,
									0.6392156862745098,
									0.403921568627451
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.9649999999999999,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.045,
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
					"type": "subFX",
					"name": "FX_Unit_CommonSlash",
					"source": "Fx/Unit/FX_Unit_Common_Slash.fx",
					"x": 3.09642,
					"y": -1.00012,
					"z": 3.22846,
					"scaleX": 1.55,
					"scaleZ": 1.25,
					"rotationX": -49.3,
					"rotationY": 9.3,
					"rotationZ": 24.55,
					"time": 0.26752,
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
											"time": 0.2749999999999999,
											"value": 1,
											"mode": 2
										},
										{
											"time": 1.5295446777343757,
											"value": 0,
											"mode": 0,
											"prevHandle": {
												"dv": 1.1333333333333333,
												"dt": -1.191087646484375
											},
											"nextHandle": {
												"dv": -0.6172737074886301,
												"dt": 0.6499597739869252
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
								"progress": 0.65,
								"saturation": 1,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 2,
								"texture": "Fx/noise/Wave_01.jpg",
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
									0.42745098039215684,
									0.6392156862745098,
									0.403921568627451
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 1.0899999999999999,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 1.17,
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
					"type": "polygon",
					"name": "Back_Sand_Stylised",
					"x": 0.45,
					"z": 1.21,
					"scaleX": 9,
					"scaleY": 10,
					"scaleZ": 0.1,
					"rotationX": -16.4,
					"rotationZ": -90,
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
									"emissive": 0.5,
									"drawOrder": "100"
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
								"alpha": 0.7,
								"uScale": 1,
								"vScale": 1,
								"uOffset": 0,
								"vOffset": 0,
								"texture": "Fx/Alphas/T_FlatSmoke.png"
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
								"progress": 0.5,
								"saturation": 0.5,
								"width": 1,
								"uvScaleX": 2,
								"uvScaleY": 2,
								"texture": "Fx/noise/T_Noise_Grunge_01.png",
								"uvShift": [
									0,
									0
								],
								"uvShiftSpeed": [
									0,
									1
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
											"time": 0.03528214757768505,
											"value": 0.8948601617813111,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.5337762368520101,
												"dt": 0.42926778498909995
											}
										},
										{
											"time": 0.9212087062075343,
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
								"sandBlend": 0.6,
								"sandColorSet": false,
								"envBlend": 0.4,
								"envColorSet": false
							}
						},
						{
							"type": "curve",
							"name": "position.x",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.21503536237214743,
									"value": 0.1,
									"mode": 0,
									"prevHandle": {
										"dv": 3.191729345188174,
										"dt": -0.2891727408212719
									},
									"nextHandle": {
										"dv": -3.191729345188174,
										"dt": 0.2891727408212719
									}
								},
								{
									"time": 1.6145425347004612,
									"value": -5,
									"mode": 2
								}
							]
						},
						{
							"type": "curve",
							"name": "scale",
							"keyMode": 0,
							"keys": [
								{
									"time": 0.13799827031737752,
									"value": 0,
									"mode": 0,
									"prevHandle": {
										"dv": -3.216730645116172,
										"dt": -0.5298503198629724
									},
									"nextHandle": {
										"dv": 0.9,
										"dt": 0.14824532747268693
									}
								},
								{
									"time": 1.3235113898224062,
									"value": 1,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 6.97987,
					"y": 0.09369,
					"z": 2.42,
					"scaleX": 5,
					"scaleY": 2.92,
					"scaleZ": 0.72,
					"rotationY": -31.4,
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
									"blend": "Add",
									"shadows": false,
									"culling": "None",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 5
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
								"texture": "Fx/Alphas/T_FlatFlash.png"
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
								"saturation": 0,
								"width": 1,
								"uvScaleX": 1,
								"uvScaleY": 1,
								"texture": "Fx/noise/Wave_01.jpg",
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.5516624009551171,
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
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.6170329055999092,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.6883794651925124,
												"dt": 0.022481199434944754
											}
										},
										{
											"time": 0.6921295913572618,
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
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.3,
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
									0.6666666666666666,
									1,
									0.7686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.7886896833911785,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.8595093555223261,
											"value": 0.2,
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
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.5996656641832356,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.6326023740798489,
											"value": 0.5333333333333333,
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
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.510375766442617,
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
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0298992507249083,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "polygon",
					"name": "Hit",
					"enabled": false,
					"x": 8.78244,
					"y": -0.57196,
					"z": 2.51321,
					"scaleX": 5,
					"scaleY": 2.46,
					"scaleZ": 1.82,
					"rotationY": -7.9,
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
									"blend": "Add",
									"shadows": false,
									"culling": "None",
									"depthTest": "LessEqual",
									"colorMask": 15,
									"enableStencil": false,
									"alphaKill": false,
									"parallax": 0,
									"textureWrap": true,
									"emissive": 5
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
								"texture": "Fx/Alphas/T_FlatFlash.png"
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
								"saturation": 0,
								"width": 1,
								"uvScaleX": 0.5,
								"uvScaleY": 0.5,
								"texture": "Fx/noise/Wave_01.jpg",
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
									"keyMode": 1,
									"keys": [
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1
										},
										{
											"time": 0.7198792930248168,
											"value": 0.01416666666666666,
											"mode": 1,
											"prevHandle": {
												"dv": 0.3775126578654911,
												"dt": -0.49657530216143814
											},
											"nextHandle": {
												"dv": 0.04863053766886394,
												"dt": 0.05148766239903668
											}
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1
										},
										{
											"time": 0.7681800712063401,
											"value": 0.9419580650329591,
											"mode": 1,
											"prevHandle": {
												"dv": -0.22616915345191968,
												"dt": -0.039999999999999925
											},
											"nextHandle": {
												"dv": -0.7137948892805313,
												"dt": 0.028257336767197883
											}
										},
										{
											"time": 0.8315143988551432,
											"value": 0.0010466200722588082,
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
								"sandBlend": 0.8,
								"sandColorSet": false,
								"envBlend": 0.3,
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
									0.6666666666666666,
									1,
									0.7686274509803921
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keys": [
										{
											"time": 0.8950133577551185,
											"value": 0.9,
											"mode": 2
										},
										{
											"time": 0.9473404017802758,
											"value": 0.2,
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
									1,
									0.13333333333333333,
									0
								]
							},
							"children": [
								{
									"type": "curve",
									"name": "amount",
									"keyMode": 0,
									"keys": [
										{
											"time": 0.7553478117668604,
											"value": 0.9,
											"mode": 0,
											"prevHandle": {
												"dv": -0.8165024079564438,
												"dt": -0.49978387723217654
											},
											"nextHandle": {
												"dv": 0.033333333333333326,
												"dt": 0.02040344573643249
											}
										},
										{
											"time": 0.7796839971365448,
											"value": 0.5333333333333333,
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
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
									"value": 0.1,
									"mode": 0
								},
								{
									"time": 0.6885221869546942,
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
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								},
								{
									"time": 1.0470740956033806,
									"value": 5,
									"mode": 2
								}
							]
						}
					]
				},
				{
					"type": "emitter",
					"name": "Shockwave",
					"props": {
						"warmUpTime": -0.7,
						"emitType": "Burst",
						"instScale": 11,
						"instRotation_rand": [
							0,
							0,
							360
						]
					},
					"x": 4.60194,
					"y": -0.45767,
					"z": 0.51099,
					"scaleX": 0.01,
					"scaleY": 0.01,
					"scaleZ": 0.01,
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
											"drawOrder": "100"
										}
									}
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
										"alpha": 1,
										"uScale": 1,
										"vScale": 1,
										"uOffset": 0,
										"vOffset": 0,
										"texture": "Fx/Alphas/T_ChocWave_Blurred_02.png"
									}
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.5,
										"sandColorSet": false,
										"envBlend": 0.5,
										"envColorSet": false
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
										"width": 0.23,
										"uvScaleX": 2,
										"uvScaleY": 2,
										"texture": "Fx/noise/Wave_01.jpg",
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
													"time": 0,
													"value": 1,
													"mode": 0,
													"prevHandle": {
														"dv": 1.41712157155829,
														"dt": -0.45256463091700333
													},
													"nextHandle": {
														"dv": -1.0333333333333334,
														"dt": 0.33171875000000084
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
									"value": 0.21666666666666667,
									"mode": 0,
									"prevHandle": {
										"dv": -2.090031350705387,
										"dt": -0.3895058426314596
									},
									"nextHandle": {
										"dv": 1.1,
										"dt": 0.20671875000000048
									}
								},
								{
									"time": 0.8467187500000021,
									"value": 1,
									"mode": 2
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
									0.9725490196078431,
									0.9725490196078431,
									0.9725490196078431
								]
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
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 20,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 3,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.7,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						]
					},
					"x": 4.60363,
					"y": -0.49999,
					"z": 0.48991,
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
										"alpha": 0.8
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
											0.9098039215686274,
											0.9098039215686274,
											0.9098039215686274
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
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
										"range": 28.79,
										"power": 38.64
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.7,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
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
										"dv": -0.040734981627899014,
										"dt": -0.6732812499999992
									},
									"nextHandle": {
										"dv": 0.016048606913192237,
										"dt": 0.2659338296837626
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
						"frameCount": 16,
						"frameDivisionX": 4,
						"frameDivisionY": 4,
						"spriteSheet": "Fx/Alphas/T_Smoke_4x4_04.png",
						"instScale": 20,
						"emitType": "Burst",
						"instStretch_rand": [
							0,
							0,
							0
						],
						"burstParticleCount": 3,
						"emitShape": "Cylinder",
						"emitRad1": 0.83,
						"emitSurface": true,
						"lifeTimeRand": 0.3,
						"alignMode": "Screen",
						"warmUpTime": -0.1,
						"emitOrientation": "Normal",
						"instSpeed_rand": [
							0,
							0,
							0
						],
						"seedGroup": 2,
						"lifeTime": 1.5,
						"burstDelay": 0.5,
						"instOffset_rand": [
							0,
							0,
							0
						],
						"instOffset": [
							0,
							0,
							2
						]
					},
					"x": 1.25602,
					"y": -0.49999,
					"z": 0.48991,
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
										"scale": 0.61
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
											0.9098039215686274,
											0.9098039215686274,
											0.9098039215686274
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
										"saturation": 0,
										"width": 1,
										"uvScaleX": 0.5,
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
										"range": 28.79,
										"power": 38.64
									},
									"isInstance": true
								},
								{
									"type": "fakeLight",
									"name": "FakeLight",
									"enabled": false,
									"normalMap": "Fx/DistortionMaps/SphereClean.png",
									"topIntensity": 0.4,
									"topSpan": 0.5,
									"dirIntensity": 0.5,
									"dirSpan": 0.9,
									"sandBlend": 0.7,
									"envBlend": 0.5
								},
								{
									"type": "shader",
									"name": "EnvColorMult",
									"source": "shaders/EnvColorMult.hx",
									"props": {
										"sandBlend": 0.6,
										"sandColorSet": false,
										"envBlend": 0.4,
										"envColorSet": false
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
										"dv": -0.040734981627899014,
										"dt": -0.6732812499999992
									},
									"nextHandle": {
										"dv": 0.016048606913192237,
										"dt": 0.2659338296837626
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
				}
			]
		}
	]
}